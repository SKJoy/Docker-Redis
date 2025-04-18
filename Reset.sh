#!/bin/bash

THIS_SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"

cd $THIS_SCRIPT_PATH
bash Backup.sh
docker compose down
rm -rf Data
rm -rf Log

bash ReStart.sh

echo "Reset"
echo "> Data reset"
echo "> Log reset"
echo "> User ACL not reset"
echo ""
