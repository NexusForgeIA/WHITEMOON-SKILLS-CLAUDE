---
name: web-design-systems
description: Use when creating a new website or landing page from scratch. Presents 6 complete visual design systems with CSS variables, typography, and components ready to implement. Never use generic AI aesthetics.
---

# Web Design Systems

## Instrucción para Code

Cuando vayas a crear una web nueva, SIEMPRE muestra estos 6 estilos al usuario y pregunta cuál prefiere ANTES de escribir código.

---

## ESTILO 1 — ENTERPRISE DARK

**Inspiración**: Linear, Vercel, Anthropic
**Ideal para**: Agencias IA, SaaS, tecnología

**Paleta**:

```css
:root {
  --bg: #0B0F17;
  --bg-card: #131720;
  --text: #F0F2F5;
  --muted: #8892A4;
  --p: #7c4dff;
  --p-light: #9b6dff;
  --border: rgba(255, 255, 255, 0.08);
}
```

**Tipografía**: Inter 400/600/700
**Hero**: texto grande izquierda, gradiente púrpura
**Cards**: glassmorphism sutil, border glow

---

## ESTILO 2 — CLEAN LIGHT ENTERPRISE

**Inspiración**: Stripe, Notion, Figma
**Ideal para**: Fintech, consultoría, B2B premium

**Paleta**:

```css
:root {
  --bg: #FFFFFF;
  --bg-card: #F6F9FC;
  --text: #0A2540;
  --muted: #425466;
  --p: #635BFF;
  --p-light: #7A73FF;
  --border: #E3E8EF;
}
```

**Tipografía**: Inter 400/500/700
**Hero**: centrado, ilustración derecha, mucho espacio
**Cards**: sombra sutil, border radius 12px

---

## ESTILO 3 — BOLD EDITORIAL

**Inspiración**: The Verge, Manus, Linear Blog
**Ideal para**: Blogs, medios, contenido B2B

**Paleta**:

```css
:root {
  --bg: #FAFAFA;
  --bg-card: #FFFFFF;
  --text: #111111;
  --muted: #666666;
  --p: #FF3B30;
  --border: #E5E5E5;
}
```

**Tipografía**:
- Headlines: Playfair Display 700 / Fraunces
- Body: Inter 400

**Hero**: headline enorme, imagen sangra al borde
**Layout**: columna editorial, márgenes amplios

---

## ESTILO 4 — MINIMAL PREMIUM

**Inspiración**: Apple, Muji, Zara digital
**Ideal para**: Clínicas premium, consultoría lujo

**Paleta**:

```css
:root {
  --bg: #F8F7F4;
  --bg-card: #FFFFFF;
  --text: #1A1A1A;
  --muted: #888888;
  --p: #1A1A1A;
  --border: #E8E8E4;
}
```

**Tipografía**:
- Headlines: Cormorant Garamond 300/600
- Body: Inter 300/400

**Hero**: imagen grande, texto pequeño y elegante
Sin colores llamativos, todo en neutros

---

## ESTILO 5 — TECH BRUTALIST

**Inspiración**: shadcn/ui, Railway, Clerk
**Ideal para**: Dev tools, APIs, productos técnicos

**Paleta**:

```css
:root {
  --bg: #000000;
  --bg-card: #0A0A0A;
  --text: #FAFAFA;
  --muted: #888888;
  --p: #FFFFFF;
  --border: rgba(255, 255, 255, 0.15);
}
```

**Tipografía**:
- Headlines: Geist Mono / JetBrains Mono
- Body: Geist Sans / Inter

**Hero**: grid de puntos, código visible, raw
**Cards**: border visible, sin sombras, esquinas rectas

---

## ESTILO 6 — WARM PROFESSIONAL

**Inspiración**: Webflow, HubSpot, Intercom
**Ideal para**: Marketing, CRM, empresas medianas

**Paleta**:

```css
:root {
  --bg: #FAFAF8;
  --bg-card: #FFFFFF;
  --text: #1A1A2E;
  --muted: #6B7280;
  --p: #FF6B35;
  --p-light: #FF8C5A;
  --border: #E5E7EB;
}
```

**Tipografía**: Plus Jakarta Sans 400/600/700
**Hero**: ilustración isométrica, CTA naranja
**Cards**: rounded-2xl, sombra cálida, iconos line
