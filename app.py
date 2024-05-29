import telebot
from gradio_client import Client
from flask import Flask, request, abort

# Substitua pelo token do seu bot
API_TOKEN = '6911510369:AAHzz8jiLZIPElv_cA241cE7CbGj1pUsuUc'

# Inicializa o bot do Telegram
bot = telebot.TeleBot(API_TOKEN)

# Inicializa o cliente do Gradio
client = Client("https://lukz770-chat-luna.hf.space")

# Inicializa o aplicativo Flask
app = Flask(__name__)

# Rota para receber as mensagens do bot do Telegram
@app.route('/webhook', methods=['POST'])
def webhook():
    if request.headers.get('content-type') == 'application/json':
        json_string = request.get_data().decode('utf-8')
        update = telebot.types.Update.de_json(json_string)
        bot.process_new_updates([update])
        return ''
    else:
        abort(403)

# Função para tratar mensagens de texto
@bot.message_handler(func=lambda message: True)
def handle_message(message):
    user_input = message.text

    # Envia a ação de "digitando..." para o usuário
    bot.send_chat_action(message.chat.id, 'typing')

    # Envia a mensagem para o chatbot e recebe a resposta
    result = client.predict(
        message=user_input,
        request="You are Ayla a  friendly Chatbot, and you speak Portuguese.",
        param_3=512,
        param_4=0.2,
        param_5=0.95,
        api_name="/chat"
    )

    # Envia a resposta do chatbot de volta ao usuário no Telegram
    bot.reply_to(message, result)

# Inicia o bot
if __name__ == '__main__':
    app.run(debug=True)
