# Client Workflow Examples

Real workflows used in active consulting engagements. All site URLs and client
names have been anonymised. These are copy-paste ready — replace `[site.com]`
with your client's actual domain.

Built by [Rae of Sunshine Consulting](https://raeofsunshineconsulting.co) from
live client work in Ghana, the Caribbean, United States, and Canada.

---

## Workflow 1 — Monthly Performance Report

**Time to complete:** 5–8 minutes
**Replaces:** 45–60 minutes of manual GSC export + spreadsheet work

**What it produces:** A clean summary of top pages, top queries, position changes,
and recommended actions — ready to paste into a client report or email.

**Prompt sequence:**

```
Step 1 — Overall summary:
Give me a 30-day performance summary for [site.com].
Include total clicks, total impressions, average CTR, and average position.

Step 2 — Top pages:
Pull the top 20 pages by clicks on [site.com] for the last 30 days.
Show clicks, impressions, CTR, and position. Format as a table.

Step 3 — Top queries:
What are the top 20 queries driving traffic to [site.com] this month?

Step 4 — Position drops:
Compare last 30 days vs the previous 30 days on [site.com].
Flag any pages that dropped more than 3 positions and any that gained more than 3.

Step 5 — Format for delivery:
Summarise all of the above into a 1-page client report.
Use plain language — the client is not technical.
Include 3 recommended actions for next month.
```

---

## Workflow 2 — Quick Win Keyword Finder

**Time to complete:** 3–5 minutes
**Best for:** Coaching clients, service providers, small business sites
**What it produces:** A ranked list of keywords where small SEO improvements
(better title tags, internal links) could move rankings from page 2 to page 1.

**Prompt:**
```
Show me all pages on [site.com] with more than 50 impressions
sitting between position 8 and 15 for the last 60 days.

For each page, show:
- The page URL
- Average position
- Impressions
- CTR
- The top 3 queries driving impressions

Rank them by impressions and label the top 5 as "Quick Win Priority."
```

**What to do with the results:**
- Update the title tag and H1 on each priority page to better match the queries shown
- Add internal links from other pages pointing to these pages
- Resubmit for indexing after changes via: `Submit [page URL] for indexing`

---

## Workflow 3 — New Site Indexing Audit

**Time to complete:** 5–10 minutes
**Best for:** Newly launched websites, sites after a redesign or migration
**What it produces:** Full picture of what's indexed, what isn't, and what's blocked

**Prompt sequence:**

```
Step 1 — Indexing overview:
What is the current indexing coverage status for [site.com]?
How many pages are indexed, excluded, and erroring?

Step 2 — Error details:
List all indexing errors on [site.com] grouped by error type.
Which error types are most common?

Step 3 — Key page check:
Inspect these specific pages and tell me if they're indexed:
- [site.com]
- [site.com/about]
- [site.com/services]
- [site.com/contact]

Step 4 — Fix and resubmit:
Submit the sitemap at [site.com/sitemap.xml].
Then submit each of the above pages for indexing individually.
```

---

## Workflow 4 — Content Decay Check

**Time to complete:** 5 minutes
**Best for:** Sites that have been live 1+ years with an existing content library
**What it produces:** Pages that were performing well but have declined —
allowing you to prioritise which content to refresh

**Prompt:**
```
Compare [site.com] performance:
- Period A: 6 months ago (give exact dates)
- Period B: the last 30 days

Show me:
1. Pages that had significant traffic 6 months ago but have declined now
2. How much traffic each has lost (clicks + impressions)
3. Current average position for each declining page

Sort by biggest traffic loss first.
Label pages that lost more than 50% of clicks as "Urgent Refresh."
```

---

## Workflow 5 — Pre-Launch Checklist for a New Page

**Time to complete:** 2–3 minutes
**Best for:** After publishing any new page — blog post, service page, landing page
**What it produces:** Confirmation the page is live, accessible, and submitted for indexing

**Prompt sequence:**

```
Step 1 — Inspect the new page:
Inspect the URL [site.com/new-page].
Is it indexed? When was it last crawled? Are there any issues?

Step 2 — Submit for indexing:
Submit [site.com/new-page] for indexing via the Indexing API.
Confirm the request was accepted.

Step 3 — Check the sitemap:
Is [site.com/new-page] included in the sitemap at [site.com/sitemap.xml]?
If not, flag it — I need to add it manually and resubmit.

Step 4 — Query check (after 2–4 weeks):
What queries are bringing impressions to [site.com/new-page]?
Is it appearing for the target query "[intended keyword]"?
If not, what position is it in and what queries is it actually ranking for?
```

---

## Bonus — GSC + Client Report Email Template

After completing any of these workflows, use this email template to deliver findings:

```
Subject: SEO Performance Update — [Month] — [Client Name]

Hi [Client Name],

Here's your monthly search performance summary for [site.com].

HIGHLIGHTS:
- [Positive finding 1]
- [Positive finding 2]

WATCH LIST:
- [Page or metric that needs attention]

3 PRIORITIES FOR THIS MONTH:
1. [Action 1]
2. [Action 2]
3. [Action 3]

Full data available on request. Let me know if you have any questions.

[Your name]
Rae of Sunshine Consulting
```
