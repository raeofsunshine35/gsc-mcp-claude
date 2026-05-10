# GSC MCP for Claude Desktop

**Connect Claude Desktop directly to Google Search Console — no coding required.**

Built and documented by [Davia-Rae Johnson](https://raeofsunshineconsulting.co) · Rae of Sunshine Consulting

---

## What This Does

This setup connects the `mcp-search-console` MCP server to Claude Desktop, giving Claude live access to your Google Search Console data. Once connected, you can ask Claude questions like:

- *"Show me the top 20 pages by clicks on mysite.com for the last 30 days."*
- *"Which pages have indexing errors right now and what type are they?"*
- *"List all pages sitting between position 8 and 15 with more than 50 impressions — these are my quick wins."*
- *"Submit mysite.com/new-page for indexing right now."*
- *"What sitemaps are submitted for mysite.com and are any returning errors?"*

Claude pulls live data from GSC and answers directly in your chat window. No exports. No tab switching. No manual reporting.

---

## Capabilities

### 📊 Performance & Traffic Analysis
- Clicks, impressions, CTR, and average position by page or query
- Filter by date range, device type, country, or search type
- Compare two time periods side by side
- Identify top-performing pages and ranking queries

### 🔍 Indexing & Coverage Audit
- Find all pages with indexing errors, grouped by error type
- Inspect individual URLs for index status and last crawl date
- Identify excluded pages and understand why they're excluded

### 🗺️ Sitemap Management
- List all submitted sitemaps and their status
- Delete broken or incorrect sitemaps
- Submit new or corrected sitemaps

### ⚡ URL Submission & Quick Win Identification
- Submit any URL for indexing on demand
- Find pages in positions 8–15 with high impressions (quick-win opportunities)
- Identify queries where you're close to page one

---

## Prerequisites

Before you start, make sure you have:

- [ ] Claude Desktop installed (Pro or Max plan)
- [ ] Python installed on your machine
- [ ] `uv` package manager installed — [get it here](https://docs.astral.sh/uv/)
- [ ] A Google account with access to at least one GSC property
- [ ] Windows or Mac

---

## Setup Instructions

### Step 1 — Create a Google Cloud Project

1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Click the project dropdown at the top → **New Project**
3. Name it `GSC MCP Claude` → click **Create**
4. Make sure your new project is selected before continuing

### Step 2 — Enable the Search Console API

1. In the left sidebar go to **APIs & Services → Library**
2. Search for **Google Search Console API**
3. Click it → click **Enable**

### Step 3 — Create OAuth 2.0 Credentials

1. Go to **APIs & Services → Credentials**
2. Click **+ Create Credentials → OAuth client ID**
3. If prompted, configure the consent screen first (choose External, fill in app name and email)
4. Back at Credentials: **+ Create Credentials → OAuth client ID**
5. Application type: **Desktop app**
6. Name it `Claude Desktop GSC` → click **Create**

### Step 4 — Download Your client_secrets.json

1. In the confirmation popup, click **Download JSON**
2. Save it somewhere secure — e.g. `C:\Users\YourName\Documents\MCP\client_secrets.json`
3. **Keep this file private** — treat it like a password

### Step 5 — Configure Claude Desktop

Find your Claude Desktop config file:

| OS | Path |
|---|---|
| Windows | `%APPDATA%\Claude\claude_desktop_config.json` |
| Mac | `~/Library/Application Support/Claude/claude_desktop_config.json` |

Open it in a text editor and add the following (replace paths with your actual paths):

```json
{
  "mcpServers": {
    "gscServer": {
      "command": "C:\\Users\\YourName\\AppData\\Local\\uv\\bin\\uvx.exe",
      "args": ["mcp-search-console"],
      "env": {
        "GSC_OAUTH_CLIENT_SECRETS_FILE": "C:\\Users\\YourName\\Documents\\MCP\\client_secrets.json"
      }
    }
  }
}
```

> **Finding your uvx path:** Run `where uvx` in Windows Command Prompt, or `which uvx` in Mac Terminal.

### Step 6 — Restart Claude and Authenticate

1. Fully quit Claude Desktop (check the system tray)
2. Reopen Claude Desktop
3. A browser window will open asking you to sign in with Google — click **Allow**
4. You're connected ✅

---

## Test Prompts

Once connected, try these in a new Claude Desktop chat:

```
List all the Search Console properties I have access to.
```

```
Show me the top 10 pages by clicks on [yoursite.com] for the last 30 days.
```

```
Are there any indexing errors on [yoursite.com]?
```

---

## The MCP Server

This setup uses the open-source [`mcp-search-console`](https://github.com/AminForou/mcp-gsc) server by AminForou.

It ships with 20 built-in tools:

| Tool | What It Does |
|---|---|
| `list_sites` | List all GSC properties |
| `query_performance` | Pull clicks, impressions, CTR, position |
| `get_index_coverage` | Check indexed pages and errors |
| `inspect_url` | Inspect any URL's index status |
| `submit_url` | Submit a URL for indexing |
| `get_sitemaps` | List submitted sitemaps |
| `submit_sitemap` | Submit a new sitemap |
| `delete_sitemap` | Remove a broken sitemap |
| `top_queries` | Top search queries by traffic |
| `top_pages` | Top pages by any metric |
| `compare_periods` | Compare two date ranges |
| `position_distribution` | Pages by position range |
| `ctr_analysis` | CTR patterns across the site |
| `mobile_usability` | Mobile usability issues |
| `rich_results` | Structured data status |
| `crawl_errors` | Current crawl errors |
| `search_analytics` | Custom analytics queries |
| `pages_by_query` | Pages ranking for a query |
| `queries_by_page` | Queries driving traffic to a page |
| `get_site_info` | Property details |

---

## Troubleshooting

**Claude says it can't connect to GSC**
Check both file paths in the config are correct. Run `where uvx` to confirm the uvx path. Fully quit and restart Claude Desktop.

**The OAuth browser window didn't open**
Make sure Claude Desktop was fully quit (check system tray) before restarting.

**Permissions error when querying a site**
The Google account you authenticated with must have Full or Restricted permission on that GSC property.

**Data is 2–3 days behind the GSC dashboard**
This is normal — the API defaults to final data only. Ask Claude to "include fresh data" to pull more recent results.

**JSON syntax error in config file**
Paste your config into [jsonlint.com](https://jsonlint.com) to validate it before saving.

---

## Want the Full Step-by-Step Guide?

The complete ebook with screenshots at every step is available at:
**[raeofsunshineconsulting.co](https://raeofsunshineconsulting.co)**

---

## About

Built by **Davia-Rae Johnson**, founder of Rae of Sunshine Consulting — a Digital Infrastructure Realignment™ consultancy serving founders and business owners across Ghana, the Caribbean, North America, and the global diaspora.

📧 info@raeofsunshineconsulting.co  
🌐 raeofsunshineconsulting.co

---

*© 2026 Rae of Sunshine Consulting. This repository is provided for educational and reference purposes.*
