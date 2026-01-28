#!/bin/bash

DIR_NAME=$(basename "$PWD")
ARCHIVE_NAME="${DIR_NAME}.tar.gz"

case "$1" in
    up)
        echo "🚀 Starting..."
        docker compose up -d
        ;;
    down)
        echo "🛑 Stopping..."
        docker compose stop
        ;;
    backup)
        echo "📦 Backing up..."
        docker compose stop
        rm -f "$ARCHIVE_NAME"
        sudo tar -cvzf "$ARCHIVE_NAME" -C .. "$DIR_NAME" --exclude="$DIR_NAME/*.tar.gz"
        sudo chown $USER:$USER "$ARCHIVE_NAME"
        echo "✅ Done: $ARCHIVE_NAME"
        ;;
    *)
        echo "Usage: ./run.sh {up|down|backup}"
        exit 1
        ;;
esac
