#!/bin/bash

time=$(date +%F)

PGPASSWORD="123123" pg_dump licence_server -h localhost -U ultima > ~/backups/backup-$time.sql


ftp_host="10.1.31.1"
ftp_username="user"
ftp_password="123123123"

ftp_begin="set ftp:passive-mode off"

backup_dir="ultima-licence-backups"

lftp -u $ftp_username:$ftp_password -e "$ftp_begin;put -O $backup_dir ./backups/backup-$time.sql;quit" $ftp_host
