from flask import Flask, render_template  # Importe o módulo Flask

app = Flask(__name__)  # Crie uma aplicação Flask

@app.route('/')  # Defina uma rota para a URL raiz ("/")
def hello_world():  # Defina uma função para lidar com a requisição da URL raiz
    return render_template('index.html')  # Renderiza o template index.html

if __name__ == '__main__':  # Verifique se o script está sendo executado diretamente (não importado)
    app.run(host="127.0.0.1", port=5000, debug=True) # Inicie a aplicação Flask