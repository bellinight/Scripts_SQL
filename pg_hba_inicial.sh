#!/bin/bash

pg9="/etc/postgresql/9.6/main/"
pg10="/etc/postgresql/10/main/"
pg12="/etc/postgresql/12/main/"

sudo service postgresql stop
sleep 2

if [ -d "$pg9" ]; then
	sudo cp -f /home/pdv/Mercadologic/Compartilhamento/pg_hba.conf /etc/postgresql/9.6/main/
	sleep 2

elif [ -d "$pg10" ]; then
	sudo cp -f /home/pdv/Mercadologic/Compartilhamento/pg_hba.conf /etc/postgresql/10/main/
	sleep 2

elif [ -d "$pg12" ]; then
	sudo cp -f /home/pdv/Mercadologic/Compartilhamento/pg_hba.conf /etc/postgresql/12/main/
	sleep 2

fi

pg_atual="/home/pdv/Mercadologic/Instalacao/Postgres/atual"

if [ -d $pg_atual ]; then
  sudo rm -rf $pg_atual
fi

sudo mkdir $pg_atual
sudo mv -f pg_hba.conf $pg_atual
sudo mv -f postgresql.conf $pg_atual
sudo mv -f postgresql_origin.conf $pg_atual

sudo service postgresql start
sleep 2
