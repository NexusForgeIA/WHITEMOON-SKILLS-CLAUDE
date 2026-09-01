---
name: ctr-booster
description: Finds pages with high impressions but low click-through rate and produces data-backed fixes. Use when the user says 'CTR', 'click through rate', 'high impressions low clicks', 'pages that get seen but not clicked', 'improve my CTR', or wants more clicks without new rankings. Reads GSC data, finds the underperformers against expected CTR for their position, and hands each one to meta-optimizer-style title and meta fixes.
---

# ctr-booster

*Cluster: On-page & Content . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Surface the pages already getting impressions but under-clicking for their ranking position, and give each a concrete fix so the user gains traffic without needing new rankings.

## When to use

- The user wants more organic traffic from pages that already rank
- A page ranks in the top 10 but gets few clicks
- Reviewing GSC for quick wins
- After a ranking improvement that didn't translate to clicks

## Inputs required

- Google Search Console connection (required - this skill reads live GSC data)
- Optional: a date range (defaults to last 28 days)
- Optional: a minimum impression threshold to focus on pages with real volume

## Step-by-step instructions

1. Pull GSC performance data: page, query, impressions, clicks, CTR, and average position for the date range.
2. For each page, compare its actual CTR to the expected CTR for its average position (position 1 expects roughly 28-35%, position 5 roughly 6-9%, position 10 roughly 2-3%).
3. Flag pages where actual CTR is meaningfully below expected for their position AND impressions are high enough to matter.
4. Rank the opportunities by potential click gain (impressions multiplied by the CTR gap).
5. For the top opportunities, diagnose the likely cause: weak title, missing keyword in title, truncated snippet, no meta description, unappealing URL, missing rich result.
6. Hand each a specific fix - usually a rewritten title and meta (the meta-optimizer pattern) - and estimate the click gain if CTR reaches the position benchmark.

## Output format

A ranked opportunity table: Page | Query | Position | Impressions | Actual CTR | Expected CTR | Potential clicks gained | Recommended fix. Plus rewritten titles/metas for the top 5.

## Quality checklist

- [ ] Actual CTR is compared against a position-based benchmark, not a flat number
- [ ] Only pages with enough impressions to matter are flagged
- [ ] Opportunities are ranked by potential click gain, not just by CTR gap
- [ ] Each fix is specific and actionable, not 'improve the title'
- [ ] Estimated click gains are realistic, capped at the position benchmark

## Optimization notes

Position context is everything. A 5% CTR is terrible at position 1 but excellent at position 8. Always benchmark against the position. The biggest wins are usually high-impression pages sitting at positions 3-8 with a weak title - small CTR lifts there move real traffic.
