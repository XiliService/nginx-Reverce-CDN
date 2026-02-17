#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run as root${NC}"
  exit 1
fi

INSTALL_PATH="/usr/local/bin/n-cdn"
GITHUB_URL="https://raw.githubusercontent.com/im-JvD/nginx-Reverce-CDN/refs/heads/main/n-cdn.sh"

echo -e "${YELLOW}Installing n-cdn command...${NC}"

if ! command -v curl >/dev/null 2>&1; then
    echo -e "${YELLOW}curl not found. Installing...${NC}"
    apt update && apt install -y curl
fi

curl -fsSL "$GITHUB_URL" -o "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

echo -e "${GREEN}n-cdn installed successfully.${NC}"
echo ""

# ✅ اجرای یکباره منو
exec "$INSTALL_PATH"
