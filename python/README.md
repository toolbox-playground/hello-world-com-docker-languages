# Hello World Python com Docker
![Toolbox](../img/toolbox-playground.png)

## Uso Local

Para usar o projeto Hello World Python com Docker, siga estes passos:

1. Certifique-se de ter o Docker instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/).

2. Clone este repositório para sua máquina local através do comando abaixo:
    ```
    git clone https://github.com/toolbox-playground/hello-world-com-docker-languages.git
    ```

3. Abra o terminal ou prompt de comando e navegue até o diretório que você acabou de clonar.
   ```
    cd hello-world-com-docker-languages/python
   ```
4. Construa a imagem Docker:
    ```bash
    docker build -t hello-world-python .
    ```
    Obs.: Certifique-se que seu Docker está rodando.

5. Execute o contêiner Docker:
    ```bash
    docker run -p 5000:5000 hello-world-python
    ```

6. Abra seu navegador e visite `http://localhost:5000` para ver a mensagem "Bem-Vindo ao Hello World Flask Python".
