#!/bin/bash

NOW=$(date +%Y%m%d%H%M%S)
SQL_BACKUP=${NOW}_database.sql
FILES_BACKUP=${NOW}_files.tar.gz

DB_NAME=$(sed -n "s/define( *'DB_NAME', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_USER=$(sed -n "s/define( *'DB_USER', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_PASSWORD=$(sed -n "s/define( *'DB_PASSWORD', *'\([^']*\)'.*/\1/p" wp-config.php)
DB_HOST=$(sed -n "s/define( *'DB_HOST', *'\([^']*\)'.*/\1/p" wp-config.php)

# Backup database
mysqldump --add-drop-table -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOST $DB_NAME > ../backups/$SQL_BACKUP 2>&1

# Compress the database dump file
gzip ../backups/$SQL_BACKUP

# Backup the entire public directory
tar -zcf ../backups/$FILES_BACKUP .

# Remove backup files that are a month old
rm -f ../backups/$(date +%Y%m%d* --date='1 month ago').gz
