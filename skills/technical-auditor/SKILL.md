---
name: technical-auditor
description: Crawls a site and detects technical SEO issues. Use when the user says 'technical audit', 'crawl my site', 'technical SEO issues', 'audit my site technically', 'find technical problems', or wants a technical health check independent of Semrush. Crawls the key pages and reports technical issues grouped by type: crawlability, indexability, site structure, page speed signals, mobile, HTTPS, and on-page technical elements.
---

# technical-auditor

*Cluster: Technical SEO . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Crawl the site's important pages and surface technical SEO problems grouped by type, giving an independent technical health read without relying on a third-party tool's flags.

## When to use

- The user wants a technical SEO health check
- After a site change, redesign, or migration
- Diagnosing a sitewide ranking or indexing problem
- Regular technical maintenance review

## Inputs required

- Site URL (required)
- Optional: the priority pages to crawl (otherwise crawl top pages by traffic via GSC, or a representative sample)
- Optional: focus area (crawlability, speed, mobile, structure)

## Step-by-step instructions

1. Determine the page set to crawl. Prefer the top pages by traffic (pull from gsc-auditor) plus the homepage and key templates, rather than the entire site.
2. For each page, check crawlability and indexability: robots directives, meta robots, canonical tags, HTTP status, redirect chains.
3. Check on-page technical elements: single H1, title and meta presence, structured data presence and validity, image alt coverage, internal link count.
4. Check structural signals: URL structure, breadcrumb presence, sitemap inclusion, HTTPS and mixed-content issues.
5. Check experience signals available without a full performance tool: render-blocking patterns, oversized images, layout-shift risks visible in markup.
6. Group all findings by type and severity, with affected URLs and a one-line impact note for each.

## Output format

Findings grouped by type (Crawlability, Indexability, On-page, Structure, Experience), each with severity, affected URLs, and impact. Ends with the top 5 fixes by impact.

## Quality checklist

- [ ] A sensible page set was crawled (priority pages, not necessarily the whole site)
- [ ] Crawlability and indexability are checked first - they gate everything else
- [ ] Findings are grouped by type and severity
- [ ] Each finding lists affected URLs and a plain-language impact
- [ ] The top 5 highest-impact fixes are called out explicitly

## Optimization notes

Crawl smart, not exhaustive. For a large site, auditing the top 20 pages by traffic plus each template type catches the issues that actually affect rankings, far faster than crawling 10,000 URLs. Indexability issues come first: a fast, beautiful page that can't be indexed ranks for nothing.
