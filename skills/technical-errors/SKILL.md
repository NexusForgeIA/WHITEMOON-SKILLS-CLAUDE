---
name: technical-errors
description: Takes technical SEO issues found in an audit and gives the specific fix for each. Use when the user says 'fix technical errors', 'fix technical SEO', 'how do I fix these technical issues', 'resolve crawl issues', or has run technical-auditor and wants the fixes. Turns technical findings into an executable, impact-ranked fix list with code where needed, separating marketer fixes from developer fixes.
---

# technical-errors

*Cluster: Technical SEO . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Convert technical audit findings into concrete, impact-ranked fixes, each with the exact change and where it lives, so technical SEO problems get resolved instead of just listed.

## When to use

- After running technical-auditor, to get the fixes
- The user has technical issues and needs the resolution steps
- Building a developer handoff brief for technical work
- Working through a technical issue backlog

## Inputs required

- The technical issues to fix (from technical-auditor or pasted in) (required)
- The site or affected URLs (required)
- Optional: the platform (WordPress, Shopify, Next.js, Webflow) so fixes are platform-specific

## Step-by-step instructions

1. Read the technical issues. For each, confirm the cause and the real SEO impact.
2. Give the exact fix: the specific change, where it lives (theme template, plugin setting, CMS field, server config, robots.txt), and the snippet or instruction.
3. Tailor fixes to the platform where known - a canonical fix in WordPress differs from one in Next.js.
4. Mark each fix as a marketer fix (CMS field, content) or a developer fix (template, config, code).
5. Rank by impact: indexing-blocking and crawl-breaking issues first, on-page elements next, cosmetic last.
6. Group developer fixes into one paste-ready handoff brief with file locations and exact changes.

## Output format

An impact-ranked fix list: Issue | Cause | Fix | Where it lives | Marketer or Dev. Developer fixes grouped at the end as a clean handoff brief with snippets.

## Quality checklist

- [ ] Each issue has a specific fix, not a general suggestion
- [ ] Fixes are platform-specific where the platform is known
- [ ] Marketer and developer fixes are separated
- [ ] Fixes are ranked by SEO impact
- [ ] Developer fixes are grouped into one handoff brief with file locations

## Optimization notes

The handoff brief is the deliverable that matters. Developers fix things fast when they get exact file locations and snippets, and stall when they get vague tickets. Always end with a grouped, paste-ready dev brief. For platform-specific fixes, ask which CMS if it's not stated - the fix differs significantly.
