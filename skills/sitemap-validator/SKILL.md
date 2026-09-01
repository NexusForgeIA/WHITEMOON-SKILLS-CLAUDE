---
name: sitemap-validator
description: Validates XML sitemaps and flags what to fix. Use when the user says 'sitemap', 'validate my sitemap', 'check my XML sitemap', 'sitemap errors', or 'is my sitemap correct'. Reads the XML sitemap and flags broken URLs, redirects, non-canonical or noindexed entries, missing important pages, and format issues, so the sitemap accurately tells search engines what to index.
---

# sitemap-validator

*Cluster: Technical SEO . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Ensure the XML sitemap is clean and accurate - listing only indexable, canonical, live URLs - so search engines get a trustworthy map of what to crawl and index.

## When to use

- After publishing or migrating, to confirm the sitemap is correct
- Indexing issues that might trace to a bad sitemap
- Routine technical health check
- The user wants to confirm important pages are in the sitemap

## Inputs required

- Sitemap URL (required - usually /sitemap.xml or referenced in robots.txt)
- Optional: the list of important pages that must be present
- Optional: the site's total indexable page count for a coverage sanity check

## Step-by-step instructions

1. Fetch the sitemap (and any child sitemaps in a sitemap index). Confirm valid XML format and that it's under the size and URL limits.
2. For each listed URL, check the HTTP status. Flag any that return non-200 (404s, 301/302 redirects, 500s) - sitemaps should list only live, final URLs.
3. Check each URL's canonical and meta robots. Flag any that are non-canonical or noindexed - they shouldn't be in the sitemap.
4. Cross-check against the important pages list (if provided): flag any priority page missing from the sitemap.
5. Check for bloat: parameter URLs, filtered duplicates, or low-value pages that shouldn't be advertised for indexing.
6. Confirm the sitemap is referenced in robots.txt and submitted in GSC. Output a fix list of exactly which URLs to remove, add, or correct.

## Output format

A validation report: format check, then flagged URLs grouped by issue (broken, redirected, non-canonical, noindexed, missing, bloat), each with the action (remove/add/fix). Ends with a coverage summary.

## Quality checklist

- [ ] Sitemap XML format and size limits are validated
- [ ] Every URL's HTTP status is checked; non-200s are flagged
- [ ] Non-canonical and noindexed URLs in the sitemap are flagged for removal
- [ ] Important pages missing from the sitemap are flagged for addition
- [ ] The sitemap is confirmed referenced in robots.txt and submittable to GSC

## Optimization notes

A sitemap is a trust signal. Filling it with redirects, 404s, and noindexed URLs teaches Google your sitemap is unreliable, and it leans on it less. The rule: every URL in the sitemap should be live, canonical, indexable, and worth ranking. Clean beats complete.
