#!/bin/bash

THIS_SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"
CURRENT_DATE_TIME=$(date '+%Y-%m-%d-%H-%M-%S');
BACKUP_FILE="Backup/Docker-Redis-${CURRENT_DATE_TIME}.zip"

cd $THIS_SCRIPT_PATH
docker compose down
mkdir Backup
zip -r9 ${BACKUP_FILE} . -x Backup/\*

bash ReStart.sh

echo "Backup"
echo "> File = ${BACKUP_FILE}"
echo ""
