# 🎮 Lab Extra: Super Mario Game em Docker

## O que é este Lab?

Este é um exercício complementar que demonstra como executar uma aplicação web containerizada (Super Mario Game) usando Docker. É perfeito para consolidar conhecimentos de containerização, port mapping e networking.

## Objetivo

Aprender na prática como:
- ✅ Baixar imagens Docker do Docker Hub
- ✅ Executar containers em modo detached
- ✅ Realizar mapeamento de portas (port mapping)
- ✅ Acessar aplicações web via localhost
- ✅ Gerenciar o ciclo de vida de containers
- ✅ Compreender isolamento e reprodutibilidade

## Tecnologias

| Tecnologia | Versão | Função |
|------------|--------|--------|
| **Docker** | 27.5.1+ | Container Runtime |
| **Apache Tomcat** | 9.0.24 | HTTP Server |
| **Java** | OpenJDK 11 | Runtime |
| **Linux** | Alpine/Debian | Base OS |
| **HTML5/CSS3/JS** | Latest | Frontend (Enjine Framework) |

## Quick Start

### Pré-requisitos

- Docker instalado e rodando
- Navegador web (Chrome, Firefox, Safari)
- ~500MB de espaço em disco

### Passo 1: Baixar a Imagem Docker

```bash
docker pull pengbai/docker-supermario
```

Este comando baixa a imagem pré-configurada do Docker Hub (~500MB).

**Output esperado:**
```
latest: Pulling from pengbai/docker-supermario
092586df9206: Pull complete
ef599477fae0: Pull complete
[...]
Status: Downloaded newer image for pengbai/docker-supermario:latest
```

### Passo 2: Executar o Container

```bash
docker run -d -p 8080:8080 --name supermario-game pengbai/docker-supermario
```

**Parâmetros:**
- `-d` = Modo detached (executa em background)
- `-p 8080:8080` = Mapeia porta 8080 (host) → 8080 (container)
- `--name supermario-game` = Nome do container para fácil referência
- `pengbai/docker-supermario` = Imagem a executar

**Output esperado:**
```
6d91f17e6c6b25e4c06d366b4c6b7880c054c79cbd47ceef5ca849aa9c937324
```

(Este é o ID do container)

### Passo 3: Verificar Status

```bash
docker ps | grep supermario
```

**Output esperado:**
```
6d91f17e6c6b   pengbai/docker-supermario   "catalina.sh run"   Up 5 seconds   0.0.0.0:8080->8080/tcp   supermario-game
```

✅ Se aparecer com status "Up", o container está rodando!

### Passo 4: Acessar o Jogo

Abra seu navegador em:
```
http://localhost:8080
```

Ou via terminal:
```bash
open http://localhost:8080
```

Você deve ver:
- Logo Toolbox Playground animado
- Canvas do Super Mario
- Controles prontos para jogar

### Passo 5: Jogar! 🎮

| Controle | Ação |
|----------|------|
| **Seta ←** | Mover para esquerda |
| **Seta →** | Mover para direita |
| **Seta ↑** | Pular |
| **ESPAÇO** | Pular (alternativo) |

Divirta-se jogando Super Mario no seu navegador! 🍄

## Entendendo a Arquitetura

```
┌─────────────────────────────────────┐
│     SEU COMPUTADOR (HOST)           │
│  ┌──────────────────────────────┐   │
│  │  🌐 Navegador                │   │
│  │  localhost:8080              │   │
│  └────────┬─────────────────────┘   │
│           │                          │
│  ┌────────▼─────────────────────┐   │
│  │  🐳 Docker Daemon            │   │
│  │  Port Mapping: 8080→8080     │   │
│  └────────┬─────────────────────┘   │
└───────────┼──────────────────────────┘
            │
┌───────────▼──────────────────────────┐
│  🔒 CONTAINER (Isolado)              │
│  ┌──────────────────────────────┐    │
│  │  ☕ Java 11 + Tomcat 9.0.24  │    │
│  │  🎮 Super Mario Game         │    │
│  │     - HTML5                  │    │
│  │     - JavaScript (Enjine)    │    │
│  │     - Canvas Graphics        │    │
│  └──────────────────────────────┘    │
└──────────────────────────────────────┘
```

### Fluxo de Dados

1. **Request**: Browser → `http://localhost:8080`
2. **Docker**: Mapeia porta 8080 para container:8080
3. **Tomcat**: Recebe requisição na porta 8080
4. **App**: Retorna index.html + assets
5. **Render**: Browser renderiza página
6. **Game Loop**: Tudo acontece no JavaScript (sem HTTP adicional)

## Verificando Logs

Para ver logs da aplicação:

```bash
docker logs supermario-game
```

Exemplo de output:
```
05-Feb-2026 23:06:23.552 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name: Apache Tomcat/9.0.24
05-Feb-2026 23:06:25.030 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
05-Feb-2026 23:06:25.041 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [961] milliseconds
```

