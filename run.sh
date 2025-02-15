#!/bin/bash

# Jika file .env ada, source agar variabel di dalamnya dapat digunakan
if [ -f .env ]; then
  set -a           
  source .env
  set +a
else
  echo ".env file tidak ditemukan. Pastikan file .env ada."
  exit 1
fi

# Pastikan variabel NETWORK_NAME terisi
if [ -z "$NETWORK_NAME" ]; then
  echo "Error: NETWORK_NAME tidak terdefinisi di file .env."
  exit 1
fi

# Cek apakah network sudah ada; jika tidak, buat network baru
if ! docker network inspect "$NETWORK_NAME" &>/dev/null; then
  echo "Network $NETWORK_NAME tidak ditemukan. Membuat network baru..."
  docker network create "$NETWORK_NAME"
else
  echo "Network $NETWORK_NAME sudah ada."
fi

# Jalankan docker-compose
echo "Menjalankan docker-compose..."
docker-compose up -d
