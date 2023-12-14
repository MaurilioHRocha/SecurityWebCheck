#!/bin/bash
 
# Script de Verifica    o de Configura    o de Seguran  a do Servidor Web
 
echo "######## Verifica    o de Seguran  a do Servidor Web ########"
echo
 
read -p "Digite o endere  o IP do servidor web: " ip
 
# Verifica a vers  o do servidor web
echo "[+] Verificando a vers  o do servidor web..."
curl -I $ip | grep "Server"
 
# Verifica se o servidor web permite listagem de diret  rios
echo "[+] Verificando se o servidor permite listagem de diret  rios..."
curl -s $ip | grep "<title>Index of"
 
# Verifica se o servidor web possui vulnerabilidades conhecidas
echo "[+] Verificando vulnerabilidades conhecidas..."
nmap -p 80 --script http-vuln* $ip
 
echo "## Fim da Verificao ##"