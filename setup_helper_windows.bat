@echo off
echo ============================================
echo  GSC MCP Setup Helper — Rae of Sunshine
echo ============================================
echo.

echo Finding your uvx path...
where uvx
echo.

echo Your Claude Desktop config file is located at:
echo %APPDATA%\Claude\claude_desktop_config.json
echo.

echo Opening your config file now...
notepad "%APPDATA%\Claude\claude_desktop_config.json"

echo.
echo Next steps:
echo 1. Paste your config block into the file that just opened
echo 2. Replace /FULL/PATH/TO/uvx with the path shown above
echo 3. Replace /FULL/PATH/TO/client_secrets.json with your actual path
echo 4. Save the file (Ctrl+S)
echo 5. Fully quit Claude Desktop and reopen it
echo.
pause
