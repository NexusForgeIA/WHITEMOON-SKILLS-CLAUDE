---
name: schema-generator
description: Generates valid JSON-LD structured data for any page type. Use when the user says 'schema', 'structured data', 'JSON-LD', 'rich results', 'markup my page', or names a schema type (Product, Article, FAQ, LocalBusiness, Review, Breadcrumb, HowTo). Reads the page, picks the right schema type, and outputs paste-ready, validation-passing JSON-LD with every value matched to what the page actually shows.
---

# schema-generator

*Cluster: On-page & Content . Part of the 17 SEO Skills set by Vicky Lalwani, Digital Marketing Director.*

## Purpose

Produce correct, paste-ready JSON-LD that matches the page's visible content exactly, so the page becomes eligible for rich results and is read accurately by AI agents.

## When to use

- A page is missing structured data
- The user wants rich results (stars, FAQ accordions, prices) in the SERP
- A new page launches and needs markup
- Existing schema is invalid or doesn't match the page content

## Inputs required

- Page URL (required)
- Page type if known (Product, Article, FAQPage, LocalBusiness, etc.) - otherwise the skill detects it
- Optional: the exact values to use (price, rating, author) if not all visible on the page

## Step-by-step instructions

1. Fetch the page. Identify the page type from its content (a product page, an article, an FAQ section, a local business page, a how-to).
2. Select the correct schema.org type(s). A page may need more than one (e.g. Article plus Breadcrumb, or Product plus Offer plus AggregateRating).
3. Extract every value from the visible page content: name, price, currency, availability, rating value, review count, author, dates, FAQ question/answer pairs.
4. Build the JSON-LD with only fields the page actually supports. Never invent a rating or a price the page doesn't show - mismatched schema gets pages ignored.
5. Include all required fields for the type and the high-value recommended ones. Use correct enum values (e.g. https://schema.org/InStock).
6. Output the complete JSON-LD inside a script tag, ready to paste into the page head, plus a one-line note on where it goes and how to validate it.

## Output format

A complete, paste-ready JSON-LD script block for the detected page type, followed by a note on placement and a reminder to test in Google's Rich Results Test.

## Quality checklist

- [ ] The schema type matches the actual page type
- [ ] Every value in the schema matches what the page visibly shows (no invented data)
- [ ] All required fields for the type are present
- [ ] Enum values use correct schema.org URLs (InStock, OutOfStock, etc.)
- [ ] The output validates with no errors in Google's Rich Results Test

## Optimization notes

The cardinal rule: schema must match the visible page. A Product schema with a price the page doesn't show, or an AggregateRating with no visible reviews, violates Google's guidelines and can earn a manual action. When in doubt, mark up only what's truly on the page.
