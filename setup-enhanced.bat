@echo off
title Claude Desktop MCP Enhanced Setup with Smithery
color 0A

REM Check admin privileges
net session >nul 2>&1
if NOT %errorLevel% == 0 (
    echo [ERROR] This script requires Administrator privileges.
    echo Right-click this file and select "Run as Administrator"
    pause
    exit /b 1
)

echo ==========================================
echo Claude Desktop MCP Enhanced Setup
echo ==========================================
echo.
echo This script will configure Claude Desktop with MCP servers including
echo advanced Smithery integration for enhanced search and context management.
echo.

REM Check prerequisites
echo [INFO] Checking prerequisites...

REM Check Node.js
node --version >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Node.js is installed
) else (
    echo [ERROR] Node.js is not installed
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check Python
python --version >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Python is installed
) else (
    echo [ERROR] Python is not installed
    echo Please install Python from https://python.org/
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Installing MCP Servers
echo ==========================================
echo.

echo [INFO] Installing standard MCP servers...
call npm install -g @modelcontextprotocol/server-puppeteer >nul 2>&1
call npm install -g @modelcontextprotocol/server-memory >nul 2>&1
call npm install -g @modelcontextprotocol/server-brave-search >nul 2>&1
call npm install -g @modelcontextprotocol/server-github >nul 2>&1
call npm install -g @modelcontextprotocol/server-filesystem >nul 2>&1
call npm install -g @modelcontextprotocol/server-everything >nul 2>&1
call npm install -g @wonderwhy-er/desktop-commander >nul 2>&1

echo [INFO] Installing Smithery CLI for enhanced features...
call npm install -g @smithery/cli >nul 2>&1

echo [OK] All MCP servers installed successfully
echo.

echo ==========================================
echo API Key Configuration
echo ==========================================
echo.
echo You need to provide API keys for the following services:
echo.
echo REQUIRED APIS:
echo 1. Perplexity AI (for research functionality)
echo    Visit: https://www.perplexity.ai/settings/api
echo    Format: pplx-XXXXXXXXXXXXXXXXXXXXXXXXXX
echo.
echo 2. GitHub Personal Access Token (for repository management)
echo    Visit: https://github.com/settings/tokens
echo    Permissions needed: repo
echo.
echo 3. Brave Search API (for web searches)
echo    Visit: https://api.search.brave.com/app/keys
echo    Free tier available
echo.
echo OPTIONAL BUT RECOMMENDED:
echo 4. Smithery API Key (for advanced search and context features)
echo    Visit: https://smithery.ai/
echo    Enables: Exa search, Context7, and comprehensive toolbox
echo.

echo Press any key to continue with API key setup...
pause >nul
echo.

REM Get API keys from user
set /p PERPLEXITY_KEY="Enter your Perplexity API key (pplx-...): "
set /p GITHUB_TOKEN="Enter your GitHub token: "
set /p BRAVE_KEY="Enter your Brave Search API key: "
set /p SMITHERY_KEY="Enter your Smithery API key (optional, press Enter to skip): "
set /p SMITHERY_PROFILE="Enter your Smithery profile (optional, press Enter to skip): "

echo.
echo [INFO] Validating API key formats...

REM Basic validation
echo %PERPLEXITY_KEY% | findstr /B "pplx-" >nul
if %errorLevel% == 0 (
    echo [OK] Perplexity key format looks correct
) else (
    echo [WARNING] Perplexity key should start with 'pplx-'
)

if defined GITHUB_TOKEN (
    echo [OK] GitHub token provided
) else (
    echo [WARNING] GitHub token is empty
)

if defined BRAVE_KEY (
    echo [OK] Brave API key provided
) else (
    echo [WARNING] Brave API key is empty
)

if defined SMITHERY_KEY (
    echo [OK] Smithery API key provided - enhanced features will be available
) else (
    echo [INFO] Smithery API key skipped - basic features only
)

echo.
echo ==========================================
echo Creating Enhanced Configuration
echo ==========================================
echo.

REM Create base directories
if not exist "C:\CLAUDE" mkdir "C:\CLAUDE" >nul 2>&1
if not exist "C:\Scripts" mkdir "C:\Scripts" >nul 2>&1
if not exist "C:\Projects" mkdir "C:\Projects" >nul 2>&1

REM Get username for paths
for /f "tokens=*" %%i in ('echo %USERNAME%') do set CURRENT_USER=%%i

REM Create Claude config directory
set "CLAUDE_CONFIG_DIR=%APPDATA%\Claude"
if not exist "%CLAUDE_CONFIG_DIR%" mkdir "%CLAUDE_CONFIG_DIR%" >nul 2>&1

REM Create configuration file with conditional Smithery servers
echo [INFO] Creating enhanced claude_desktop_config.json...

(
echo {
echo   "globalShortcut": "Alt+Ctrl+Space",
echo   "mcpServers": {
echo     "researcher": {
echo       "command": "node",
echo       "args": [
echo         "C:/Scripts/perplexity-server/build/index.js"
echo       ],
echo       "env": {
echo         "PERPLEXITY_API_KEY": "%PERPLEXITY_KEY%"
echo       }
echo     },
echo     "browser": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-puppeteer@latest"
echo       ]
echo     },
echo     "memory": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-memory@latest"
echo       ]
echo     },
echo     "weather": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-brave-search@latest"
echo       ],
echo       "env": {
echo         "BRAVE_API_KEY": "%BRAVE_KEY%"
echo       }
echo     },
echo     "github": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-github@latest"
echo       ],
echo       "env": {
echo         "GITHUB_TOKEN": "%GITHUB_TOKEN%"
echo       }
echo     },
echo     "desktop-commander": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@wonderwhy-er/desktop-commander@latest"
echo       ]
echo     },
echo     "filesystem": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-filesystem@latest",
echo         "C:\\Users\\%CURRENT_USER%\\Desktop",
echo         "C:\\Users\\%CURRENT_USER%\\Documents",
echo         "C:\\Scripts",
echo         "C:\\Projects",
echo         "C:\\CLAUDE"
echo       ]
echo     },
echo     "everything": {
echo       "command": "npx",
echo       "args": [
echo         "-y",
echo         "@modelcontextprotocol/server-everything@latest"
echo       ]
echo     }
) > "%CLAUDE_CONFIG_DIR%\claude_desktop_config.json"

