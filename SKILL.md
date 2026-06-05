---
name: gsc-mcp-claude
description: >
  Use when setting up, troubleshooting, or using the Google Search Console MCP
  connection with Claude Desktop. Triggers: "connect Claude to Google Search Console",
  "GSC MCP setup", "set up the GSC MCP", "Google Search Console not connecting",
  "Claude can't read my GSC data", "configure the search console MCP", "GSC MCP
  error", "how do I connect GSC to Claude", "set up mcp-search-console", "install
  the GSC MCP", "uvx path", "client_secrets.json", "OAuth GSC", or any request
  to pull live GSC data into Claude Desktop. Also triggers when running GSC analysis
  in Claude Desktop: "pull my search data", "check my indexing", "find quick win
  keywords", "run a GSC audit", "submit URL for indexing", or "monthly SEO report".
  Works on Windows and Mac. Covers Google Cloud setup, OAuth credentials, config
  file setup, all 20 GSC MCP tools, client workflow prompts, and troubleshooting.
---

# GSC MCP — Claude Desktop Setup & Usage Skill

Complete guide for connecting Claude Desktop to Google Search Console and running
live SEO analysis. Built by Rae of Sunshine Consulting from real client deployments.

**GitHub repo:** https://github.com/Raeofsunshine35/gsc-mcp-claude
**Setup guide (PDF):** https://raeofsunshineconsulting.co (Digital Products page)

---

## What This Connection Does

Once configured, Claude Desktop can read live Google Search Console data directly.
No copy-pasting. No CSV exports. Just ask Claude a question and it pulls the data.

| Capability | What You Can Do |
|---|---|
| **Performance & Traffic** | Pull clicks, impressions, CTR, position by page or query |
| **Indexing & Coverage** | Check which pages are indexed, find crawl errors |
| **Sitemap Management** | List, submit, and delete sitemaps |
| **URL Submission** | Submit pages for indexing via Google's Indexing API |

---

## Prerequisites Checklist

Before starting, confirm you have:
- [ ] Claude Desktop installed (download from claude.ai/download — NOT the browser version)
- [ ] A Google account with access to at least one Search Console property
- [ ] Python 3.9+ installed (check: `python --version` in terminal)
- [ ] uvx installed (check: `uvx --version` — install via `pip install uv`)
- [ ] Admin access to your computer to edit config files

---

## Step-by-Step Setup

### Step 1 — Enable the Search Console API in Google Cloud

1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Create a new project (name it something like "Claude GSC")
3. Go to **APIs & Services → Library**
4. Search for **Google Search Console API** and click **Enable**

### Step 2 — Create OAuth Credentials

1. Go to **APIs & Services → Credentials**
2. Click **+ Create Credentials → OAuth client ID**
3. If prompted to configure the consent screen:
   - User Type: **External**
   - App name: anything (e.g. "Claude GSC Tool")
   - Add your email as a test user
4. Application type: **Desktop app**
5. Click **Create** → **Download JSON**
6. Rename the downloaded file to `client_secrets.json`
7. Save it somewhere safe — you'll need the full file path

### Step 3 — Find Your uvx Path

**Windows:**
```
Open Command Prompt → type: where uvx
```
Copy the full path shown (e.g. `C:\Users\YourName\AppData\Local\uv\bin\uvx.exe`)

**Mac:**
```
Open Terminal → type: which uvx
```
Copy the full path shown (e.g. `/Users/YourName/.local/bin/uvx`)

### Step 4 — Edit Your Claude Desktop Config File

**Config file location:**
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Mac: `~/Library/Application Support/Claude/claude_desktop_config.json`

Use the template from `claude_desktop_config.template.json` in this repo.
Replace `YOUR_UVX_PATH_HERE` and `YOUR_PATH_TO_client_secrets.json` with your actual paths.

**If you already have other MCPs (like Zoho):** Use Option B in the template —
add the `gscServer` block inside your existing `mcpServers` section.

