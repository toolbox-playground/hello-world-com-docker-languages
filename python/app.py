from flask import Flask  # Importe o módulo Flask

app = Flask(__name__)  # Crie uma aplicação Flask

@app.route('/')  # Defina uma rota para a URL raiz ("/")
def hello_world():  # Defina uma função para lidar com a requisição da URL raiz
    return 'Bem-Vindo ao Hello World Flask Python'  # Retorne a string "Hello, World!" como resposta

if __name__ == '__main__':  # Verifique se o script está sendo executado diretamente (não importado)
    app.run()  # Inicie a aplicação Flask