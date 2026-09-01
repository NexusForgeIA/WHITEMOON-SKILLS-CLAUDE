---
name: meta-optimizer
description: Rewrites page title tags and meta descriptions to maximize organic click-through rate. Use when the user wants better titles or metas, says 'optimize my meta', 'rewrite my title tag', 'improve my meta description', 'my CTR is low', or pastes a URL and asks for title/meta suggestions. Produces 3 ranked title + meta options per page with character counts and the reasoning behind each, plus the single recommended pick.
---

# meta-optimizer

*Cluster: On-page & Content . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Turn weak, truncated, or keyword-stuffed title tags and meta descriptions into compelling, correctly-sized snippets that earn more clicks from the SERP without losing keyword relevance.

## When to use

- The user pastes a URL and asks to improve its title or meta
- A page has high impressions but low CTR (often surfaced by ctr-booster)
- A new page is about to launch and needs its snippet written
- Titles are getting truncated in search results

## Inputs required

- Page URL (required)
- Primary target keyword (strongly recommended)
- Optional: the brand name, the current title/meta, the page's main value proposition

## Step-by-step instructions

1. Fetch the page (or read the pasted content). Identify the primary topic, the target keyword, the audience, and the single most compelling reason to click.
2. Read the current title tag and meta description. Note the character counts and flag if either is truncated (title over 60 chars, meta over 155 chars) or missing the keyword.
3. Write 3 distinct title options: (A) keyword-forward and safe, (B) benefit-forward and compelling, (C) curiosity or number-driven. Keep each under 60 characters including the brand if it fits.
4. Write a matching meta description for each (under 155 characters), each containing the keyword naturally and ending with an implied or explicit call to action.
5. Rank the 3 by likely CTR for this query intent and recommend one. Explain the reasoning in one line each.
6. Output character counts for every option so the user can verify nothing will truncate.

## Output format

A table with 3 title + meta pairs, each with character counts and a one-line rationale, followed by the single recommended pick and why.

## Quality checklist

- [ ] Every title is under 60 characters (including brand if present)
- [ ] Every meta description is under 155 characters
- [ ] The target keyword appears naturally in each title and each meta
- [ ] No keyword stuffing, no ALL CAPS, no clickbait that the page can't deliver
- [ ] The recommended pick matches the page's actual search intent

## Optimization notes

CTR is the goal, not keyword density. A title that reads like a human wrote it for a human beats a keyword-stuffed one almost every time. When the page already ranks well but under-clicks, prioritize the benefit-forward or curiosity option over the safe one.