### Step 5 — Restart Claude Desktop and Authenticate

1. **Fully quit** Claude Desktop (check system tray — just closing the window is not enough)
2. Reopen Claude Desktop
3. Ask Claude: **"List my Google Search Console properties"**
4. A browser window will open — sign in with your Google account
5. Grant permissions when prompted
6. Your token is saved — you won't need to authenticate again

---

## The 20 Built-In GSC MCP Tools

Claude selects the right tool automatically. You just ask in plain English.

| Tool | What It Does |
|---|---|
| `list_sites` | List all GSC properties your account can access |
| `get_site_info` | Get details about a specific property |
| `query_performance` | Pull clicks, impressions, CTR, position by page or query |
| `get_index_coverage` | Check which pages are indexed and which have errors |
| `inspect_url` | Run a URL inspection on any page |
| `submit_url` | Submit a URL for indexing via the Indexing API |
| `get_sitemaps` | List all submitted sitemaps for a property |
| `submit_sitemap` | Submit a new sitemap |
| `delete_sitemap` | Remove an incorrectly submitted sitemap |
| `get_search_analytics` | Pull search analytics with custom date ranges and filters |
| `compare_periods` | Compare performance across two date ranges |
| `top_queries` | Get the top search queries driving traffic |
| `top_pages` | Get the top pages by any performance metric |
| `pages_by_query` | Find which pages rank for a specific query |
| `queries_by_page` | Find which queries bring traffic to a specific page |
| `position_distribution` | See how pages are distributed across position ranges |
| `ctr_analysis` | Analyse click-through rate patterns across the site |
| `mobile_usability` | Check for mobile usability issues |
| `rich_results` | Check structured data / rich result status |
| `crawl_errors` | Pull a list of current crawl errors |

---

## Ready-to-Use Prompts

### Monthly Client Report
```
Pull the top 20 pages by clicks on [site.com] for the last 30 days.
Show impressions, CTR, and average position.
Flag any pages that dropped more than 5 positions since last month.
```

### Quick Win Keyword Finder
```
Show me all pages on [site.com] with more than 50 impressions
sitting between position 8 and 15. These are my quick-win opportunities.
```

### Indexing Audit
```
List all pages on [site.com] with indexing errors.
Group them by error type and tell me which ones are most urgent to fix.
```

### Sitemap Health Check
```
What sitemaps are currently submitted for [site.com]?
Are any returning errors? If so, which should I delete and resubmit?
```

### Submit New Page
```
I just published a new page at [site.com/new-page].
Submit it for indexing and confirm it was accepted.
```

For the full prompt library → see `sample_prompts.md` in this repo.

---

## Common Errors & Fixes

| Error | Most Likely Cause | Fix |
|---|---|---|
| "Claude can't connect to GSC" | Wrong file path in config | Run `where uvx` again — confirm the exact path matches your config |
| "OAuth browser didn't open" | Claude Desktop not fully restarted | Quit from system tray, not just close window |
| "Permissions error on a site" | Google account lacks GSC access | Add your account in GSC → Settings → Users and Permissions |
| "Data is 2–3 days behind" | API defaulting to final data only | Ask Claude to "include fresh data" — uses `dataState: all` |
| "JSON syntax error" | Missing comma or bracket | Paste your config into jsonlint.com to check |
| "uvx not found" | uv not installed | Run `pip install uv` then restart terminal |

Full troubleshooting guide → see `references/troubleshooting.md`

---

## Integration with Other ROS Skills

| Task | Also Use |
|---|---|
| Full site SEO audit using GSC data | `seo-audit` skill |
| Local SEO + Google Business Profile | `ros-local-seo` skill |
| Building location pages after finding keyword gaps | `ros-website-build` skill |
| Adding schema markup to improve rich results | `schema-markup` skill |
| GSC setup for a client site | `ros-client-audit` skill (run audit first) |
