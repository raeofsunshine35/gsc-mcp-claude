#!/bin/bash
echo "============================================"
echo " GSC MCP Setup Helper — Rae of Sunshine"
echo "============================================"
echo ""

echo "Finding your uvx path..."
which uvx
echo ""

CONFIG_PATH="$HOME/Library/Application Support/Claude/claude_desktop_config.json"
echo "Your Claude Desktop config file is located at:"
echo "$CONFIG_PATH"
echo ""

echo "Opening your config file now..."
open -a TextEdit "$CONFIG_PATH"

echo ""
echo "Next steps:"
echo "1. Paste your config block into the file that just opened"
echo "2. Replace /FULL/PATH/TO/uvx with the path shown above"
echo "3. Replace /FULL/PATH/TO/client_secrets.json with your actual path"
echo "4. Save the file (Cmd+S)"
echo "5. Fully quit Claude Desktop and reopen it"
echo ""
