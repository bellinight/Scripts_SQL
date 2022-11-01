#!/bin/bash
versaoml="/home/pdv/Mercadologic/Instalacao/Versao_ML"
bkpml="/home/pdv/Mercadologic/Instalacao/Versao_ML/Backup"
config="/home/pdv/Mercadologic/Instalacao/Versao_ML/Backup/PDV/config.properties"
cconfig="/home/pdv/Mercadologic/Instalacao/Versao_ML/Backup/PDV/config/config.properties"

#Funçao valida existência da pasta Versao_ML
if  [ -d $versaoml ]; then
  echo "pasta existe"
else
  sudo mkdir $versaoml
fi

#Função para validação da existencia da pasta Backup, caso não exista será criada e caso haja será apagada e criada uma nova.
if [ -d $bkpml ]; then
  # Caso já exista, a pasta deverá ser excluída para a criação da nova pasta
  sudo rm -rf $bkpml
  # Criação do novo diretório Backup
  sudo mkdir $bkpml
else
  sudo mkdir $bkpml
fi

#Mover os arquivos da pasta /var/PDV/ para pasta Backup
sudo mv -f /var/PDV/ $bkpml

# Criar pasta /var/PDV
sudo mkdir /var/PDV

#Copiando 'config.properties' /var/PDV/config
sudo mkdir /var/PDV/config
if [ -f $config ]; then
  sudo cp $config /var/PDV/config
else
  sudo cp $cconfig /var/PDV/config
fi

sudo chmod 777 -R /var/PDV