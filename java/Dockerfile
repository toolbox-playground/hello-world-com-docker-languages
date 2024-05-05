# Use a imagem base do OpenJDK
FROM openjdk:11

# Copie o arquivo hello.java para o diretório de trabalho do contêiner
COPY hello.java /app/

# Defina o diretório de trabalho como /app
WORKDIR /app

# Compile o arquivo hello.java
RUN javac hello.java

# Execute o arquivo compilado
CMD ["java", "hello"]