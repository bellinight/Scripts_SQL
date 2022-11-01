#!/bin/bash

sudo su
systemctl start postgresql@12-main
pg_lsclusters