REM Add Smithery servers if API key provided
if defined SMITHERY_KEY (
    echo [INFO] Adding Smithery enhanced servers...
    (
    echo     ,"exa": {
    echo       "command": "npx",
    echo       "args": [
    echo         "-y",
    echo         "@smithery/cli@latest",
    echo         "run-url",
    echo         "https://server.smithery.ai/exa/mcp?api_key=%SMITHERY_KEY%&profile=%SMITHERY_PROFILE%"
    echo       ]
    echo     },
    echo     "context7": {
    echo       "command": "npx",
    echo       "args": [
    echo         "-y",
    echo         "@smithery/cli@latest",
    echo         "run-url",
    echo         "https://server.smithery.ai/@upstash/context7-mcp/mcp?api_key=%SMITHERY_KEY%&profile=%SMITHERY_PROFILE%"
    echo       ]
    echo     },
    echo     "smithery-toolbox": {
    echo       "command": "npx",
    echo       "args": [
    echo         "-y",
    echo         "@smithery/cli@latest",
    echo         "run-url",
    echo         "https://server.smithery.ai/@smithery/toolbox/mcp?api_key=%SMITHERY_KEY%&profile=%SMITHERY_PROFILE%"
    echo       ]
    echo     }
    ) >> "%CLAUDE_CONFIG_DIR%\claude_desktop_config.json"
)

REM Close the JSON
(
echo   }
echo }
) >> "%CLAUDE_CONFIG_DIR%\claude_desktop_config.json"

echo [OK] Enhanced configuration file created at: %CLAUDE_CONFIG_DIR%\claude_desktop_config.json
echo.

echo ==========================================
echo Setup Complete
echo ==========================================
echo.
echo [OK] Claude Desktop MCP enhanced setup completed successfully
echo.
echo ENABLED FEATURES:
echo - Perplexity AI research
echo - GitHub integration  
echo - Brave Search
echo - Browser automation
echo - Persistent memory
echo - Advanced filesystem operations
if defined SMITHERY_KEY (
    echo - Exa semantic search
    echo - Context7 long-term memory
    echo - Smithery comprehensive toolbox
)
echo.
echo Next steps:
echo 1. Restart Claude Desktop application
echo 2. Test MCP servers with these commands:
echo    - "Search for latest AI developments" (researcher/exa)
echo    - "Remember my coding preferences" (memory/context7)
echo    - "Create a new GitHub repository" (github)
echo    - "List my project files" (filesystem)
if defined SMITHERY_KEY (
    echo    - "Use Exa to research quantum computing" (exa)
    echo    - "Store this conversation context" (context7)
)
echo.
echo Configuration location: %CLAUDE_CONFIG_DIR%\claude_desktop_config.json
echo.
echo For troubleshooting, see: https://github.com/d0nbx/claude-desktop-mcp-setup
echo.

pause
