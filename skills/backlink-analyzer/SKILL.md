---
name: backlink-analyzer
description: Analyzes and monitors a backlink profile and flags toxic links. Use when the user says 'backlinks', 'link profile', 'analyze my backlinks', 'toxic links', 'who links to me', 'should I disavow', or wants to track link changes over time. Scores the link profile on authority and relevance, flags potentially toxic links by confidence, and tracks new and lost links versus the prior run.
---

# backlink-analyzer

*Cluster: Keywords & Links . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Give a clear read on backlink profile quality - authority, relevance, and risk - flagging genuinely toxic links by confidence level and tracking what changed since last time.

## When to use

- The user wants to understand their link profile health
- Suspected negative SEO or a spammy link influx
- Deciding whether to disavow links
- Monthly link monitoring to catch new and lost links

## Inputs required

- The domain (required)
- Backlink data source - Semrush connection or a backlink export (required)
- Optional: the prior run's data, to track new and lost links

## Step-by-step instructions

1. Pull the backlink profile: referring domains, total backlinks, anchor text distribution, and authority scores.
2. Score overall profile health: referring domain count and quality, authority distribution, anchor text naturalness (over-optimized exact-match anchors are a risk signal), and link velocity.
3. Identify potentially toxic links: links from spam domains, link networks, irrelevant foreign-language sites, sitewide footer links, and unnatural anchor patterns. Rate each by confidence (high/medium/low).
4. For high-confidence toxic links, recommend action (monitor, reach out for removal, or disavow as a last resort). For medium and low, recommend monitoring, not action.
5. If prior data is provided, report new links gained and links lost since last run, flagging any sudden spammy influx.
6. Output the health score, the flagged links by confidence, and the change summary.

## Output format

A profile summary (health score, referring domains, anchor distribution), a flagged-links table (Link | Why flagged | Confidence | Recommended action), and a new/lost links change summary.

## Quality checklist

- [ ] Profile health considers authority, relevance, and anchor naturalness - not just link count
- [ ] Toxic links are rated by confidence, not flagged indiscriminately
- [ ] Disavow is recommended only for high-confidence toxic links, as a last resort
- [ ] New and lost links are tracked when prior data exists
- [ ] A sudden spammy link influx (possible negative SEO) is called out

## Optimization notes

Disavow is a loaded gun - aim carefully. Google is good at ignoring most spam links on its own, so disavowing healthy links does more harm than good. Only disavow high-confidence toxic links, and prefer removal outreach first. Never disavow on a tool's automated 'toxic score' alone; verify each one.
