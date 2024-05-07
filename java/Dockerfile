# Use a imagem base do OpenJDK
FROM openjdk:17-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo hello.go para o diretório de trabalho
COPY . .

# Compile o arquivo Java
RUN javac HelloWorld.java

# Exporte a porta 8080  
EXPOSE 8080

# Execute o programa Java
CMD ["java", "HelloWorld"]