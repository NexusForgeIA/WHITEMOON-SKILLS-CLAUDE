---
name: gsc-errors
description: Finds and fixes Google Search Console indexing and coverage errors. Use when the user says 'GSC errors', 'indexing errors', 'coverage issues', 'pages not indexed', 'crawl errors', 'why isn't my page indexed', or 'fix my Search Console'. Reads GSC coverage and indexing data, groups every error by type, and gives the specific fix for each so pages that should rank actually get indexed.
---

# gsc-errors

*Cluster: Google Search Console . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Diagnose and resolve the indexing and coverage errors that keep pages out of Google's index, grouped by type with a concrete fix for each.

## When to use

- Pages the user expects to rank aren't appearing in search
- GSC shows coverage or indexing errors
- After a migration or redesign, to catch indexing problems
- Routine health check on what's indexed versus what should be

## Inputs required

- Google Search Console connection (required)
- Optional: a specific URL or section the user is worried about

## Step-by-step instructions

1. Pull GSC index coverage and page indexing data: which URLs are indexed, which are excluded, and the reason for each exclusion.
2. Group the issues by type: crawled-not-indexed, discovered-not-indexed, blocked by robots.txt, noindex present, canonical pointing elsewhere, soft 404, redirect error, server error, duplicate without canonical.
3. For each group, explain in plain language what it means and whether it's a real problem (some exclusions are intentional and fine).
4. For each real problem, give the specific fix: remove the noindex tag, fix the canonical, unblock in robots.txt, fix the redirect chain, resolve the server error, add unique content to the soft 404.
5. Prioritize: pages that should rank but are excluded come first; intentional exclusions are noted as 'no action needed'.
6. Output a fix list grouped by error type, with the affected URLs and the exact action for each.

## Output format

Error groups, each with: Error type | What it means | Real problem or intentional | Affected URLs | Exact fix. Prioritized so should-rank-but-excluded pages are first.

## Quality checklist

- [ ] Every error type present in GSC is categorized
- [ ] Intentional exclusions (noindex on thank-you pages, etc.) are marked 'no action needed'
- [ ] Each real problem has a specific, executable fix
- [ ] Fixes are prioritized by ranking impact
- [ ] The user can tell at a glance which errors actually cost them traffic

## Optimization notes

Not every excluded page is a problem. Thank-you pages, filtered URLs, and paginated archives are often excluded on purpose. The skill's value is separating the harmful exclusions (a money page that's crawled-not-indexed) from the harmless ones, so the user fixes what matters and ignores the noise.
