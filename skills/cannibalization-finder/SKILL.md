---
name: cannibalization-finder
description: Finds pages on the same site competing for the same keyword (keyword cannibalization). Use when the user says 'cannibalization', 'pages competing', 'which page should rank', 'duplicate intent', 'why are two pages ranking for the same term', or rankings for a keyword keep swapping between URLs. Outputs clusters of competing pages per keyword with a recommended action: consolidate, differentiate, canonicalize, or redirect.
---

# cannibalization-finder

*Cluster: On-page & Content . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Identify where multiple pages target the same keyword and intent, diluting each other's ranking potential, and recommend the cleanest fix for each conflict.

## When to use

- Rankings for a keyword keep swapping between two of the user's URLs
- The user suspects two pages are competing
- After publishing similar content, to check for overlap
- Diagnosing why a page that should rank well is stuck

## Inputs required

- Site URL or sitemap (required)
- Optional: GSC data (the most reliable source - shows which queries trigger which URLs)
- Optional: a specific keyword the user is worried about

## Step-by-step instructions

1. If GSC data is available, pull the queries and the pages that rank for each. This is the strongest signal for real cannibalization.
2. Group pages by the primary keyword and search intent they target. Two pages targeting the same keyword with the same intent are a conflict.
3. For each conflict, gather signals: which page ranks higher, which has more backlinks, which has better engagement, which better matches intent, which is more recent.
4. Decide the recommended action per conflict: CONSOLIDATE (merge the weaker into the stronger and redirect), DIFFERENTIATE (retarget one page to a distinct keyword/intent), CANONICALIZE (point the weaker at the stronger), or REDIRECT (301 the obsolete one).
5. Explain the reasoning and the expected outcome for each recommendation.
6. Flag any false positives - pages that share a keyword but genuinely serve different intents and should both stay.

## Output format

A conflict table: Keyword | Competing URLs | Which is stronger and why | Recommended action | Expected outcome. Plus a short note on any false positives that are fine to leave.

## Quality checklist

- [ ] GSC query-to-page data is used where available (most reliable signal)
- [ ] Conflicts are based on same keyword AND same intent, not just a shared word
- [ ] Each conflict has a clear stronger page identified with reasons
- [ ] The recommended action is the least destructive option that resolves it
- [ ] Genuine same-keyword-different-intent pages are flagged as false positives, not merged

## Optimization notes

Not every shared keyword is cannibalization. A 'best running shoes' guide and a 'running shoes' category page share a term but serve different intents and can coexist. Real cannibalization is same keyword, same intent, same page type. Consolidation is powerful but irreversible - prefer differentiation when both pages have value.
