#!/bin/bash

RELEASE_URL="https://api.github.com/repos/masterskill77/quote-generator/releases/latest"

INSTALL_DIR="/usr/bin"

INSTALLATION_NAME="quote-generator.deb"

ASSET_NAME="quote-generator_0.1.0-1_amd64.deb"

# If Rust is not installed
if ! command -v rustc >/dev/null 2>&1; then
    echo "Rust is not installed, please install it"
    exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
    echo "Cargo is not installed, please install it"
    exit 1
fi

# Determine Operating System
DOWNLOAD_URL=$(curl -sSL $RELEASE_URL | grep -o "browser_download_url.*$ASSET_NAME\"" | cut -d ' ' -f 2)

# ASSET_URL=$(basename $DOWNLOAD_URL)

DOWNLOAD_URL=$(echo $DOWNLOAD_URL | tr -d '\"')

curl -SL $DOWNLOAD_URL -o /tmp/$INSTALLATION_NAME

# # Installing the binary

sudo dpkg -i /tmp/$INSTALLATION_NAME

rm /tmp/$INSTALLATION_NAME
