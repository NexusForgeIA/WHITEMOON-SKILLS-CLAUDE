---
name: robots-checker
description: Checks robots.txt and indexing directives for problems that block pages from ranking. Use when the user says 'robots.txt', 'check my robots', 'indexing directives', 'is my site blocked', 'noindex check', or 'why is Google not crawling my site'. Reads robots.txt and on-page meta robots, then flags anything blocking pages the user wants indexed - and anything failing to block pages they don't.
---

# robots-checker

*Cluster: Technical SEO . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Catch robots.txt rules and meta robots directives that block important pages from being crawled or indexed, before they quietly cost the user traffic.

## When to use

- Pages aren't being indexed and the cause is unclear
- After a site launch or migration (staging block left in place is a classic disaster)
- Routine check that nothing important is blocked
- The user wants to confirm their robots setup is correct

## Inputs required

- Site URL (required)
- Optional: the specific pages or sections the user wants indexed
- Optional: the pages they explicitly want blocked (admin, staging, internal search)

## Step-by-step instructions

1. Fetch and parse robots.txt. List every Disallow and Allow rule and which user-agents they apply to.
2. Flag any Disallow rule that blocks pages or sections the user wants indexed. The classic catastrophe is a leftover Disallow: / from staging.
3. Fetch the key pages and read their meta robots and X-Robots-Tag headers. Flag any noindex on a page that should rank.
4. Check that the sitemap is referenced in robots.txt.
5. Confirm that pages the user wants blocked (admin, cart, internal search, staging) are actually blocked - and note that robots.txt disallow does not equal noindex (blocked pages can still be indexed without crawling).
6. Output a clear pass/fail per check, with the exact line to change for each problem.

## Output format

A check list: each robots and indexing check marked PASS or FAIL, with affected URLs and the exact line to add, remove, or change for each FAIL.

## Quality checklist

- [ ] robots.txt is parsed rule by rule
- [ ] Any block on should-be-indexed pages is flagged as critical
- [ ] Meta robots and X-Robots-Tag headers are checked, not just robots.txt
- [ ] The sitemap reference in robots.txt is confirmed
- [ ] The difference between disallow (crawl) and noindex (index) is correctly applied

## Optimization notes

The single most expensive SEO mistake lives here: a Disallow: / left over from staging that blocks the entire site. Always check for it first. And remember the trap - robots.txt disallow stops crawling but does not guarantee de-indexing; to truly keep a page out of the index you need noindex, which requires the page to be crawlable.
