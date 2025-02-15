#!/bin/bash
set -euo pipefail

# Langsung mendefinisikan NetworkName untuk menghindari error
NETWORK_NAME="web"

# Cek apakah network sudah ada; jika tidak, buat network baru
if ! docker network inspect "$NETWORK_NAME" &>/dev/null; then
  echo "Network '$NETWORK_NAME' tidak ditemukan. Membuat network baru..."
  docker network create "$NETWORK_NAME"
else
  echo "Network '$NETWORK_NAME' sudah ada."
fi

# Jalankan docker compose
echo "Menjalankan docker compose..."
docker compose up -d
