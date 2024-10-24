# Usa a imagem base oficial do Node.js (Para ambiente produtivo, lembre-se de evitar o uso de LATEST)
FROM node:latest

# Cria um diretório chamado "node-app" dentro do diretório home do container
RUN mkdir -p /home/node-app

# Define o diretório de trabalho como /home/node-app/ dentro do container
WORKDIR /home/node-app/

# Copia todos os arquivos e diretórios do diretório atual (onde o Dockerfile está localizado) para o diretório /home/node-app/ dentro do container
COPY . .

RUN ls

# Exponha a porta 8080
EXPOSE 8080

CMD ["npm", "start"]
# Define o comando padrão a ser executado quando o container é iniciado. Neste caso, ele executa o comando "node app/server.js", que inicia o servidor Node.js.
