## 🔄 Updating MCP Servers

### Finding New MCP Servers
1. **Smithery Registry:** Browse https://smithery.ai/registry for new MCP servers
2. **Official MCP Registry:** Check https://modelcontextprotocol.io/ for official servers
3. **GitHub Search:** Search for "mcp-server" or "model-context-protocol" repositories
4. **Community Resources:** Follow MCP community discussions and announcements

### Installing New Servers
**For npm-based servers:**
```bash
npm install -g @new-mcp-server/package
```

**For Smithery servers:**
```bash
npx @smithery/cli@latest install @author/server-name --client claude --profile your-profile --key your-api-key
```

### Adding to Configuration
1. Edit your `claude_desktop_config.json`
2. Add new server entry in the `mcpServers` section
3. Restart Claude Desktop to load new servers

### Automatic Updates Script
Create a script to check for and install MCP server updates:

```batch
@echo off
echo Updating MCP servers...
npm update -g @modelcontextprotocol/server-puppeteer
npm update -g @modelcontextprotocol/server-memory
npm update -g @modelcontextprotocol/server-brave-search
npm update -g @modelcontextprotocol/server-github
npm update -g @modelcontextprotocol/server-filesystem
npm update -g @modelcontextprotocol/server-everything
npm update -g @wonderwhy-er/desktop-commander
npm update -g @smithery/cli
echo MCP servers updated!
```

### Version Management
- Keep track of working server versions in your project documentation
- Test new versions in a separate configuration before updating main setup
- Backup your working configuration before major updates

### Configuration Management
- Use version control for your MCP configuration
- Create different configuration profiles for different use cases
- Document any custom server configurations or modifications
