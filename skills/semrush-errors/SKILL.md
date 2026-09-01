---
name: semrush-errors
description: Takes the errors flagged in Semrush and gives the exact fix for each, ranked by impact. Use when the user says 'fix Semrush errors', 'Semrush issues', 'resolve my Semrush flags', 'how do I fix these Semrush problems', or has run semrush-auditor and wants the fixes. Turns Semrush's flagged errors into an executable, impact-ranked fix list a developer or marketer can act on directly.
---

# semrush-errors

*Cluster: Semrush . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Convert Semrush's flagged errors into a concrete, impact-ranked fix list, so each issue has a clear action rather than just a label.

## When to use

- After running semrush-auditor, to get the fixes
- The user has Semrush errors and wants to resolve them
- Preparing a technical fix brief for a developer
- Working through a Semrush issue backlog systematically

## Inputs required

- Semrush connection or the list of flagged errors (required)
- The domain (required)
- Optional: which error categories to prioritize

## Step-by-step instructions

1. Pull or read the Semrush errors and warnings for the domain.
2. For each distinct error type, explain the cause in plain language and confirm whether it genuinely hurts SEO or is a low-impact notice.
3. Give the exact fix for each: the specific change, where it lives (CMS field, template, robots.txt, redirect rule, page content), and whether it's a marketer fix or a developer fix.
4. Where the fix is code, provide the snippet or the precise instruction.
5. Rank the fixes by impact: things blocking indexing or breaking the crawl first, cosmetic notices last.
6. Group the developer fixes separately so they can be handed off as one clean batch.

## Output format

An impact-ranked fix list: Error | Cause | Fix | Where it lives | Marketer or Dev. Developer fixes grouped at the end as a paste-ready handoff brief.

## Quality checklist

- [ ] Every error type has a specific, executable fix
- [ ] Each fix names where it lives (template, CMS field, robots.txt, etc.)
- [ ] Marketer fixes and developer fixes are clearly separated
- [ ] Fixes are ranked by SEO impact, not by Semrush's default order
- [ ] Low-impact notices are marked as optional, not urgent

## Optimization notes

Semrush severity labels don't always match real SEO impact. A 'warning' that a page is blocked from indexing matters more than an 'error' about a slightly long title. Re-rank by genuine impact. Separating dev fixes into one batch is what makes this actually get done - one ticket beats twenty scattered asks.
