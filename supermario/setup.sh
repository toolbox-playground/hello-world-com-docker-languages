#!/bin/bash

# Script para facilitar setup do Super Mario Lab
# Lab Extra: Super Mario Game em Docker

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         🎮 Super Mario Game em Docker - Setup Script          ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar Docker
echo -e "${BLUE}[1/5]${NC} Verificando Docker..."
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}⚠️  Docker não está instalado!${NC}"
    echo "Instale Docker em: https://docs.docker.com/get-docker/"
    exit 1
fi
echo -e "${GREEN}✅ Docker encontrado: $(docker --version)${NC}"
echo ""

# Verificar Docker Daemon
echo -e "${BLUE}[2/5]${NC} Verificando Docker Daemon..."
if ! docker ps &> /dev/null; then
    echo -e "${YELLOW}⚠️  Docker Daemon não está rodando!${NC}"
    echo "Inicie o Docker e tente novamente."
    exit 1
fi
echo -e "${GREEN}✅ Docker Daemon está rodando${NC}"
echo ""

# Parar container anterior se existir
echo -e "${BLUE}[3/5]${NC} Verificando container anterior..."
if docker ps -a | grep -q "supermario-game"; then
    echo "ℹ️  Container 'supermario-game' encontrado."
    echo "Parando e removendo..."
    docker stop supermario-game 2>/dev/null || true
    docker rm supermario-game 2>/dev/null || true
    echo -e "${GREEN}✅ Container anterior removido${NC}"
fi
echo ""

# Baixar imagem
echo -e "${BLUE}[4/5]${NC} Baixando imagem do Docker Hub..."
echo "Isso pode levar alguns minutos (~500MB)..."
docker pull pengbai/docker-supermario
echo -e "${GREEN}✅ Imagem baixada com sucesso${NC}"
echo ""

# Executar container
echo -e "${BLUE}[5/5]${NC} Iniciando container..."
docker run -d -p 8080:8080 --name supermario-game pengbai/docker-supermario
echo -e "${GREEN}✅ Container iniciado${NC}"
echo ""

# Aguardar Tomcat iniciar
echo "Aguardando Tomcat iniciar..."
sleep 3

# Verificar se está rodando
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                      ✅ SUCESSO!                              ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
docker ps | grep supermario-game
echo ""
echo -e "${GREEN}🎮 Super Mario Game está pronto!${NC}"
echo ""
echo "Acesse em seu navegador:"
echo -e "${BLUE}http://localhost:8080${NC}"
echo ""
echo "Ou execute:"
echo "  open http://localhost:8080    (Mac)"
echo "  xdg-open http://localhost:8080 (Linux)"
echo "  start http://localhost:8080    (Windows)"
echo ""
echo "Para parar:"
echo "  docker stop supermario-game"
echo ""
echo "Para remover:"
echo "  docker rm supermario-game"
echo ""
