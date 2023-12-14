#!/bin/bash

# Script de Verificação de Configuração de Segurança do Servidor Web

echo "######## Verificação de Segurança do Servidor Web ########"
echo

read -p "Digite o endereço IP do servidor web: " ip

# Verifica a versão do servidor web
echo "[+] Verificando a versão do servidor web..."
curl -I $ip | grep "Server"

# Verifica se o servidor web permite listagem de diretórios
echo "[+] Verificando se o servidor permite listagem de diretórios..."
curl -s $ip | grep "<title>Index of"

# Verifica se o servidor web possui vulnerabilidades conhecidas
echo "[+] Verificando vulnerabilidades conhecidas..."
nmap -p 80 --script http-vuln* $ip

echo "######## FIM *******"
exit 0