#!/bin/bash

### Corrigir dpkg
cd /var/lib/dpkg
sudo rm lock-frontend
sudo rm lock

### Atualização PostgreSQL 12
echo "---- Instalaçao PostgreSQL 12 ---- "
cd /home/pdv/Mercadologic/Compartilhamento/pg12_packages
sudo dpkg -i *
sleep 2

echo "---- Parar serviço postgres ---- "
sudo service postgresql stop

echo "---- Renomear o Cluster da nova versao instalada ---- "
sudo pg_renamecluster 12 main main_pristine

echo "---- Atualizar o Cluster da versão antiga ---- "
sudo pg_upgradecluster 9.6 main

echo "---- Excluir cluster anterior ---- "
sudo pg_dropcluster 9.6 main
sudo pg_dropcluster 12 main_pristine

echo "---- Iniciar serviço postgres -------------------- "
sudo service postgresql start
sleep 2

###Configuração PostgreSQL
pwp='local'
sudo echo -e "$pwp\n$pwp" | passwd postgres
sleep 1

#Modificando parametros do usuário postgres
sudo -u postgres psql -U postgres -d postgres -c 'ALTER USER postgres SUPERUSER INHERIT CREATEDB CREATEROLE;'
sleep 1
sudo -u postgres psql -U postgres -d postgres -c "ALTER USER postgres PASSWORD 'local';"
sleep 1

echo "---- Parar serviço postgres ---- "
sudo service postgresql stop

echo "---- Mover postgresql.conf e pg_haba.conf ---- "
cd /home/pdv/Mercadologic/Compartilhamento/
sudo cp -f postgresql.conf /etc/postgresql/12/main/
sudo cp -f postgresql.conf /home/pdv/Mercadologic/Instalacao/Postgres
sudo cp -f pg_hba.conf /etc/postgresql/12/main/
sudo cp -f pg_hba.conf /home/pdv/Mercadologic/Instalacao/Postgres
sudo cp -f postgresql_origin.conf /home/pdv/Mercadologic/Instalacao/Postgres

echo "---- Iniciar serviço postgres -------------------- "
sudo service postgresql start