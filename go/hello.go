// Declaração do pacote principal
package main

// Importa os pacotes necessários para o programa
import (
	"fmt"      // Pacote para formatação de texto e saída
	"net/http" // Pacote para lidar com solicitações HTTP
)

// handler é uma função que lida com requisições HTTP
func handler(w http.ResponseWriter, r *http.Request) {
	// Serve o arquivo index.html
	http.ServeFile(w, r, "index.html")

	// Imprime o endereço remoto da requisição
	fmt.Println("Acesso à porta 8080 de:", r.RemoteAddr)
}

func main() {
	// Imprime a URL do servidor
	fmt.Println("Agora escutando em: http://localhost:8080")

	// Registra a função handler para lidar com requisições para o caminho raiz "/"
	http.HandleFunc("/", handler)

	// Serve arquivos estáticos do diretório "/static/"
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))

	// Inicia o servidor HTTP e escuta na porta 8080
	http.ListenAndServe(":8080", nil)
}
