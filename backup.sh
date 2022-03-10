#!/bin/bash

NOW=$(date +%Y%m%d%H%M%S)
SQL_BACKUP=${NOW}_database.sql
FILES_BACKUP=${NOW}_files.tar.gz

DB_NAME=$(sed -n "s/define( *'DB_NAME', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_USER=$(sed -n "s/define( *'DB_USER', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_PASSWORD=$(sed -n "s/define( *'DB_PASSWORD', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_HOST=$(sed -n "s/define( *'DB_HOST', *'\([^']*\)'.*/\1/p" wp-config.php)

# Base de datos
mysqldump --add-drop-table -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOST $DB_NAME > ../backups/$SQL_BACKUP 2>&1

# Compresión de la bbdd
gzip ../backups/$SQL_BACKUP

# Backup directorio
tar -zcf ../backups/$FILES_BACKUP .

# Borralo al cabo de 1 mes
rm -f ../backups/$(date +%Y%m%d* --date='1 mes').gz

