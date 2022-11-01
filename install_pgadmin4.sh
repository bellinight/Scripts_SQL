#!/bin/bash

### Inserir prepositorio pgadmin
echo "---- Inserindo repositório Pgadmin ---- "
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

### Instalar o pgadmin4
echo "---- Instalar Pgadmin4  ---- "
cd /home/pdv/Mercadologic/Compartilhamento/pgadmin4_packages
sudo dpkg -i * 

### Desinstalar pgadmin3
echo "---- Desinstalar Pgadmin3  ---- "
sudo apt-get remove --purge pgadmin3 -y

echo "---- Modificar atalho pgadmin4  ---- "
sudo printf '[Desktop Entry]\nName=pgAdmin 4\nComment=Ferramenta de Gerenciamento para PostgreSQL\nExec=/usr/pgadmin4/bin/pgadmin4\nTerminal=false\nType=Application\nIcon=/usr/pgadmin4/share/pgadmin4.ico\nCategories=Other\nMimeType=text/html\n#Categories=Development;Database;\nKeywords=PostgreSQL;SQL;' > /usr/share/applications/pgadmin4.desktop

echo "---- Processo concluído  ---- "