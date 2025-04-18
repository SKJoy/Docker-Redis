#!/bin/bash

THIS_SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/"

cd $THIS_SCRIPT_PATH
docker compose down
rm -f Redis/Log/server.log
docker compose up -d

echo ""
echo "Docker: Redis with Redis Commander"
echo "> Log flushed"
echo "> Containers started"
echo ""
