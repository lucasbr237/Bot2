<!DOCTYPE html>  
<html lang="pt-BR">  
<head>  
  <meta charset="UTF-8"/>  
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
  <title>LoveCounter - Modo Criação</title>  
  <script src="https://cdn.tailwindcss.com"></script>  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
  <style>  
    @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&family=Poppins:wght@300;400;600;700&display=swap');  
    
    .font-dancing {  
      font-family: 'Dancing Script', cursive;  
    }  
      
    .font-poppins {  
      font-family: 'Poppins', sans-serif;  
    }  
      
    .heart-pulse {  
      animation: heartBeat 1.5s infinite;  
    }  
      
    @keyframes heartBeat {  
      0% { transform: scale(1); }  
      14% { transform: scale(1.2); }  
      28% { transform: scale(1); }  
      42% { transform: scale(1.2); }  
      70% { transform: scale(1); }  
    }  
      
    .photo-slider img {  
      transition: all 0.5s ease;  
    }  
      
    .gradient-text {  
      background: linear-gradient(to right, #ff66c4, #ff3366);  
      -webkit-background-clip: text;  
      -webkit-text-fill-color: transparent;  
    }  
      
    .bg-stars {  
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='400' viewBox='0 0 800 800'%3E%3Cg fill='none' stroke='%23404' stroke-width='1'%3E%3Cpath d='M769 229L1037 260.9M927 880L731 737 520 660 309 538 40 599 295 764 126.5 879.5 40 599-197 493 102 382-31 229 126.5 79.5-69-63'/%3E%3Cpath d='M-31 229L237 261 390 382 603 493 308.5 537.5 101.5 381.5M370 905L295 764'/%3E%3Cpath d='M520 660L578 842 731 737 840 599 603 493 520 660 295 764 309 538 390 382 539 269 769 229 577.5 41.5 370 105 295 -36 126.5 79.5 237 261 102 382 40 599 -69 737 127 880'/%3E%3Cpath d='M520-140L578.5 42.5 731-63M603 493L539 269 237 261 370 105M902 382L539 269M390 382L102 382'/%3E%3Cpath d='M-222 42L126.5 79.5 370 105 539 269 577.5 41.5 927 80 769 229 902 382 603 493 731 737M295-36L577.5 41.5M578 842L295 764M40-201L127 80M102 382L-261 269'/%3E%3C/g%3E%3Cg fill='%23505'%3E%3Ccircle cx='769' cy='229' r='5'/%3E%3Ccircle cx='539' cy='269' r='5'/%3E%3Ccircle cx='603' cy='493' r='5'/%3E%3Ccircle cx='731' cy='737' r='5'/%3E%3Ccircle cx='520' cy='660' r='5'/%3E%3Ccircle cx='309' cy='538' r='5'/%3E%3Ccircle cx='295' cy='764' r='5'/%3E%3Ccircle cx='40' cy='599' r='5'/%3E%3Ccircle cx='102' cy='382' r='5'/%3E%3Ccircle cx='127' cy='80' r='5'/%3E%3Ccircle cx='370' cy='105' r='5'/%3E%3Ccircle cx='578' cy='42' r='5'/%3E%3Ccircle cx='237' cy='261' r='5'/%3E%3Ccircle cx='390' cy='382' r='5'/%3E%3C/g%3E%3C/svg%3E");  
    }

    /* Modal Styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 100;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.8);
      transition: all 0.3s ease;
    }

    .modal-content {
      background-color: #0a0f2a;
      margin: 10% auto;
      padding: 20px;
      border: 1px solid #ff3366;
      width: 80%;
      max-width: 500px;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(255, 51, 102, 0.3);
      transition: all 0.3s ease;
    }

    .close {
      color: #ff3366;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: #fff;
      text-decoration: none;
      cursor: pointer;
    }
  </style>  
</head>  
<body class="bg-[#0a0f2a] text-white font-poppins leading-relaxed bg-stars">  
  <!-- HEADER -->  
  <header class="flex justify-between items-center px-6 py-4 bg-[#0a0f2a] sticky top-0 z-50 border-b border-gray-800 backdrop-blur-sm bg-opacity-80">  
    <div class="flex items-center space-x-2">  
      <a href="index.html" class="flex items-center space-x-2">  
        <div class="w-10 h-10 bg-gradient-to-br from-pink-500 to-pink-600 rounded-md flex items-center justify-center">  
          <i class="fas fa-heart text-white heart-pulse"></i>  
        </div>  
        <h1 class="text-xl font-bold">LoveCounter</h1>  
      </a>  
    </div>  
    <div class="flex items-center space-x-4 text-sm">  
      <a href="#" class="px-2 py-1 bg-[#0a0f2a] border border-green-500 rounded-md hover:bg-green-900 transition">🇧🇷 PT</a>  
      <a href="#" class="px-2 py-1 hover:bg-gray-800 rounded-md transition">🇺🇸 EN</a>  
    </div>  
  </header>
  
  <!-- FORMULÁRIO DE CONFIGURAÇÃO -->
  <section class="py-8 px-6">
    <div class="max-w-4xl mx-auto">
      <h2 class="text-3xl font-bold gradient-text mb-6">Quase lá</h2>
      </h3>
      <p class="text-gray-400 mb-8 text-center">Preencha os dados para criar seu contador</p>
      

<div class="bg-[#121233] p-2 rounded-lg text-center border border-pink-700 mb-8 relative overflow-hidden">

<div class="bg-[#121233] p-2 rounded-lg text-center ">
  
  <p class="text-sm text-white mb-4">Pagamento único, 6 fotos e música de fundo, para tornar sua lembrança ainda mais especial.</p>
  <p class="font-bold text-white text-2xl mb-4">R$14</p>
  
  <!-- Ícone de Verificação na Borda -->
  <div class="absolute top-0 right-0 p-2 text-white">
    <i class="fas fa-check-circle text-green-500 text-2xl"></i>
  </div>

</div>
  

  <!-- Marca de destaque -->
  <div class="absolute top-0 left-0 right-0 bottom-0 bg-pink-500 opacity-20 rounded-lg -z-10"></div>
</div>
  
      
      <div class="bg-[#121233] rounded-2xl border border-pink-700 p-6 mb-8">
        <h3 class="text-xl font-medium mb-4">Informações do casal</h3>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
          <div>
            <label class="block text-gray-300 mb-2 text-sm">Nome do primeiro parceiro</label>
            <input type="text" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" placeholder="Ex: Anna" id="partner1Name">
          </div>
          <div>
            <label class="block text-gray-300 mb-2 text-sm">Nome do segundo parceiro</label>
            <input type="text" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" placeholder="Ex: Pedro" id="partner2Name">
          </div>
        </div>
        
        <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Mes de início do relacionamento</label>
          <input type="date" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" id="relationshipStart">
        </div>
        
                <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Dia de início do relacionamento</label>
          <input type="date" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" id="relationshipStart">
        </div>
        
        <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Mensagem personalizada</label>
          <textarea class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500 h-24" placeholder="Escreva uma mensagem bonita para seu amor..." id="customMessage"></textarea>
        </div>
        
        
        <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Escolha sua música(Opcional)</label>
          <input type="text" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" placeholder="URL do YouTube">
        </div>
        
                <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm"> Data espaciais(Opcional)</label>
          <input type="date" class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500" id="relationshipStart">
        </div>
        
                
        <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Mensagem personalizada</label>
          <textarea class="w-full bg-[#0a0f2a] border border-pink-700 rounded-lg px-4 py-2 focus:outline-none focus:border-pink-500 h-24" placeholder="Escreva uma mensagem bonita para seu amor..." id="customMessage"></textarea>
        </div>
        
        <div class="mb-6">
          <label class="block text-gray-300 mb-2 text-sm">Fotos (máximo 6)</label>
          <div class="flex items-center justify-center w-full">
            <label class="flex flex-col w-full h-32 border-2 border-dashed border-pink-700 rounded-lg hover:bg-[#0a0f2a] hover:border-pink-500 transition cursor-pointer">
              <div class="flex flex-col items-center justify-center pt-7">
                <i class="fas fa-cloud-upload-alt text-pink-500 text-3xl mb-2"></i>
                <p class="text-sm text-gray-400">Arraste suas fotos aqui ou clique para selecionar</p>
              </div>
              <input type="file" class="hidden" multiple accept="image/*">
            </label>
          </div>
        </div>
        
        <div class="flex justify-center">
          <button class="px-6 py-3 bg-gradient-to-r from-pink-600 to-pink-500 rounded-lg hover:from-pink-700 hover:to-pink-600 transition shadow-lg" id="saveSettings">
            Salvar configurações
          </button>
        </div>
      </div>
      
      <!-- Preview Section -->  
      <div class="text-center mb-8">
        <h2 class="text-2xl font-bold mb-6">Seu contador ficará assim👇</h2>
      </div>
    </div>
  </section>
  
  <!-- PREVIEW SECTION -->  
  <section class="py-6 px-6 min-h-screen flex flex-col items-center justify-center">  
    <div class="max-w-4xl mx-auto w-full bg-[#121233] rounded-2xl border border-pink-700 overflow-hidden">  
      <!-- Top Banner with Photos -->  
      <div class="relative h-64 md:h-80 overflow-hidden">  
        <div class="absolute inset-0 photo-slider flex transition-transform duration-1000">  
          <img src="https://picsum.photos/800/400" alt="Casal Feliz 1" class="w-full h-full object-cover object-center" />  
          <img src="https://picsum.photos/800/401" alt="Casal Feliz 2" class="w-full h-full object-cover object-center" />  
          <img src="https://picsum.photos/800/402" alt="Casal Feliz 3" class="w-full h-full object-cover object-center" />  
        </div>  
        <div class="absolute inset-0 bg-gradient-to-t from-[#121233] to-transparent"></div>  
        <div class="absolute bottom-0 left-0 w-full p-6 text-center">  
          <h2 class="text-4xl md:text-5xl font-dancing font-bold gradient-text" id="preview-names">Luiza e Pedro</h2>  
        </div>  
      </div>
      
      <!-- Counter Section -->  
      <div class="p-8 text-center">  
        <div class="mb-10">  
          <p class="text-lg md:text-xl font-medium text-gray-300 mb-3">Vocês estão juntos há</p>  
          <div class="flex justify-center space-x-4 md:space-x-8">  
            <div class="w-20 md:w-24 h-24 md:h-28 bg-[#0a0f2a] rounded-lg border border-pink-500 flex flex-col items-center justify-center">  
              <span class="text-3xl md:text-4xl font-bold text-pink-500 counter-years">2</span>  
              <span class="text-xs md:text-sm text-gray-400">anos</span>  
            </div>  
            <div class="w-20 md:w-24 h-24 md:h-28 bg-[#0a0f2a] rounded-lg border border-pink-500 flex flex-col items-center justify-center">  
              <span class="text-3xl md:text-4xl font-bold text-pink-500 counter-months">3</span>  
              <span class="text-xs md:text-sm text-gray-400">meses</span>  
            </div>  
            <div class="w-20 md:w-24 h-24 md:h-28 bg-[#0a0f2a] rounded-lg border border-pink-500 flex flex-col items-center justify-center">  
              <span class="text-3xl md:text-4xl font-bold text-pink-500 counter-days">15</span>  
              <span class="text-xs md:text-sm text-gray-400">dias</span>  
            </div>  
          </div>  
        </div>  
          
        <div class="my-8">  
          <div class="flex items-center justify-center space-x-2 mb-4">  
            <div class="h-px bg-pink-500 w-16"></div>  
            <i class="fas fa-heart text-pink-500 heart-pulse"></i>  
            <div class="h-px bg-pink-500 w-16"></div>  
          </div>  
          <p class="text-xl md:text-2xl font-dancing" id="preview-date">Desde 15 de Novembro de 2022</p>  
        </div>  
          
        <div class="my-10 max-w-2xl mx-auto">  
          <blockquote class="italic text-gray-300 text-lg md:text-xl" id="preview-message">  
            "Cada dia ao seu lado é uma nova jornada de amor e descobertas.   
            Nosso caminho juntos é o melhor presente que a vida poderia me dar.   
            Te amo mais a cada nascer do sol! ❤️"  
          </blockquote>  
        </div>  
      </div>  
        
      <!-- Stats Section -->  
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4 p-6 bg-[#0a0f2a] border-t border-pink-700">  
        <div class="text-center">  
          <p class="text-2xl md:text-3xl font-bold text-pink-500">834</p>  
          <p class="text-xs md:text-sm text-gray-400">dias juntos</p>  
        </div>  
        <div class="text-center">  
          <p class="text-2xl md:text-3xl font-bold text-pink-500">119</p>  
          <p class="text-xs md:text-sm text-gray-400">semanas</p>  
        </div>  
        <div class="text-center">  
          <p class="text-2xl md:text-3xl font-bold text-pink-500">20016</p>  
          <p class="text-xs md:text-sm text-gray-400">horas</p>  
        </div>  
        <div class="text-center">  
          <p class="text-2xl md:text-3xl font-bold text-pink-500">27</p>  
          <p class="text-xs md:text-sm text-gray-400">meses</p>  
        </div>  
      </div>  
        
      <!-- Mini Photo Gallery -->  
      <div class="p-6 grid grid-cols-3 md:grid-cols-6 gap-2">  
        <img src="https://picsum.photos/150/150" alt="Momento especial 1" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer" />  
        <img src="https://picsum.photos/151/150" alt="Momento especial 2" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer" />  
        <img src="https://picsum.photos/152/150" alt="Momento especial 3" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer" />  
        <img src="https://picsum.photos/153/150" alt="Momento especial 4" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer md:block" />  
        <img src="https://picsum.photos/154/150" alt="Momento especial 5" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer md:block" />  
        <img src="https://picsum.photos/155/150" alt="Momento especial 6" class="w-full h-24 object-cover rounded-lg hover:opacity-80 transition cursor-pointer md:block" />  
      </div>  
        
      <!-- YouTube Video -->  
      <div class="p-6 border-t border-pink-700">  
        <h3 class="text-xl font-medium mb-4 text-center">Nossa Música</h3>  
        <div class="aspect-w-16 aspect-h-9 rounded-lg overflow-hidden">  
          <iframe width="100%" height="315" src="https://www.youtube.com/embed/JfCr8ktyHw4?si=MzsJQUTeKBPh_WzR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen class="rounded-lg"></iframe>
        </div>  
      </div>  
        
      <!-- Special Dates -->  
      <div class="p-6 border-t border-pink-700">  
        <h3 class="text-xl font-medium mb-4 text-center">Datas Especiais</h3>  
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">  
          <div class="bg-[#0a0f2a] p-4 rounded-lg border border-pink-700">  
            <p class="text-pink-400 font-medium"> (Pedro)</p>  
            <p class="text-sm text-gray-300">❤️</p>  
          </div>  
          <div class="bg-[#0a0f2a] p-4 rounded-lg border border-pink-700">  
            <p class="text-pink-400 font-medium">(Luiza)</p>  
            <p class="text-sm text-gray-300">❤️</p>  
          </div>  
          <div class="bg-[#0a0f2a] p-4 rounded-lg border border-pink-700 col-span-1 md:col-span-2">  
            <p class="text-pink-400 font-medium">Próximo Aniversário de Namoro</p>  
            <p class="text-sm text-gray-300">Faltam <span class="font-bold">255</span> dias</p>  
          </div>  
        </div>  
      </div>  
    </div>  

      <!-- Share Section -->  
      <div class="p-6 text-center bg-[#0a0f2a] border-t border-pink-700">  
        <p class="mb-4 text-gray-300">Compartilhe seu amor com o mundo</p>  
        <div class="flex justify-center space-x-3">  
          <a href="#" class="w-10 h-10 bg-[#121233] rounded-full flex items-center justify-center hover:bg-pink-900 transition">  
            <i class="fab fa-facebook-f text-pink-500"></i>  
          </a>  
          <a href="#" class="w-10 h-10 bg-[#121233] rounded-full flex items-center justify-center hover:bg-pink-900 transition">  
            <i class="fab fa-twitter text-pink-500"></i>  
          </a>  
          <a href="#" class="w-10 h-10 bg-[#121233] rounded-full flex items-center justify-center hover:bg-pink-900 transition">  
            <i class="fab fa-instagram text-pink-500"></i>  
          </a>  
          <a href="#" class="w-10 h-10 bg-[#121233] rounded-full flex items-center justify-center hover:bg-pink-900 transition">  
            <i class="fab fa-whatsapp text-pink-500"></i>  
          </a>  
        </div>  
      </div>  
        

      <!-- QR Code Section -->
      <div class="p-6 text-center bg-[#0a0f2a] border-t border-pink-700">
        <h1 class="text-xl font-medium mb-4">"As melhores lembranças são aquelas que tocam o coração." – Elias Hope
</h1>

<!-- PLANS -->
<div class="bg-[#121233] p-6 rounded-lg text-center border border-pink-700 mb-8 relative overflow-hidden">
  <p class="text-sm text-white mb-4">
    Tudo em um único pagamento. Sem taxas extras ou mensalidades, um gesto de carinho que dura para sempre. ✅
  </p>
  <p class="font-bold text-white text-2xl mb-6">R$14</p>

  <!-- Botão de Compra com Ícone de Carrinho -->
  <div class="flex justify-center mb-6"> <!-- Centraliza o botão -->
    <button id="generateQRBtn" class="px-6 py-3 bg-gradient-to-r from-pink-600 to-pink-500 rounded-lg hover:from-pink-700 hover:to-pink-600 transition shadow-lg flex items-center justify-center">
      Compra agora <i class="fas fa-shopping-cart ml-2"></i>
    </button>
  </div>

  <!-- Bandeiras de Cartões (Imagens reais) -->
  <div class="flex justify-center gap-6 mb-6">
    <!-- Visa -->
    <img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Logo_Visa_2020.png" alt="Visa" class="w-12 h-12">
    <!-- Mastercard -->
    <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.svg" alt="Mastercard" class="w-12 h-12">
    <!-- American Express -->
    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/American_Express_logo_2018.svg" alt="American Express" class="w-12 h-12">
    <!-- Pix -->
    <img src="https://upload.wikimedia.org/wikipedia/commons/3/37/Pix_logo.svg" alt="Pix" class="w-12 h-12">
  </div>

  <p class="text-sm text-gray-400 mb-2 mt-4">Após a confirmação do pagamento, o QR code e o link para a página serão gerados com os dados fornecidos.😊</p>
</div>
    </section>  <!-- FAQ -->  <section class="py-16 px-6 bg-[#0a0f2a] border-t border-gray-800">
    <h3 class="text-3xl font-bold text-center mb-10 text-pink-300">Perguntas Frequentes</h3>
    <div class="max-w-3xl mx-auto">
      <details class="mb-4 bg-[#121233] p-5 rounded-lg">
        <summary class="font-semibold cursor-pointer flex items-center justify-between text-pink-300">
          <span>Como posso compartilhar o contador?</span>
          <i class="fas fa-chevron-down text-pink-500"></i>
        </summary>
        <p class="text-gray-400 mt-4">Após criar seu contador, você receberá um link exclusivo e um QR code. Você pode compartilhar o link por mensagem, e-mail ou redes sociais, ou mostrar o QR code para que seu amor possa escanear e acessar.</p>
      </details><details class="mb-4 bg-[#121233] p-5 rounded-lg">
    <summary class="font-semibold cursor-pointer flex items-center justify-between text-pink-300">
      <span>Posso alterar as fotos depois de criar?</span>
      <i class="fas fa-chevron-down text-pink-500"></i>
    </summary>
    <p class="text-gray-400 mt-4">Sim! Você pode editar seu contador a qualquer momento após a criação. Acesse sua conta, vá para "Meus Contadores" e clique em "Editar" para alterar fotos, mensagens ou qualquer outro detalhe.</p>
  </details>
  
  <details class="mb-4 bg-[#121233] p-5 rounded-lg">
    <summary class="font-semibold cursor-pointer flex items-center justify-between text-pink-300">
      <span>Por quanto tempo meu contador ficará disponível?</span>
      <i class="fas fa-chevron-down text-pink-500"></i>
    </summary>
    <p class="text-gray-400 mt-4">Seu contador ficará disponível por tempo ilimitado! Com nosso plano único de apenas R$10, você tem acesso vitalício ao seu contador personalizado.</p>
  </details>
  
  <details class="mb-4 bg-[#121233] p-5 rounded-lg">
    <summary class="font-semibold cursor-pointer flex items-center justify-between text-pink-300">
      <span>Posso adicionar mais de uma música ao contador?</span>
      <i class="fas fa-chevron-down text-pink-500"></i>
    </summary>
    <p class="text-gray-400 mt-4">No momento, é possível adicionar apenas uma música de fundo ao contador. Você pode escolher entre nossa biblioteca de músicas românticas ou fazer upload de uma música personalizada (limitado a 5MB).</p>
  </details>
  
  <details class="mb-4 bg-[#121233] p-5 rounded-lg">
    <summary class="font-semibold cursor-pointer flex items-center justify-between text-pink-300">
      <span>Posso criar mais de um contador com o mesmo plano?</span>
      <i class="fas fa-chevron-down text-pink-500"></i>
    </summary>
    <p class="text-gray-400 mt-4">Cada plano de R$10 permite a criação de um contador personalizado. Se desejar criar mais contadores, será necessário adquirir planos adicionais, um para cada contador.</p>
  </details>
</div>


  <!-- FOOTER -->  
  <footer class="py-8 px-6 border-t border-gray-800">  
    <div class="max-w-4xl mx-auto">  
      <div class="flex flex-col md:flex-row justify-between items-center">  
        <div class="flex items-center space-x-2 mb-4 md:mb-0">  
          <div class="w-8 h-8 bg-gradient-to-br from-pink-500 to-pink-600 rounded-md flex items-center justify-center">  
            <i class="fas fa-heart text-white text-xs"></i>  
          </div>  
          <span class="text-sm font-medium">LoveCounter</span>  
        </div>  
        <div class="flex space-x-4 text-sm text-gray-400">  
          <a href="#" class="hover:text-white transition">Termos</a>  
          <a href="#" class="hover:text-white transition">Privacidade</a>  
          <a href="#" class="hover:text-white transition">Suporte</a>  
          <a href="#" class="hover:text-white transition">Contato</a>  
        </div>  
      </div>  
      <p class="text-center text-xs text-gray-500 mt-6">© 2025 LoveCounter. Todos os direitos reservados.</p>  
    </div>  
  </footer>
  <!-- SCRIPTS -->  
  <script>  
    // Simple countdown calculator  
    function updateCountdown() {  
      // Example start date: Nov 15, 2022  
      const startDate = new Date('2022-11-15');  
      const currentDate = new Date();  
        
      // Calculate time difference  
      const timeDiff = currentDate - startDate;  
        
      // Calculate days, months, years  
      const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));  
      const years = Math.floor(days / 365);  
      let remainingDays = days % 365;  
      const months = Math.floor(remainingDays / 30);  
      remainingDays = remainingDays % 30;  
        
      // Update the HTML elements  
      document.querySelectorAll('.counter-years').forEach(el => {  
        el.textContent = years;  
      });  
        
      document.querySelectorAll('.counter-months').forEach(el => {  
        el.textContent = months;  
      });  
        
      document.querySelectorAll('.counter-days').forEach(el => {  
        el.textContent = remainingDays;  
      });  
    }  
      
    // Photo slider functionality  
    let currentSlide = 0;  
    const totalSlides = 3; // Added more slides  
      
    function nextSlide() {  
      currentSlide = (currentSlide + 1) % totalSlides;  
      updateSlider();  
    }  
      
    function updateSlider() {  
      const slider = document.querySelector('.photo-slider');  
      if (slider) {  
        slider.style.transform = `translateX(-${currentSlide * 100}%)`;  
      }  
    }
    
    // QR Code Functionality
    document.addEventListener('DOMContentLoaded', function() {
      // Get the modal
      const modal = document.getElementById('qrModal');
      
      // Get the button that opens the modal
      const btn = document.getElementById('generateQRBtn');
      
      // Get the <span> element that closes the modal
      const span = document.getElementsByClassName('close')[0];
      
      // When the user clicks the button, generate QR and open the modal
      btn.onclick = function() {
        generateQRCode();
        modal.style.display = 'block';
      }
      
      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
        modal.style.display = 'none';
      }
      
      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = 'none';
        }
      }
      
      // Download QR Code
      document.getElementById('downloadQRBtn').addEventListener('click', function() {
        const canvas = document.querySelector('#qrcode canvas');
        if (canvas) {
          const link = document.createElement('a');
          link.download = 'andre-carol-qrcode.png';
          link.href = canvas.toDataURL('image/png');
          link.click();
        }
      });
    });
    
    // Generate QR Code
    function generateQRCode() {
      const qrcodeContainer = document.getElementById('qrcode');
      qrcodeContainer.innerHTML = '';
      
      const currentUrl = window.location.href;
      
      new QRCode(qrcodeContainer, {
        text: currentUrl,
        width: 200,
        height: 200,
        colorDark: '#ff3366',
        colorLight: '#ffffff',
        correctLevel: QRCode.CorrectLevel.H
      });
    }
      
    // Run on page load  
    updateCountdown();  
      
    // Set interval for slider  
    setInterval(nextSlide, 5000);  
  </script>