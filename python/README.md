# Hello World Python com Docker
![Toolbox](../img/toolbox-playground.png)

## Uso Local

Para usar o projeto Hello World Python com Docker, siga estes passos:

1. Certifique-se de ter o Docker instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://www.docker.com](https://www.docker.com).

2. Abra o terminal ou prompt de comando e navegue até o diretório raiz do projeto.

3. Construa a imagem Docker:
    ```bash
    docker build -t hello-world-python .
    ```

4. Execute o contêiner Docker:
    ```bash
    docker run -p 5000:5000 hello-world-python
    ```

5. Abra seu navegador e visite `http://localhost:5000` para ver a mensagem "Bem-Vindo ao Hello World Flask Python".
