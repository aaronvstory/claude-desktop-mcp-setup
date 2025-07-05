# Claude Desktop MCP Setup

**PAPESLAY-Confirmed** - Complete Model Context Protocol (MCP) server configuration for Claude Desktop with interactive setup scripts.

## 🚀 Quick Start

### Prerequisites
- **Node.js 18+** installed
- **Python 3.8+** installed  
- **Claude Desktop** application
- **Git** installed (optional)

### One-Command Setup

**Windows:**
```bash
git clone https://github.com/YOUR_USERNAME/claude-desktop-mcp-setup.git
cd claude-desktop-mcp-setup
setup-interactive.bat
```

**macOS/Linux:**
```bash
git clone https://github.com/YOUR_USERNAME/claude-desktop-mcp-setup.git
cd claude-desktop-mcp-setup
chmod +x setup-interactive.sh
./setup-interactive.sh
```

## 🔧 What This Setup Includes

### MCP Servers Configured
- **🔬 researcher** - Perplexity AI for research and documentation lookup
- **🌐 browser** - Puppeteer for web automation and testing
- **🧠 memory** - Persistent memory across Claude sessions
- **🔍 weather** - Brave Search for web searches and current information
- **📱 github** - Complete GitHub integration for repository management
- **📄 doc-scraper** - Custom document scraping capabilities
- **💻 desktop-commander** - Advanced filesystem and system operations
- **📁 filesystem** - Basic filesystem operations with security restrictions
- **🧪 everything** - Testing and validation utilities

### Features
- ✅ **Interactive API Key Setup** - Secure prompts for your API keys
- ✅ **Cross-Platform Support** - Windows, macOS, and Linux
- ✅ **Automatic Directory Creation** - Sets up required project folders
- ✅ **Dependency Installation** - Installs all required MCP servers
- ✅ **Configuration Validation** - Tests your setup before completion
- ✅ **Security Best Practices** - Never stores sensitive data in files
- ✅ **Custom Instructions** - Includes powerful Claude development instructions

## 📋 API Keys You'll Need

### Required APIs
1. **Perplexity API** (for research functionality)
   - Visit: https://www.perplexity.ai/settings/api
   - Generate key starting with `pplx-`
   - Add credits to your account

2. **GitHub Personal Access Token** (for repo management)
   - Visit: https://github.com/settings/tokens
   - Generate with `repo` permissions
   - Use fine-grained tokens for better security

3. **Brave Search API** (for web searches)
   - Visit: https://api.search.brave.com/app/keys
   - Free tier available
   - Generate API key

### Optional APIs
- Custom servers may require additional configuration

## 🛠️ Manual Setup (Alternative)

If you prefer manual configuration:

1. **Download Configuration Template:**
   ```bash
   curl -O https://raw.githubusercontent.com/YOUR_USERNAME/claude-desktop-mcp-setup/main/templates/claude_desktop_config.json
   ```

2. **Edit API Keys:**
   Replace all `YOUR_*_API_KEY_HERE` placeholders with your actual keys

3. **Place Configuration:**
   - **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`
   - **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
   - **Linux:** `~/.config/Claude/claude_desktop_config.json`

4. **Install Dependencies:**
   ```bash
   npm install -g @modelcontextprotocol/server-puppeteer
   npm install -g @modelcontextprotocol/server-memory
   npm install -g @modelcontextprotocol/server-brave-search
   npm install -g @modelcontextprotocol/server-github
   npm install -g @modelcontextprotocol/server-filesystem
   npm install -g @modelcontextprotocol/server-everything
   npm install -g @wonderwhy-er/desktop-commander
   ```

## 📚 Custom Instructions

This setup includes powerful custom instructions that enable Claude to:
- 🤖 **Autonomous Development** - Build complete solutions with minimal guidance
- 🏗️ **Monolithic Architecture** - Focus on maintainable, cohesive applications
- 🔍 **Research-First Approach** - Always search for latest best practices
- 🔐 **Security by Default** - Never commit secrets, proper validation
- 📝 **Documentation Driven** - Maintain CHANGELOGs and comprehensive docs
- 🧠 **Memory Integration** - Store project context and decisions

See `custom-instructions.md` for the complete development partner instructions.

## 🔒 Security Features

- ✅ **No Hardcoded Secrets** - All API keys entered interactively
- ✅ **Secure Storage** - Keys stored only in Claude's config
- ✅ **Input Validation** - Verifies API key formats
- ✅ **Connection Testing** - Validates keys before saving
- ✅ **Safe Defaults** - Restricted filesystem access
- ✅ **Gitignore Protection** - Prevents accidental secret commits

## 🧪 Testing Your Setup

After installation, test each MCP server:

```
1. Open Claude Desktop
2. Try these commands:
   - "Search for latest Node.js best practices" (researcher)
   - "Remember that I prefer React for frontend" (memory)
   - "Create a new GitHub repository called test-repo" (github)
   - "List files in my Documents folder" (filesystem)
   - "Screenshot the current webpage" (browser)
```

## 🐛 Troubleshooting

### Common Issues

**MCP Server Not Loading:**
- Check Claude Desktop logs
- Verify Node.js/Python installation
- Restart Claude Desktop after config changes

**401 API Errors:**
- Verify API key format and validity
- Check account credits (Perplexity)
- Regenerate tokens if needed

**Permission Denied:**
- Run setup scripts with administrator privileges
- Check filesystem permissions
- Verify paths in configuration

**Path Not Found:**
- Update paths in config for your system
- Use absolute paths instead of relative
- Check directory permissions

### Log Locations
- **Claude Desktop:** Application logs in Claude settings
- **MCP Servers:** Console output during startup
- **Setup Scripts:** Terminal output during installation

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

MIT License - Feel free to use and modify for your needs.

## 🔗 Useful Links

- [Claude Desktop](https://claude.ai/desktop)
- [MCP Documentation](https://modelcontextprotocol.io/)
- [Perplexity API](https://docs.perplexity.ai/)
- [GitHub API](https://docs.github.com/en/rest)
- [Brave Search API](https://api.search.brave.com/)

---

**PAPESLAY** - This setup enables Claude to be your autonomous development partner with access to research, memory, GitHub integration, and advanced filesystem operations.
