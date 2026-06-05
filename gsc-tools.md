# GSC MCP Tools — Full Reference

All 20 tools available in the `mcp-search-console` server. Claude selects the
right one automatically — you ask in plain English, it runs the tool.

This file is a deep reference for power users and consultants who want to
understand exactly what each tool does and how to get the most from it.

---

## Category 1 — Site & Property Management

### `list_sites`
Lists all Google Search Console properties your authenticated account can access.

**When to use:** At the start of any session to confirm which properties are available.

**Example prompts:**
```
List all my Google Search Console properties.
What sites do I have access to in Search Console?
```

---

### `get_site_info`
Returns details about a specific GSC property including verification status and permission level.

**When to use:** To confirm a property is verified and you have the right access level.

**Example prompts:**
```
Get the details for the property [site.com].
Is [site.com] fully verified in Search Console?
```

---

## Category 2 — Performance & Search Analytics

### `query_performance`
The most-used tool. Pulls clicks, impressions, CTR, and average position for a property
across any date range. Can be filtered by query, page, device, or country.

**Key parameters:**
- Site URL
- Date range (e.g. "last 30 days", "last 90 days", "2025-01-01 to 2025-03-31")
- Dimensions: query, page, device, country
- Row limit (default 10, max 1000)

**Example prompts:**
```
Pull the top 50 queries for [site.com] over the last 90 days with clicks, impressions, CTR, and position.

Show me performance data for [site.com] filtered to mobile users only, last 28 days.

What are the top pages on [site.com] by impressions for the last 6 months?
```

---

### `get_search_analytics`
More flexible version of query_performance — allows complex filtering, multiple dimensions,
and custom date comparisons.

**Example prompts:**
```
Get search analytics for [site.com] for the US only, last 30 days, grouped by page.

Pull all queries containing "consulting" for [site.com] in the last 60 days.
```

---

### `compare_periods`
Compares performance between two date ranges side-by-side. Excellent for month-over-month
or year-over-year reporting.

**Example prompts:**
```
Compare [site.com] performance: January 2025 vs January 2024.
Show me how [site.com] traffic changed from Q4 2024 to Q1 2025.
```

---

### `top_queries`
Returns the highest-performing search queries for a property, sorted by a chosen metric.

**Example prompts:**
```
What are the top 20 queries driving traffic to [site.com] this month?
Show me the queries with the most impressions but lowest CTR on [site.com].
```

---

### `top_pages`
Returns the highest-performing pages, sortable by clicks, impressions, CTR, or position.

**Example prompts:**
```
What are my top 10 pages by clicks on [site.com] for the last 30 days?
Which pages on [site.com] have the most impressions but less than 1% CTR?
```

---

### `pages_by_query`
Finds which pages on your site rank for a specific search query.

**Example prompts:**
```
Which pages on [site.com] are ranking for the query "business coach Jamaica"?
What pages show up for searches related to "real estate Ghana"?
```

---

### `queries_by_page`
Finds which search queries are bringing traffic to a specific page. Essential for
optimising existing content.

**Example prompts:**
```
What search queries are driving traffic to [site.com/about]?
Show me all the queries that bring visitors to my services page.
```

---

### `position_distribution`
Shows how your pages are spread across position ranges (1–3, 4–10, 11–20, etc.).
Useful for understanding overall site health.

**Example prompts:**
```
How are pages on [site.com] distributed across ranking positions?
How many pages are on page 1 vs page 2 for [site.com]?
```

---

### `ctr_analysis`
Analyses click-through rate patterns across the site — identifies pages that appear
in search but fail to attract clicks.

**Example prompts:**
```
Analyse CTR patterns on [site.com]. Which pages have high impressions but low CTR?
Which title tags are failing to get clicks even when we're ranking well?
```

---

## Category 3 — Indexing & Coverage

### `get_index_coverage`
Returns indexing status for the property — shows how many pages are indexed,
excluded, or have errors. Critical for diagnosing visibility problems.

**Example prompts:**
```
What is the current indexing status for [site.com]?
How many pages on [site.com] have indexing errors?
```

---

### `inspect_url`
Runs a full URL inspection on a specific page — returns indexing status, last crawl
date, canonical URL, mobile usability, and any issues found.

**Example prompts:**
```
Inspect the URL [site.com/blog/post-name] — is it indexed?
Check [site.com/services] — when was it last crawled and are there any issues?
```

---

### `submit_url`
Submits a URL to Google's Indexing API requesting crawl and indexing.
Requires the Indexing API to be enabled in Google Cloud for the project.

**Example prompts:**
```
Submit [site.com/new-page] for indexing.
I just updated [site.com/homepage] — request re-indexing.
```

---

### `crawl_errors`
Returns a list of current crawl errors for the property — 404s, server errors,
redirect chains, and other issues preventing pages from being crawled.

**Example prompts:**
```
What crawl errors does [site.com] currently have?
List all 404 errors on [site.com] — which ones are highest priority to fix?
```

---

### `mobile_usability`
Checks for mobile usability issues flagged by Google — text too small, clickable
elements too close together, viewport not set, etc.

**Example prompts:**
```
Does [site.com] have any mobile usability issues in Search Console?
Are there any pages on [site.com] failing Google's mobile usability checks?
```

---

### `rich_results`
Checks the status of structured data and rich results for the property.
Shows which pages have valid schema and which have errors.

**Example prompts:**
```
What rich result types does [site.com] have configured?
Are there any structured data errors on [site.com]?
```

---

## Category 4 — Sitemap Management

### `get_sitemaps`
Lists all sitemaps submitted to Search Console for a property, including their
status (success, error), last submitted date, and URL count.

**Example prompts:**
```
What sitemaps are submitted for [site.com]?
Are any of my sitemaps returning errors?
```

---

### `submit_sitemap`
Submits a new sitemap URL to Search Console.

**Example prompts:**
```
Submit the sitemap at [site.com/sitemap.xml] to Search Console.
I've created a new image sitemap at [site.com/sitemap-images.xml] — please submit it.
```

---

### `delete_sitemap`
Removes a sitemap from Search Console. Use this when a sitemap URL has changed
or was submitted with an error.

**Example prompts:**
```
Delete the sitemap [site.com/old-sitemap.xml] from Search Console.
Remove the sitemap that's showing errors and I'll resubmit the correct URL.
```

---

## Power User Tips

### Combining Tools in One Prompt
Claude can chain multiple tools in a single request:
```
For [site.com]: pull the top 20 pages by impressions, check which ones have
indexing errors, and flag any with CTR below 1%. Give me a prioritised action list.
```

### Asking for Fresh Data
By default, the API returns "final" data (2–3 days behind). For more recent data:
```
Pull last 7 days of data for [site.com] including fresh/unconfirmed data.
```

### Setting a Date Range
Always be explicit about date ranges in your prompts for consistent results:
```
From 2025-01-01 to 2025-03-31, show me...
For the last 28 days...
Compare this month vs the same month last year...
```

### Saving Reports
Ask Claude to format output as a table or save as a file:
```
Pull the top 50 queries for [site.com] last 30 days and save it as a CSV.
Format the results as a table I can copy into my client report.
```
