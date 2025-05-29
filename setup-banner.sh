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

# Verificando se git está instalado
if ! command -v git &> /dev/null; then
    echo -e "${RED}→ Git não encontrado. Instalando...${RESET}"
    pkg install git -y
else
    echo -e "${GREEN}→ Git já está instalado.${RESET}"
fi

# Verificando se nano está instalado
if ! command -v nano &> /dev/null; then
    echo -e "${RED}→ Nano não encontrado. Instalando...${RESET}"
    pkg install nano -y
else
    echo -e "${GREEN}→ Nano já está instalado.${RESET}"
fi

# Clonando repositório
echo -e "${CYAN}→ Clonando o repositório...${RESET}"
git clone https://github.com/edielsontube/baneredielsontube

# Acessando diretório
cd baneredielsontube || { echo -e "${RED}Erro: diretório não encontrado.${RESET}"; exit 1; }

# Solicitando entrada personalizada
echo -e "${CYAN}→ Qual texto você quer no lugar de 'INSCREVA-SE'?${RESET}"
read -p "Digite seu nome ou frase personalizada: " user_text

# Substituindo o texto
sed -i "s/INSCREVA-SE/${user_text}/g" bash.bashrc

# Edição manual opcional
echo -e "${GREEN}→ Caso deseje ajustar mais detalhes do banner:${RESET}"
echo -e "${CYAN}Use as setas para navegar até o texto desejado.${RESET}"
echo -e "${YELLOW}Para salvar: pressione Ctrl + O, depois Enter${RESET}"
echo -e "${YELLOW}Para sair: pressione Ctrl + X${RESET}"
sleep 5
nano bash.bashrc

# Executando o script do banner
echo -e "${YELLOW}→ Aplicando o banner...${RESET}"
bash baner.sh

echo -e "${GREEN}✔️ Setup finalizado com sucesso! Reinicie o Termux para ver o novo banner.${RESET}"

#Todos os direitos reservados a Layout's (Alécio Lopes)
