import telebot
from gradio_client import Client


# Substitua pelo token do seu bot
API_TOKEN = '6911510369:AAHzz8jiLZIPElv_cA241cE7CbGj1pUsuUc'

# app.py

import telebot
from gradio_client import Client

# Substitua pelo token do seu bot
API_TOKEN = '6911510369:AAHzz8jiLZIPElv_cA241cE7CbGj1pUsuUc'

# Inicializa o bot do Telegram
bot = telebot.TeleBot(API_TOKEN)

# Inicializa o cliente do Gradio
client = Client("https://lukz770-chat-luna.hf.space")

# Função para tratar mensagens de texto
def handle_message(message):
    user_input = message.text

    # Envia a ação de "digitando..." para o usuário
    bot.send_chat_action(message.chat.id, 'typing')

    # Envia a mensagem para o chatbot e recebe a resposta
    result = client.predict(
        message=user_input,
        request="You are Ayla a friendly Chatbot, and you speak Portuguese.",
        param_3=512,
        param_4=0.2,
        param_5=0.95,
        api_name="/chat"
    )

    # Envia a resposta do chatbot de volta ao usuário no Telegram
    bot.reply_to(message, result)

# Exponha a função para o Gunicorn
app = handle_message
