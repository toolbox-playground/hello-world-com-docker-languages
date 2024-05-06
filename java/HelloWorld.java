// Importe as classes necessárias para criar um servidor HTTP e lidar com solicitações HTTP

import com.sun.net.httpserver.HttpServer; // A classe HttpServer fornece uma implementação simples de um servidor HTTP. Ela permite criar um servidor HTTP que escuta em uma porta especificada e lida com solicitações HTTP recebidas.
import com.sun.net.httpserver.HttpHandler; // A interface HttpHandler é usada para lidar com solicitações HTTP. Ela define um único método handle que recebe um objeto HttpExchange representando a solicitação e a resposta.
import com.sun.net.httpserver.HttpExchange; // A classe HttpExchange representa uma troca de solicitação e resposta HTTP. Ela fornece métodos para acessar os cabeçalhos da solicitação, o método da solicitação, o corpo da solicitação e para enviar a resposta.
import java.io.IOException; // A classe IOException é uma exceção que é lançada quando ocorre um erro de E/S. Ela é usada para lidar com operações de entrada/saída, como ler ou escrever em um arquivo ou conexão de rede.
import java.io.OutputStream; // A classe OutputStream é uma classe abstrata que representa um fluxo de saída de bytes. Ela fornece métodos para escrever bytes no fluxo de saída.
import java.nio.file.Files; // A classe Files fornece métodos para ler, escrever e manipular arquivos e diretórios.
import java.nio.file.Paths; // A classe Paths fornece métodos para trabalhar com caminhos de arquivos. Ela é usada para criar objetos Path que representam caminhos de arquivos ou diretórios.

public class HelloWorld {
    public static void main(String[] args) throws IOException {
        // Define a porta a ser utilizada pelo servidor
        int port = 8080;
        
        // Cria um servidor HTTP ouvindo na porta especificada
        HttpServer server = HttpServer.create(new java.net.InetSocketAddress(port), 0);
        
        // Define o manipulador para o caminho raiz ("/") como a classe MyHandler
        server.createContext("/", new MyHandler());
        
        // Define o executor como null, o que cria um executor padrão
        server.setExecutor(null);
        
        // Inicia o servidor
        server.start();
        
        // Imprime uma mensagem indicando que o servidor está em execução
        System.out.println("Agora ouvindo em: http://localhost:" + port);
    }

    // Classe de manipulador personalizado para processar solicitações HTTP
    static class MyHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            String response = "";
            
            try {
                // Lê o conteúdo do arquivo "index.html" em uma string
                response = new String(Files.readAllBytes(Paths.get("index.html")));
            } catch (IOException e) {
                e.printStackTrace();
                response = "Erro ao carregar o arquivo HTML";
            }

            // Define os cabeçalhos de resposta com um código de status 200 e o tamanho da resposta
            exchange.sendResponseHeaders(200, response.getBytes().length);
            
            // Obtém o fluxo de saída da resposta e escreve o conteúdo da resposta nele
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            
            // Fecha o fluxo de saída
            os.close();
        }
    }
}
