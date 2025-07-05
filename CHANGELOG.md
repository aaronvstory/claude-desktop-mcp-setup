# Changelog

All notable changes to the Claude Desktop MCP Setup will be documented here.

## [1.0.0] - 2025-07-05

### Added
- Initial release of Claude Desktop MCP Setup
- Interactive setup scripts for Windows, macOS, and Linux
- Secure API key collection (no hardcoded secrets)
- Complete MCP server configuration template
- Comprehensive custom instructions for autonomous development
- Cross-platform compatibility

### MCP Servers Included
- **researcher** - Perplexity AI integration for research and documentation
- **browser** - Puppeteer for web automation and testing
- **memory** - Persistent memory across Claude sessions
- **weather** - Brave Search integration for web searches
- **github** - Complete GitHub repository management
- **doc-scraper** - Custom document scraping capabilities  
- **desktop-commander** - Advanced filesystem and system operations
- **filesystem** - Basic filesystem with security restrictions
- **everything** - Testing and validation utilities

### Security Features
- Interactive API key prompts (never stored in code)
- Input validation for API key formats
- Secure configuration file creation
- Cross-platform path handling
- No sensitive data in repository

### Platform Support
- Windows 10/11 (setup-interactive.bat)
- macOS Intel & Apple Silicon (setup-interactive.sh)
- Linux distributions (setup-interactive.sh)

### Documentation
- Complete README with setup instructions
- Custom instructions for autonomous development
- Troubleshooting guide
- API key acquisition guides
- Testing procedures

### Original Issue Fixes
- Resolved Perplexity API 401 errors
- Updated GitHub token recommendations
- Cross-platform path normalization
- Secure credential handling

## [Unreleased]

### Planned
- Environment variable configuration option
- Docker containerization support
- Automated API key validation with test calls
- Additional MCP server integrations
- VS Code workspace configuration
- Automated backup and restore functionality
