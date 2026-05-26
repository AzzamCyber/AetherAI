#!/bin/bash
set -e

echo -e "\033[1;36mInitializing AetherAI Boot Sequence...\033[0m"

if ! command -v node &> /dev/null
then
    echo -e "\033[1;31m[ ERROR ] Node.js is not installed. Please install Node.js to run AetherAI.\033[0m"
    exit 1
fi

TEMP_DIR="/tmp/AetherAI_Session"
mkdir -p "$TEMP_DIR"
SCRIPT_PATH="$TEMP_DIR/aetherai.cjs"

echo -e "\033[1;30m[ SYSTEM ] Establishing secure link and downloading neural pathways...\033[0m"
curl -fsSL https://aetherai.azzamcodex.site/aetherai.cjs -o "$SCRIPT_PATH"

echo -e "\033[1;32m[ OK ] Core systems loaded.\033[0m"
echo -e "\033[1;36mLaunching AetherAI...\033[0m"
node "$SCRIPT_PATH"
