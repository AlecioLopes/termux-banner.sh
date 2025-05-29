#!/data/data/com.termux/files/usr/bin/bash

# Cores ANSI
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

clear

echo -e "${CYAN}====== INICIANDO SETUP AUTOMÁTICO DO BANNER ======${RESET}"

# Atualizando os pacotes
echo -e "${YELLOW}→ Atualizando pacotes...${RESET}"
pkg update -y && pkg upgrade -y

# Permissão de armazenamento
echo -e "${YELLOW}→ Solicitando permissão de armazenamento...${RESET}"
termux-setup-storage
sleep 2

# Instalando Git
echo -e "${YELLOW}→ Instalando o Git...${RESET}"
pkg install git -y

# Clonando repositório
echo -e "${YELLOW}→ Clonando repositório do banner...${RESET}"
git clone https://github.com/edielsontube/baneredielsontube

# Acessando diretório
cd baneredielsontube || { echo -e "${RED}Erro: diretório não encontrado.${RESET}"; exit 1; }

# Editando o bash.bashrc
echo -e "${GREEN}→ Agora vamos personalizar o texto do banner.${RESET}"
echo -e "${CYAN}Edite a linha onde aparece: 'INSCREVA-SE' para o que quiser.${RESET}"
echo -e "${CYAN}Use as setas para navegar, e após editar:${RESET}"
echo -e "${YELLOW}Para salvar: pressione Ctrl + O, depois Enter${RESET}"
echo -e "${YELLOW}Para sair: pressione Ctrl + X${RESET}"
sleep 5
nano bash.bashrc

# Executando o script do banner
echo -e "${GREEN}→ Aplicando o banner...${RESET}"
bash baner.sh

echo -e "${CYAN}====== SETUP FINALIZADO COM SUCESSO! 😎 ======${RESET}"
