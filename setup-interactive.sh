#!/bin/bash

# Claude Desktop MCP Interactive Setup for macOS/Linux
# This script will configure Claude Desktop with MCP servers

set -e  # Exit on any error

echo "========================================"
echo "Claude Desktop MCP Interactive Setup"
echo "========================================"
echo ""
echo "This script will help you configure Claude Desktop with MCP servers."
echo "You will need to provide your own API keys for full functionality."
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "🔍 Checking prerequisites..."

# Check Node.js
if command_exists node; then
    echo "✅ Node.js is installed ($(node --version))"
else
    echo "❌ Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Check Python
if command_exists python3; then
    echo "✅ Python is installed ($(python3 --version))"
elif command_exists python; then
    echo "✅ Python is installed ($(python --version))"
else
    echo "❌ Python is not installed"
    echo "Please install Python from https://python.org/"
    exit 1
fi

echo ""
echo "========================================"
echo "Installing MCP Servers"
echo "========================================"
echo ""

echo "📦 Installing MCP servers globally..."
npm install -g @modelcontextprotocol/server-puppeteer
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-brave-search
npm install -g @modelcontextprotocol/server-github
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-everything
npm install -g @wonderwhy-er/desktop-commander

echo "✅ MCP servers installed successfully"
echo ""

echo "========================================"
echo "API Key Configuration"
echo "========================================"
echo ""
echo "You need to provide API keys for the following services:"
echo ""
echo "1. Perplexity AI (for research functionality)"
echo "   Visit: https://www.perplexity.ai/settings/api"
echo "   Format: pplx-XXXXXXXXXXXXXXXXXXXXXXXXXX"
echo ""
echo "2. GitHub Personal Access Token (for repository management)"
echo "   Visit: https://github.com/settings/tokens"
echo "   Permissions needed: repo"
echo ""
echo "3. Brave Search API (for web searches)"
echo "   Visit: https://api.search.brave.com/app/keys"
echo "   Free tier available"
echo ""

read -p "Press Enter to continue with API key setup..."
echo ""

# Get API keys from user
read -p "Enter your Perplexity API key (pplx-...): " PERPLEXITY_KEY
read -p "Enter your GitHub token: " GITHUB_TOKEN
read -p "Enter your Brave Search API key: " BRAVE_KEY

echo ""
echo "🔍 Validating API key formats..."

# Basic validation
if [[ $PERPLEXITY_KEY == pplx-* ]]; then
    echo "✅ Perplexity key format looks correct"
else
    echo "⚠️  Perplexity key should start with 'pplx-'"
fi

if [[ -n $GITHUB_TOKEN ]]; then
    echo "✅ GitHub token provided"
else
    echo "⚠️  GitHub token is empty"
fi

if [[ -n $BRAVE_KEY ]]; then
    echo "✅ Brave API key provided"
else
    echo "⚠️  Brave API key is empty"
fi

echo ""
echo "========================================"
echo "Creating Configuration"
echo "========================================"
echo ""

# Create base directories
mkdir -p "$HOME/CLAUDE"
mkdir -p "$HOME/Scripts"
mkdir -p "$HOME/Projects"

# Determine Claude config directory based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    CLAUDE_CONFIG_DIR="$HOME/Library/Application Support/Claude"
else
    # Linux
    CLAUDE_CONFIG_DIR="$HOME/.config/Claude"
fi

mkdir -p "$CLAUDE_CONFIG_DIR"

# Get current username
CURRENT_USER=$(whoami)

echo "📁 Creating claude_desktop_config.json..."

# Create configuration file
cat > "$CLAUDE_CONFIG_DIR/claude_desktop_config.json" << EOF
{
  "globalShortcut": "Alt+Ctrl+Space",
  "mcpServers": {
    "researcher": {
      "command": "node",
      "args": [
        "$HOME/Scripts/perplexity-server/build/index.js"
      ],
      "env": {
        "PERPLEXITY_API_KEY": "$PERPLEXITY_KEY"
      }
    },
    "browser": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-puppeteer@latest"
      ]
    },
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory@latest"
      ]
    },
    "weather": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-brave-search@latest"
      ],
      "env": {
        "BRAVE_API_KEY": "$BRAVE_KEY"
      }
    },
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github@latest"
      ],
      "env": {
        "GITHUB_TOKEN": "$GITHUB_TOKEN"
      }
    },
    "desktop-commander": {
      "command": "npx",
      "args": [
        "-y",
        "@wonderwhy-er/desktop-commander@latest"
      ]
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem@latest",
        "$HOME/Desktop",
        "$HOME/Documents",
        "$HOME/Scripts",
        "$HOME/Projects",
        "$HOME/CLAUDE"
      ]
    },
    "everything": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-everything@latest"
      ]
    }
  }
}
EOF

echo "✅ Configuration file created at: $CLAUDE_CONFIG_DIR/claude_desktop_config.json"
echo ""

echo "========================================"
echo "Setup Complete"
echo "========================================"
echo ""
echo "✅ Claude Desktop MCP setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Restart Claude Desktop application"
echo "2. Test MCP servers with these commands:"
echo "   - \"Search for latest Node.js best practices\" (researcher)"
echo "   - \"Remember that I prefer React\" (memory)"
echo "   - \"List files in my Documents folder\" (filesystem)"
echo ""
echo "Configuration location: $CLAUDE_CONFIG_DIR/claude_desktop_config.json"
echo ""
echo "For troubleshooting, see: https://github.com/YOUR_USERNAME/claude-desktop-mcp-setup"
echo ""
echo "🎉 Happy coding with Claude!"
