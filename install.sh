#!/bin/bash

readonly BLUE="$(tput setaf 4 2>/dev/null || echo '')"
readonly GREEN="$(tput setaf 2 2>/dev/null || echo '')"
readonly NO_COLOR="$(tput sgr0 2>/dev/null || echo '')"

RELEASE_URL="https://api.github.com/repos/masterskill77/quote-generator/releases/latest"

INSTALL_DIR="/usr/bin"

INSTALLATION_NAME="quote-generator.deb"

ASSET_NAME="quote-generator_0.1.0-1_amd64.deb"

# Determine Operating System
DOWNLOAD_URL=$(curl -sSL $RELEASE_URL | grep -o "browser_download_url.*$ASSET_NAME\"" | cut -d ' ' -f 2)

# ASSET_URL=$(basename $DOWNLOAD_URL)

DOWNLOAD_URL=$(echo $DOWNLOAD_URL | tr -d '\"')

curl -SL $DOWNLOAD_URL -o /tmp/$INSTALLATION_NAME

# # Installing the binary

sudo dpkg -i /tmp/$INSTALLATION_NAME

rm /tmp/$INSTALLATION_NAME

cat <<EOF
${BLUE}
Look Deep Into Nature, And Then You Will Understand Everything Better. - Albert Einstein
${NO_COLOR}

Print random quote in the terminal.

Please file an issue if you encounter any problems!

===============================================================================

${GREEN}Installation completed!${NO_COLOR}
EOF
