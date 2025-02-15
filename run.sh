#!/bin/bash

# Pastikan argumen NetworkName diberikan saat menjalankan script
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 NetworkName"
  exit 1
fi

NETWORK_NAME="$1"

# Cek apakah network sudah ada; jika tidak, buat network baru
if ! docker network inspect "$NETWORK_NAME" &>/dev/null; then
  echo "Network $NETWORK_NAME tidak ditemukan. Membuat network baru..."
  docker network create "$NETWORK_NAME"
else
  echo "Network $NETWORK_NAME sudah ada."
fi

# Jalankan docker-compose
echo "Menjalankan docker-compose..."
docker compose up -d 
