---
name: internal-linker
description: Finds orphan pages and weak internal linking, then suggests specific links from existing content with anchor text. Use when the user says 'internal links', 'orphan pages', 'internal linking', 'link my pages', 'find pages with no links', or wants to improve site structure and link equity flow. Outputs orphan pages, under-linked priority pages, and a list of source-page to target-page link suggestions with recommended anchor text.
---

# internal-linker

*Cluster: On-page & Content . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Strengthen internal linking so important pages get the link equity they need and no valuable page is left orphaned (zero internal links pointing to it).

## When to use

- The user wants to fix orphan pages or thin internal linking
- A priority page isn't ranking and may lack internal links
- After publishing new content, to wire it into the existing site
- Auditing site structure and link equity distribution

## Inputs required

- Site URL or XML sitemap (required)
- Optional: the list of priority pages that most need link equity
- Optional: GSC data to identify which pages already rank and can pass equity

## Step-by-step instructions

1. Pull the site's pages from the sitemap or by crawling. Build a list of all indexable URLs.
2. For each page, identify which other pages link to it internally. Flag any page with zero internal links pointing to it as an orphan.
3. Identify the priority pages (high commercial value or pages the user names). Count internal links to each and flag the under-linked ones.
4. For each orphan and under-linked priority page, find 3-5 existing pages that are topically relevant and could naturally link to it.
5. For each suggested link, propose descriptive anchor text that includes the target's keyword without being exact-match spam.
6. Output the suggestions grouped by target page, with source page, recommended anchor text, and a one-line reason the link is relevant.

## Output format

Two sections: (1) Orphan pages list with suggested source links. (2) Under-linked priority pages with suggested source links. Each suggestion: Source page | Target page | Anchor text | Why relevant.

## Quality checklist

- [ ] Every orphan page is identified and given at least 2 link suggestions
- [ ] Anchor text is descriptive and varied, never exact-match repeated
- [ ] Suggested source pages are genuinely topically relevant to the target
- [ ] Priority pages are linked from pages that themselves have authority
- [ ] No suggestion creates a link from an irrelevant page just to hit a count

## Optimization notes

Relevance beats volume. One contextual link from a closely-related, authoritative page is worth more than five links from unrelated pages. Vary anchor text naturally; a target page with twenty identical exact-match anchors looks manipulative.
