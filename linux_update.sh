#!/bin/bash

#--------------------------------------------------------------------#
# Processa Sistemas						     						 #
# Autor: Eduardo Tostes					         				     #
# Sistema criado para executar o processo de instalação dos PDVs     #
# As janelas seguem o fluxo normal de uma instalação                 #
#--------------------------------------------------------------------#

echo "---- Iniciando o processo de Atualização  ---- "

#Variaveis de ambiente
pw='pr0c3ss4'
pwp='local'

### Atualização do repositório

sudo rm -f /etc/apt/sources.list
printf ' #------------------------------------------------------------------------------#\n #                            OFFICIAL UBUNTU REPOS                  #\n #------------------------------------------------------------------------------#\n \n  ###### Ubuntu Main Repos\n deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse\n deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse \n \n  ###### Ubuntu Update Repos\n deb http://us.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse \n deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse \n deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse \n deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse \n ' > /etc/apt/sources.list

### Inserir repositório postgresql
echo "---- Inserindo repositório PostgreSQL ---- "
printf 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sleep 2
### Inserir repositorio haguichi
echo "---- Inserindo repositório Haguichi ---- "
sudo add-apt-repository ppa:webupd8team/haguichi -y
sleep 2
### Inserir repositorio VPN - L2TP
echo "---- Inserindo repositório VPN - L2TP  ---- "
sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp -y
sleep 2
### Inserir repositorio remmina
echo "---- Inserindo repositório Remmina  ---- "
sudo add-apt-repository ppa:remmina-ppa-team/remmina-next -y
sleep 2
### Inserir repositorio numix
echo "---- Inserindo repositório Numix  ---- "
sudo add-apt-repository ppa:numix/ppa -y
sleep 2
### Inserir repositorio openjdk
echo "---- Inserindo repositório Openjdk  ---- "
sudo add-apt-repository ppa:openjdk-r/ppa -y
sleep 2
### Atualizar repositorios
echo "---- Atualizar repositório interno ---- "
sudo apt-get update
sleep 2

### Corrigir dpkg
cd /var/lib/dpkg
sudo rm lock-frontend
sudo rm lock
sleep 2

### Atualizar Versão - 1-new_packages
echo "---- Instalação dos novos pacotes - 1-new_packages ---- "
cd /home/pdv/Mercadologic/Compartilhamento/1-new_packages
sudo dpkg -i *
sleep 2
### Atualizar Versão - 2-update_packages
echo "---- Atualização de pacotes - 2-update_packages ---- "
cd /home/pdv/Mercadologic/Compartilhamento/2-update_packages
sudo dpkg -i *
sleep 2
### Atualizar Versão - 3-correcao_packages
echo "---- Correção de pacotes - 3-correcao_packages ---- "
cd /home/pdv/Mercadologic/Compartilhamento/3-correcao_packages
sudo dpkg -i *
sleep 2
### Atualizar Versão - 4-essential_packages
echo "---- Instalaçao e atualização de pacotes essenciais- 4-essential_packages ---- "
cd /home/pdv/Mercadologic/Compartilhamento/4-essential_packages
sudo dpkg -i *
sleep 2
### Atualização 
echo "---- Atualizando e corrigindo pacotes se necessário  ----"
sudo apt-get update
sudo apt-get autoremove -y
sleep 2
### Substituindo pasta Mercadologic/Instalacao
echo "---- Substituindo pasta Mercadologic/Instalacao ----"
sudo rm -rf /home/pdv/Mercadologic/Instalacao
sudo cp -rf /home/pdv/Mercadologic/Compartilhamento/Versao/Instalacao /home/pdv/Mercadologic/
sleep 2
### Atualizar repositorio de arquivos udev
echo "---- Regras Udev ---- "
sudo cp -rf /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/20-SAM4S-USB-Printer.rules /etc/udev/rules.d 
sudo cp -rf /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/69-bema.rules /etc/udev/rules.d
sudo cp -rf /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/69-bema_old.rules /etc/udev/rules.d
sudo cp -rf /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/50-persistent-usb.rules /etc/udev/rules.d
sleep 2
###Auto execução do sistema Mercadologic ao iniciar
echo "---- Inicializar o ML validando data/hora ---- "
sudo printf '[Desktop Entry]\nExec=bash /home/pdv/Mercadologic/Instalacao/Data_hora/exec_data_hora.sh\nType=Application' > /home/pdv/.config/autostart/mercadologic.desktop
sleep 2
###Moldar Menu
echo "---- Moldar Menu ---- "
sudo mv /usr/share/applications/org.gnome.DiskUtility.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/galculator.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/gedit.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/file-roller.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/pcmanfm.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/ 
sudo mv /usr/share/applications/gucharmap.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/ 
sudo mv /usr/share/applications/gpicview.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/winefish.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/display-im6.q16.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/display-im6.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/evince.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/firefox.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/x11vnc.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/alsamixergui.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/pavucontrol.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/wine-notepad.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/wine-winecfg.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/wine-uninstaller.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/wine-browsedrive.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/winetricks.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/update-manager.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/lubuntu-software-center.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/usb-creator-gtk.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/fcitx.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/synaptic.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/gdebi.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/users.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/network.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/lxsession-default-apps.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/software-properties-drivers.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/fcitx-configtool.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/blueman-manager.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/openjdk-8-policytool.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/software-properties-gtk.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/language-selector.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/lxinput.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sudo mv /usr/share/applications/lightdm-gtk-greeter-settings.desktop /home/pdv/Mercadologic/Instalacao/Atalhos/
sleep 2
### Apagar inicializador Remmina (arquivo alterado consta na pasta Atalhos)
	#Comando para que não apareça: NoDisplay=false no arquivo .desktop
