# Use a imagem base do Golang
FROM golang:latest

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo hello.go para o diretório de trabalho
COPY . .

# Compile o arquivo hello.go
RUN go build -o hello hello.go

# Exporte a porta 8080  
EXPOSE 8080

# Defina o comando padrão a ser executado quando o contêiner for iniciado
CMD ["./hello"]