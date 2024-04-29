# Define a imagem base
FROM python:3.9-slim

# Define o diretório de trabalho
WORKDIR /python-docker

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt requirements.txt

# Instala as dependências do projeto
RUN pip3 install -r requirements.txt

# Copia todos os arquivos do diretório atual para o diretório de trabalho
COPY . .

# Exporta a porta 5000
EXPOSE 5000

# Define o comando a ser executado quando o container for iniciado
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]