sudo rm -f /usr/share/applications/org.remmina.Remmina.desktop
sleep 2
###Numlock
echo "---- Validar Numlock ---- "
sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/50-unity-greeter.conf /usr/share/lightdm/lightdm.conf.d/
sleep 2
#Definindo Compartilhamento
echo "---- Definir configurações do samba ---- "
sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/smb.conf /etc/samba/
sudo printf "$pw\n$pw\n" | smbpasswd -a pdv
sleep 2
###Adicionando correção do driver intel para placas antigas
echo "---- Adicionando correção do driver intel para placas antigas ---- "
printf 'Section "Device"\n  Identifier "Card0"\n  Driver "Intel"\n  Option "AccelMethod""uxa"\nEndSection' > /usr/share/X11/xorg.conf.d/20-intel.conf
sleep 2
###Configuração do VNC
echo "---- Configurando do VNC ---- "
sudo mkdir /home/pdv/.config/autostart/
sudo x11vnc -storepasswd pr0c3ss4 /etc/x11vnc.pass
sudo chmod 777 /etc/x11vnc.pass
sudo cp -f /home/pdv/Mercadologic/Instalacao/VNC/x11vncrc /home/pdv/.x11vncrc
sudo printf '[Desktop Entry]\nExec=x11vnc\nType=Application' > /home/pdv/.config/autostart/vnc.desktop
sleep 2
###Atalhos Mercadologic
echo "---- Configurando Atalhos usados pelo Mercadologic ---- "
sudo cp -f /home/pdv/Mercadologic/Instalacao/Configurador/config.desktop /usr/share/applications/
sudo cp -f /home/pdv/Mercadologic/Instalacao/App/kill-java.desktop /usr/share/applications/
sudo cp -f /home/pdv/Mercadologic/Instalacao/Balanca-Teste/balanca.desktop /usr/share/applications/
sudo cp -f /home/pdv/Mercadologic/Instalacao/Executar_PDV/mercadologic.desktop /usr/share/applications/
sleep 2
###Instalacao das impressoras
echo "---- Atualizando arquivos de configuração das impressoras ---- "

echo "####### Instalando Epson ####### "

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/rastertotmt /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/rastertotmt
sudo chown root:root /usr/lib/cups/filter/rastertotmt

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/rastertotmu /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/rastertotmu
sudo chown root:root /usr/lib/cups/filter/rastertotmu

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/backend/tmbaprn /usr/lib/cups/backend
sudo chmod 755 /usr/lib/cups/backend/tmbaprn
sudo chown root:root /usr/lib/cups/backend/tmbaprn

echo "####### Instalando Bematech ####### "

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/bemabmpthreshold /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/bemabmpthreshold
sudo chown root:root /usr/lib/cups/filter/bemabmpthreshold

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/bemafilters.sh /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/bemafilters.sh
sudo chown root:root /usr/lib/cups/filter/bemafilters.sh

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/rastertobema /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/rastertobema
sudo chown root:root /usr/lib/cups/filter/rastertobema

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/backend/usbbema /usr/lib/cups/backend
sudo chmod 755 /usr/lib/cups/backend/usbbema
sudo chown root:root /usr/lib/cups/backend/usbbema

echo "####### Instalando Daruma ####### "

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/DARUMACupsFilter /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/DARUMACupsFilter
sudo chown root:root /usr/lib/cups/filter/DARUMACupsFilter

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/usr.sbin.cupsd /etc/apparmor.d
sudo chmod 640 /etc/apparmor.d/usr.sbin.cupsd
sudo chown root:root /etc/apparmor.d/usr.sbin.cupsd

echo "####### Instalando Sweda ####### " 

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/pdftoellix40s /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/pdftoellix40s
sudo chown root:root /usr/lib/cups/filter/pdftoellix40s


echo "####### Instalando Elgin ####### " 

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/rastertohprt /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/rastertohprt
sudo chown root:root /usr/lib/cups/filter/rastertohprt

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/filter/RasterToSPrinter /usr/lib/cups/filter
sudo chmod 755 /usr/lib/cups/filter/RasterToSPrinter
sudo chown root:root /usr/lib/cups/filter/RasterToSPrinter

echo "####### Regras Udev ####### " 

sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/20-SAM4S-USB-Printer.rules /etc/udev/rules.d 
sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/69-bema.rules /etc/udev/rules.d
sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/69-bema_old.rules /etc/udev/rules.d
sudo cp -f /home/pdv/Mercadologic/Compartilhamento/Versao/Impressoras/udev/50-persistent-usb.rules /etc/udev/rules.d
sleep 2
###Finalizando processo de atualização
echo "---- Finalizado processo de atualização---- "
