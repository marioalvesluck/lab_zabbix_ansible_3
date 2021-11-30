#!/bin/sh

sudo /usr/bin/mysql -B -h localhost -u USER -p"PASSWORD" NOMEDOBANCO -e "PURGE BINARY LOGS BEFORE '`date +%Y-%m-%d` 00:00:00';" 1>>/tmp/mysql_limpeza_logs.log 2>>/tmp/mysql_limpeza_logs.err
