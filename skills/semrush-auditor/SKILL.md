---
name: semrush-auditor
description: Audits a domain's site issues using Semrush data in one pass. Use when the user says 'Semrush audit', 'audit my site with Semrush', 'Semrush site health', 'pull my Semrush issues', or wants a summarized read of their Semrush Site Audit. Reads the Semrush site audit and summarizes issues by severity, so the user gets a clear health picture instead of a raw list of hundreds of flags.
---

# semrush-auditor

*Cluster: Semrush . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Summarize a Semrush Site Audit into a clear, severity-ranked health picture so the user knows what actually needs fixing instead of staring at hundreds of raw flags.

## When to use

- The user wants their Semrush Site Audit interpreted, not just exported
- Regular site health review
- Prioritizing technical work from Semrush findings
- Before handing technical issues to a developer

## Inputs required

- Semrush connection or access to the domain's Site Audit (required)
- The domain to audit (required)
- Optional: a specific category to focus on (crawlability, HTTPS, performance, links)

## Step-by-step instructions

1. Pull the Semrush Site Audit for the domain: the overall site health score and the full list of errors, warnings, and notices.
2. Group findings into errors (high severity), warnings (medium), and notices (low).
3. Within each severity, cluster related issues (all the broken-link issues together, all the meta issues together, all the performance issues together).
4. For each cluster, report how many pages are affected and what the real-world impact is (broken links waste crawl budget and hurt UX; missing H1s weaken relevance).
5. Identify the highest-leverage fixes: the few changes that resolve the most issues or the most impactful ones.
6. Summarize the site health score and recommend the order to tackle the clusters.

## Output format

A health summary: overall score, then issue clusters grouped by severity, each with affected page count, impact, and priority. Ends with the recommended fix order.

## Quality checklist

- [ ] The overall site health score is reported
- [ ] Issues are grouped by severity, then clustered by type
- [ ] Affected page counts are included for each cluster
- [ ] Real-world impact is explained, not just the issue name
- [ ] The output is a prioritized summary, not a raw dump of every flag

## Optimization notes

Semrush flags everything, including low-impact notices. The skill's job is judgment: which of the hundreds of flags actually move rankings or hurt users. Pair this with semrush-errors to go from 'here's the picture' to 'here's the fix for each one'.
