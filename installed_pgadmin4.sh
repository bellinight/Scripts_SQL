#!/bin/bash

### Desinstalar pgadmin3
echo "---- Desinstalar Pgadmin3  ---- "
sudo apt-get remove --purge pgadmin3 -y

### Trocar pgadmin4.desktop
sudo printf '[Desktop Entry]\nEncoding=UTF-8\nName=pgAdmin 4\nExec=/usr/pgadmin4/bin/pgadmin4\nIcon=/usr/pgadmin4/share/pgadmin4.ico\nType=Application\nCategories=Other\nMimeType=text/html\nComment=Management tools for PostgreSQL\nKeywords=database;db;sql;query;administration;development;' > /usr/share/applications/pgadmin4.desktop