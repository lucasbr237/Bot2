import os
import telebot
from telebot.types import InlineKeyboardButton, InlineKeyboardMarkup
from huggingface_hub import InferenceClient

# Inicializa o cliente de inferência
client = InferenceClient(api_key="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")

# Substitua pelo seu token do bot
API_TOKEN = '7421986854:AAFx3Kz_Sd_hMxZ0v8-nV5dnAsTFJyLplgY'
bot = telebot.TeleBot(API_TOKEN)

# Inicializa um dicionário para armazenar URLs de imagens
bot.image_urls = {}

# Função para criar pasta do usuário
def create_user_folder(user_id):
    folder_path = f'./users/{user_id}'
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
    return folder_path

# Função para salvar imagem no diretório do usuário
def save_image(user_id, file_path, file_name):
    folder_path = create_user_folder(user_id)
    file_path_full = os.path.join(folder_path, file_name)
    
    # Baixa o arquivo e salva na pasta do usuário
    downloaded_file = bot.download_file(file_path)
    with open(file_path_full, 'wb') as new_file:
        new_file.write(downloaded_file)
    
    return file_path_full

# Função para registrar logs das interações
def log_interaction(user_id, interaction):
    folder_path = create_user_folder(user_id)
    log_file = os.path.join(folder_path, 'interactions_log.txt')
    with open(log_file, 'a') as f:
        f.write(f'\n\n{interaction}\n')  # Adiciona uma linha em branco entre as interações

@bot.message_handler(commands=['start'])
def start(message):
    welcome_message = (
        "<b>Bem-vindo ao Bot de Análise de Imagens!</b>\n\n"
        "<b>O que você pode fazer:</b>\n\n"
        "1. 🖼 <b>Extrair Texto de Imagens:</b> Transforme textos de fotos em formato digital.\n\n"
        "2. 🔍 <b>Análise de Imagens:</b> Receba análises completas e insights sobre suas imagens.\n\n"
        "3. 🤔 <b>Tirar Dúvidas:</b> Envie suas imagens e obtenha respostas rápidas para suas perguntas sobre elas!\n\n"
        "<i>Envie uma imagem pra começar!</i>"
    )
    bot.send_message(message.chat.id, welcome_message, parse_mode='HTML')

@bot.message_handler(content_types=['photo'])
def handle_photo(message):
    # Obtém a imagem enviada
    photo_file = bot.get_file(message.photo[-1].file_id)
    photo_url = f'https://api.telegram.org/file/bot{API_TOKEN}/{photo_file.file_path}'

    # Salva a imagem no diretório do usuário
    image_path = save_image(message.chat.id, photo_file.file_path, f"{message.photo[-1].file_id}.jpg")

    # Cria os botões inline lado a lado
    keyboard = InlineKeyboardMarkup()
    keyboard.add(
        InlineKeyboardButton("Adicionar texto", callback_data='add_text'),
        InlineKeyboardButton("Análise sem texto", callback_data='analyze_without_text')
    )

    # Envia a mensagem com os botões
    bot.send_message(message.chat.id, "Escolha uma das opções:", reply_markup=keyboard)

    # Armazena a URL da imagem e o caminho local no dicionário para uso posterior
    bot.image_urls[message.chat.id] = {"url": photo_url, "path": image_path}

# Função para lidar com os botões
@bot.callback_query_handler(func=lambda call: True)
def button(call):
    if call.data == 'add_text':
        bot.send_message(call.message.chat.id, 
                         "Por favor, digite o texto, que pode ser uma observação sobre o que vê, ou uma pergunta.")
        bot.register_next_step_handler(call.message, get_user_input, 'add_text')
    elif call.data == 'analyze_without_text':
        bot.send_message(call.message.chat.id, "Processando sua solicitação, aguarde...")
        image_data = bot.image_urls.get(call.message.chat.id)
        prompt = "Forneça uma descrição breve e clara do conteúdo da imagem."
        process_image(call.message.chat.id, image_data['url'], prompt)

# Função para obter o texto do usuário
def get_user_input(message, option):
    user_text = message.text
    image_data = bot.image_urls.get(message.chat.id)  # Recupera a URL e caminho da imagem armazenada
    prompt = f"{user_text}."
    
    # Log da interação do usuário
    log_interaction(message.chat.id, f"Texto adicional do usuário: {user_text}")
    
    bot.send_message(message.chat.id, "Processando sua solicitação, aguarde...")  # Mensagem de processamento

    # Verifica se a imagem está disponível
    if image_data is None:
        bot.send_message(message.chat.id, "Erro: Nenhuma imagem encontrada. Tente enviar a imagem novamente.")
        return
    
    process_image(message.chat.id, image_data['url'], prompt)

# Função para processar a imagem
def process_image(chat_id, photo_url, prompt):
    response_content = ""
    log_interaction(chat_id, f"Solicitação de processamento da imagem: {photo_url} com prompt '{prompt}'")

    # Verificando se a URL da imagem está correta
    if not photo_url:
        bot.send_message(chat_id, "Erro: URL da imagem não está disponível.")
        return

    # Envie uma solicitação para a API Hugging Face
    for message in client.chat_completion(
        model="meta-llama/Llama-3.2-11B-Vision-Instruct",
        messages=[
            {
                "role": "user",
                "content": [
                    {"type": "image_url", "image_url": {"url": photo_url}},
                    {"type": "text", "text": prompt},
                ],
            }
        ],
        max_tokens=5000,
        stream=True,
        temperature=0.5,
        top_p=0.9,
    ):
        response_content += message.choices[0].delta.content  # Armazena todas as partes

    # Log da resposta completa e envio ao usuário
    log_interaction(chat_id, f"Resposta da API: {response_content}")
    bot.send_message(chat_id, response_content)

# Inicia o bot
if __name__ == '__main__':
    bot.polling() 