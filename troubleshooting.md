# Troubleshooting Guide

Every error encountered across real setups — with the exact fix for each.
If your error isn't listed here, open an issue on GitHub or email
info@raeofsunshineconsulting.co

---

## Setup Errors

### "Claude says it can't connect to Google Search Console"

**Cause:** Almost always a wrong file path in the config, or Claude Desktop
wasn't fully restarted after saving the config.

**Fix — Step by step:**
1. Open your config file and check both paths carefully:
   - The `uvx` path
   - The `client_secrets.json` path
2. Run `where uvx` (Windows) or `which uvx` (Mac) again — confirm the path matches
3. Make sure `client_secrets.json` is at the path you specified — no typos, no spaces
4. **Fully quit Claude Desktop** — right-click the system tray icon and select Quit
   (just closing the window leaves it running in the background)
5. Reopen Claude Desktop and try again

---

### "The OAuth browser window didn't open"

**Cause:** Claude Desktop is still running in the background from before the config change.

**Fix:**
- Windows: Check the system tray (bottom-right corner) — right-click the Claude icon → Quit
- Mac: Right-click the Claude icon in the Dock → Quit
- Wait 10 seconds after quitting before reopening
- If still not opening: restart your computer, then open Claude Desktop fresh

---

### "I get a JSON syntax error when I save or open the config"

**Cause:** JSON is extremely strict — a missing comma, extra comma, mismatched bracket,
or straight quotes used instead of standard ones will break it.

**Fix:**
1. Copy your entire config file contents
2. Go to [jsonlint.com](https://jsonlint.com)
3. Paste and click Validate
4. The validator shows exactly which line has the error
5. Fix the error, save, restart Claude Desktop

**Most common JSON mistakes:**
```json
// WRONG — trailing comma after the last item
{
  "mcpServers": {
    "gscServer": { ... },   ← this comma will break it if gscServer is last
  }
}

// CORRECT — no trailing comma
{
  "mcpServers": {
    "gscServer": { ... }
  }
}
```

---

### "uvx not found" or "command not found: uvx"

**Cause:** The `uv` package manager is not installed, or it's installed but not
in your system PATH.

**Fix:**
```bash
# Install uv
pip install uv

# Then restart your terminal and check:
uvx --version
```

If `pip` itself isn't found: install Python from python.org, then run the above.

**Windows-specific:** After installing, open a **new** Command Prompt window
(not the same one you used to install). The PATH only updates in new windows.

---

### "File not found" error for client_secrets.json

**Cause:** The path in the config doesn't match where the file actually is.

**Fix:**
1. Find where you saved `client_secrets.json` using File Explorer (Windows) or Finder (Mac)
2. Right-click the file → Properties (Windows) or Get Info (Mac)
3. Copy the full path shown
4. Paste it into your config, replacing the placeholder
5. **Windows:** Change all single backslashes `\` to double backslashes `\\` in the JSON

**Example — Windows path format in config:**
```json
"GSC_OAUTH_CLIENT_SECRETS_FILE": "C:\\Users\\YourName\\Documents\\client_secrets.json"
```

**Example — Mac path format in config:**
```json
"GSC_OAUTH_CLIENT_SECRETS_FILE": "/Users/YourName/Documents/client_secrets.json"
```

---

## Authentication Errors

### "Permissions error when querying a site"

**Cause:** The Google account you authenticated with doesn't have access to
that GSC property.

**Fix:**
1. Go to [search.google.com/search-console](https://search.google.com/search-console)
2. Select the property
3. Go to **Settings → Users and Permissions**
4. Check if your email is listed — if not, click **Add User** and add it
5. Set permission level to **Full** or **Restricted**

If someone else owns the property, ask them to add your email.

---

### "Access denied" or "403 error"

**Cause:** The OAuth consent screen wasn't configured properly, or your email
wasn't added as a test user during the Google Cloud setup.

**Fix:**
1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Go to **APIs & Services → OAuth consent screen**
3. Under **Test users**, click **Add Users**
4. Add the Google email address you want to authenticate with
5. Save, then try the OAuth flow again in Claude Desktop

---

### "Token expired" or authentication stops working after a few weeks

**Cause:** OAuth tokens expire. This is normal.

**Fix:** Just ask Claude: "List my Google Search Console properties"
A new browser window will open — sign in again. The token refreshes automatically.

---

## Data Errors

### "Data looks 2–3 days behind what I see in the GSC dashboard"

**Cause:** The Search Console API defaults to returning only "final" (confirmed) data,
which is typically 2–3 days behind the live dashboard.

**Fix:** Ask Claude to include fresh data:
```
Pull last 7 days of performance data for [site.com] including fresh/unconfirmed data.
```

This uses `dataState: all` in the API call, which includes more recent but
potentially unconfirmed data — same as what you see in the GSC dashboard.

---

### "No data returned" for a property I know has traffic

**Cause A:** The date range requested has no data yet (e.g. asking for "today").
GSC data has a minimum 2-day delay.

**Cause B:** The site URL format in the prompt doesn't match how the property
is verified in GSC (www vs non-www, http vs https, domain vs URL-prefix).

**Fix:** Ask Claude to list your properties first:
```
List all my Google Search Console properties.
```
Use exactly the URL format shown in that list when querying specific sites.

---

### "I can see the property but can't pull data — returns empty"

**Cause:** The property might be a domain property (`sc-domain:example.com`) vs
a URL-prefix property (`https://example.com`). These behave differently in the API.

**Fix:** When querying, use the exact property identifier shown in `list_sites`.

---

## Claude Desktop Specific

### "GSC tools don't appear in Claude's tool list"

**Cause:** The MCP server didn't load, usually because of a config error.

**Fix:**
1. Ask Claude: "What tools do you have available?"
2. If GSC tools aren't listed, the config didn't load
3. Check the config file for JSON errors (use jsonlint.com)
4. Confirm file paths are correct
5. Fully restart Claude Desktop

---

### "I'm using Claude on the browser (claude.ai) and it can't find my GSC"

**Cause:** This is expected. MCPs configured in `claude_desktop_config.json`
only work in the **Claude Desktop app** — not in the browser at claude.ai.

**Fix:** Open Claude Desktop (the downloaded app) and use it there.
The browser version does not load locally configured MCPs.

---

### "I added Zoho MCP and now GSC stopped working" (or vice versa)

**Cause:** When you have multiple MCPs, they all need to be inside the same
`mcpServers` block. If you replaced the whole config instead of adding to it,
the other MCP disappeared.

**Fix — correct multi-MCP config format:**
```json
{
  "mcpServers": {
    "gscServer": {
      "command": "YOUR_UVX_PATH",
      "args": ["mcp-search-console"],
      "env": {
        "GSC_OAUTH_CLIENT_SECRETS_FILE": "YOUR_SECRETS_PATH"
      }
    },
    "zoho": {
      "command": "...",
      "args": ["..."]
    }
  }
}
```

Both servers go inside the same `mcpServers` block, separated by a comma.
See `claude_desktop_config.template.json` in this repo — Option B shows this exactly.

---

## Still stuck?

1. Check the [GitHub Issues](https://github.com/Raeofsunshine35/gsc-mcp-claude/issues)
   — someone may have had the same problem
2. Open a new issue with:
   - Your OS (Windows 10/11, Mac)
   - The exact error message
   - What you tried
3. Email: info@raeofsunshineconsulting.co
