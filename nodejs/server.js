// Importando os módulos necessários
let express = require('express'); // Módulo Express para criar o servidor
let path = require('path'); // Módulo Path para lidar com caminhos de arquivos
let fs = require('fs'); // Módulo File System para ler arquivos
let bodyParser = require('body-parser'); // Módulo Body Parser para analisar o corpo das requisições HTTP

// Criando uma instância do servidor Express
let app = express();

// Configurando o Body Parser para analisar requisições com corpos codificados em URL
app.use(bodyParser.urlencoded({
  extended: true
}));

// Configurando o Body Parser para analisar requisições com corpos em formato JSON
app.use(bodyParser.json());

// Rota para a página inicial ("/")
app.get('/', function (req, res) {
    // Enviando o arquivo index.html como resposta
    res.sendFile(path.join(__dirname, "index.html"));
});

// Rota para a página de perfil ("/profile")
app.get('/profile', function (req, res) {
  // Lendo o arquivo de imagem toolbox-playground.png
  let img = fs.readFileSync(path.join(__dirname, "img/toolbox-playground.png"));
  // Configurando o cabeçalho da resposta para indicar que é uma imagem JPG
  res.writeHead(200, {'Content-Type': 'image/jpg' });
  // Enviando a imagem como resposta
  res.end(img, 'binary');
});

// Rota curinga para qualquer outra rota não definida
app.get('*', function(req, res){
  // Enviando o arquivo index.html como resposta
  res.sendFile(path.join(__dirname, "index.html"));
});

// Iniciando o servidor na porta 8080
app.listen(8080, function () {
  console.log("Vamos nos divertir na porta 8080! Clique aqui: http://localhost:8080");
});