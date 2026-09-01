---
name: gsc-auditor
description: Pulls Google Search Console data and surfaces prioritized quick wins. Use when the user says 'audit my GSC', 'Search Console', 'GSC quick wins', 'what should I work on', 'analyze my search data', or wants a prioritized SEO to-do list from their own data. Reads live GSC performance and surfaces striking-distance keywords, CTR opportunities, declining pages, and rising queries, all ranked by effort versus impact.
---

# gsc-auditor

*Cluster: Google Search Console . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Turn raw Search Console data into a short, prioritized action list so the user knows exactly what to work on next, ranked by effort versus impact.

## When to use

- The user wants a prioritized SEO to-do list from real data
- Weekly or monthly SEO review
- Starting work on a site and needing to know where the opportunities are
- The user asks 'what should I focus on'

## Inputs required

- Google Search Console connection (required)
- Optional: date range (defaults to last 28 days, compared to the prior 28)
- Optional: a specific section of the site to focus on

## Step-by-step instructions

1. Pull GSC data: queries, pages, impressions, clicks, CTR, average position, for the period and the comparison period.
2. Find striking-distance keywords: queries ranking in positions 11-20 with real impressions. A small push can move these to page one.
3. Find CTR opportunities: pages with high impressions but below-benchmark CTR (hand these to ctr-booster logic).
4. Find declining pages: pages that lost significant clicks or positions versus the comparison period.
5. Find rising queries: terms gaining impressions that the user may not have a dedicated page for yet (content opportunities).
6. Compile the top 10 opportunities across all categories, each tagged with effort (low/medium/high) and impact (low/medium/high), and recommend the order to tackle them.

## Output format

A prioritized opportunity list (top 10), each with: Opportunity | Category | Effort | Impact | Recommended action | Which other skill handles it. Ordered by impact-to-effort ratio.

## Quality checklist

- [ ] Both the current period and a comparison period are pulled
- [ ] Striking-distance (position 11-20) keywords are identified
- [ ] Declining pages are flagged before they become bigger problems
- [ ] Each opportunity has an effort and impact tag
- [ ] The list is short (top 10) and ordered, not an overwhelming data dump

## Optimization notes

This skill is the Monday-morning starting point. Its job is prioritization, not exhaustive analysis. A short ranked list someone will actually act on beats a 200-row export nobody opens. Hand specific opportunities to the specialist skills (ctr-booster, content-gap, meta-optimizer) rather than trying to solve everything here.