## Parando e Limpando

### Parar o Container

```bash
docker stop supermario-game
```

Container para, mas ainda existe.

### Reiniciar o Container

```bash
docker start supermario-game
```

Container volta a rodar.

### Remover o Container

```bash
docker rm supermario-game
```

Remove completamente (precisa estar parado primeiro, ou use `-f`).

### Remover Container Rodando

```bash
docker rm -f supermario-game
```

Remove container mesmo que esteja em execução.

### Remover Imagem

```bash
docker rmi pengbai/docker-supermario
```

Remove a imagem (se nenhum container a usar).

## Conceitos Aprendidos

### 1. Containerização
- ✅ Isolamento de aplicações
- ✅ Dependências auto-contidas
- ✅ Reprodutibilidade em qualquer máquina

### 2. Port Mapping
- ✅ Mapear porta host → container
- ✅ Múltiplos containers na mesma porta host
- ✅ Networking Docker

### 3. Container Lifecycle
- ✅ Pull (baixar imagem)
- ✅ Run (criar e iniciar)
- ✅ Stop (parar gracefully)
- ✅ Start (reiniciar)
- ✅ Remove (deletar)

### 4. Debugging
- ✅ `docker ps` - Lista containers
- ✅ `docker logs` - Visualiza logs
- ✅ `docker inspect` - Detalhes do container
- ✅ `docker exec` - Executa comando dentro do container

### 5. DevOps Best Practices
- ✅ Modo detached para background tasks
- ✅ Nomes significativos para containers
- ✅ Port mapping explícito
- ✅ Limpeza de recursos não usados

## Troubleshooting

### Porta 8080 já está em uso

**Problema:** `Error response from daemon: bind: address already in use`

**Solução:**

Encontre o container usando a porta:
```bash
docker ps | grep 8080
```

Pare o container:
```bash
docker stop <container-name>
```

Ou use outra porta:
```bash
docker run -d -p 8081:8080 --name supermario-game pengbai/docker-supermario
# Acesse http://localhost:8081
```

### Container não inicia

**Problema:** Container para logo após `docker run`

**Solução:** Verifique os logs
```bash
docker logs supermario-game
```

### Página não carrega (conexão recusada)

**Problema:** `Connection refused` ou `Can't reach localhost:8080`

**Solução:**

1. Verifique se container está rodando:
```bash
docker ps | grep supermario
```

2. Aguarde 5 segundos (Tomcat pode estar iniciando)

3. Verifique logs:
```bash
docker logs -f supermario-game
```

## Comparação com Outras Linguagens

Este repositório possui Hello World em múltiplas linguagens com Docker:

| Linguagem | Arquivo | Porta | Framework |
|-----------|---------|-------|-----------|
| **Node.js** | nodejs/ | 8080 | Express.js |
| **Python** | python/ | 5000 | Flask |
| **.NET** | dotnet/ | 8080 | ASP.NET Core |
| **Java** | java/ | 8080 | HttpServer |
| **Go** | go/ | 8080 | net/http |
| **Super Mario** | supermario/ | 8080 | Tomcat + Enjine |

## Recursos Adicionais

### Docker
- 📚 [Docker Documentation](https://docs.docker.com/)
- 📚 [Docker Tutorial](https://www.docker.com/101-tutorial/)
- 📚 [Best Practices](https://docs.docker.com/develop/dev-best-practices/)

### Super Mario Game
- 🎮 [Enjine Framework](https://github.com/Heroine/Enjine)
- 🎮 [Original Project](https://github.com/pengbai/docker-supermario)

### DevOps
- 📚 [DevOps Fundamentals](https://www.ibm.com/topics/devops)
- 📚 [Container Best Practices](https://cloud.google.com/architecture/best-practices-for-running-cost-effective-kubernetes-applications-on-gke)

## Próximos Passos

Após completar este lab, considere:

1. **Docker Compose** - Orquestrar múltiplos containers
2. **Kubernetes** - Orquestração em escala
3. **CI/CD Pipelines** - Automatizar deploy
4. **Container Registry** - Armazenar imagens customizadas
5. **Network Isolation** - Conectar containers via network

## Contribuindo

Se encontrar bugs ou tiver melhorias:

1. Fork o repositório
2. Crie uma branch (`git checkout -b feature/melhoria`)
3. Commit suas mudanças (`git commit -am 'Adiciona melhoria'`)
4. Push para a branch (`git push origin feature/melhoria`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT. Veja [LICENSE.md](../LICENSE.md) para detalhes.

---

**Status do Lab:** ✅ Completo
**Dificuldade:** ⭐⭐ Iniciante/Intermediário
**Tempo Estimado:** 10-15 minutos
**Últimas Atualizações:** Fevereiro de 2026

**Criado com ❤️ pela Toolbox Playground**
