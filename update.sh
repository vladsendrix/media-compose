#!/bin/bash

CONFIG_DIR="../configs"

ORIGINAL_DIR=$(pwd)

cd $CONFIG_DIR || { echo "Failed to change directory to $CONFIG_DIR"; exit 1; }

git add .
DATE_TIME=$(date '+%Y-%m-%d %H:%M:%S')
git commit -m "Backup before Docker update on $DATE_TIME"

if [ $? -ne 0 ]; then
    echo "Git commit failed. Exiting update script."
    exit 1
fi

cd $ORIGINAL_DIR || exit

docker compose pull

docker compose up -d

docker image prune -f

echo "Docker containers updated successfully."
