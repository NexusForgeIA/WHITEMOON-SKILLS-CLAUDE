---
name: web-design-systems
description: Catálogo de 6 sistemas de diseño web aplicables a cualquier proyecto. Úsalo al crear o rediseñar webs, landings o dashboards para elegir una dirección visual coherente (colores, tipografía, componentes) en vez de improvisar. Estilos: Enterprise Dark, Clean Light Enterprise, Bold Editorial, Minimal Japanese, Tech Brutalist, Warm Professional.
---

# Web Design Systems

## Overview

Seis sistemas de diseño web completos y listos para aplicar. Cada uno define variables CSS exactas, componentes clave (nav, hero, cards, CTA), cuándo usarlo y empresas reales que lo usan como referencia.

**Regla de uso**: elegir UN estilo por proyecto y aplicarlo de forma consistente. Nunca mezclar variables de dos estilos en la misma web. Antes de escribir CSS, copiar el bloque `:root` del estilo elegido y construir todo a partir de esos tokens.

**Cómo elegir**:

| Proyecto | Estilo |
|---|---|
| SaaS, agencia IA, producto técnico oscuro | 1 — Enterprise Dark |
| Fintech, productividad, B2B premium | 2 — Clean Light Enterprise |
| Blog, medio, marketing de contenidos | 3 — Bold Editorial |
| Lujo, producto premium, portfolio | 4 — Minimal Japanese |
| Dev tools, APIs, documentación técnica | 5 — Tech Brutalist |
| Marketing, CRM, pyme con trato humano | 6 — Warm Professional |

---

## ESTILO 1 — ENTERPRISE DARK

**Inspiración**: Linear, Vercel, Anthropic. Es el estilo actual de WhiteMoon.

**Cuándo usarlo**: SaaS técnicos, agencias IA, productos para desarrolladores o early adopters. Transmite precisión, modernidad y dominio técnico. Evitarlo en públicos no técnicos o webs con mucho contenido de lectura larga.

**Empresas reales**: Linear (linear.app), Vercel (vercel.com), Anthropic (anthropic.com), Raycast, Resend, Supabase (modo oscuro).

### Variables CSS

```css
:root {
  /* Fondos */
  --bg: #0B0F17;
  --bg-elevated: #111827;
  --bg-card: rgba(255, 255, 255, 0.03);

  /* Texto */
  --text: #F0F0F5;
  --text-muted: #8888A0;

  /* Acentos */
  --accent: #7C4DFF;
  --accent-hover: #9D70FF;
  --accent-glow: rgba(124, 77, 255, 0.25);
  --success: #00D4AA;

  /* Bordes y sombras */
  --border: rgba(255, 255, 255, 0.08);
  --border-hover: rgba(255, 255, 255, 0.16);
  --shadow-glow: 0 0 40px var(--accent-glow);

  /* Tipografía */
  --font: 'Inter', -apple-system, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Espaciado y radios */
  --radius: 8px;
  --radius-lg: 12px;
  --space-section: clamp(4rem, 10vw, 8rem);
}
```

### Componentes clave

**Nav**: fija, fondo `--bg` con `backdrop-filter: blur(12px)` y borde inferior `1px solid var(--border)`. Logo a la izquierda, enlaces `--text-muted` que pasan a `--text` en hover, CTA pequeño a la derecha.

```css
.nav {
  position: sticky; top: 0; z-index: 50;
  background: rgba(11, 15, 23, 0.8);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
}
```

**Hero**: titular grande (clamp 2.5–4.5rem, weight 600, letter-spacing -0.02em), subtítulo `--text-muted`, gradiente radial sutil de `--accent-glow` detrás. Una sola idea, sin carruseles.

```css
.hero h1 {
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 600;
  letter-spacing: -0.02em;
  background: linear-gradient(180deg, var(--text), var(--text-muted));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
```

**Cards**: fondo `--bg-card`, borde `--border` que pasa a `--border-hover` en hover, radio `--radius-lg`. Sin sombras pesadas; la profundidad viene del borde.

**CTA**: botón primario fondo `--accent`, hover `--accent-hover` con glow sutil. Secundario: solo borde.

```css
.btn-primary {
  background: var(--accent); color: #fff;
  padding: 0.65rem 1.4rem; border-radius: var(--radius);
  transition: background 0.15s, box-shadow 0.15s;
}
.btn-primary:hover { background: var(--accent-hover); box-shadow: var(--shadow-glow); }
```

---

## ESTILO 2 — CLEAN LIGHT ENTERPRISE

**Inspiración**: Stripe, Notion, Figma.

**Cuándo usarlo**: fintech, herramientas de productividad, B2B premium que necesita transmitir confianza y solidez. Funciona en públicos amplios y aguanta mucha densidad de información. Evitarlo si se busca personalidad fuerte o diferenciación visual agresiva.

**Empresas reales**: Stripe (stripe.com), Notion (notion.com), Figma (figma.com), Mercury, Slack (marketing), Atlassian.

### Variables CSS

```css
:root {
  --bg: #FFFFFF;
  --bg-subtle: #F6F8FA;
  --bg-card: #FFFFFF;

  --text: #0A0A0A;
  --text-secondary: #425466;
  --text-muted: #697386;

  --accent: #635BFF;
  --accent-hover: #5349E8;
  --accent-subtle: #F0EFFF;

  --border: #E6E8EB;
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.08);

  --font: 'Inter', -apple-system, sans-serif;

  --radius: 8px;
  --radius-lg: 16px;
  --space-section: clamp(4rem, 9vw, 7rem);
}
```

### Componentes clave

**Nav**: blanca, sombra `--shadow-sm` solo al hacer scroll. Enlaces `--text-secondary`, dropdowns con `--shadow-md` para producto/recursos.

**Hero**: titular weight 700 en `--text`, palabra clave opcional en `--accent`. Layout 50/50: texto a la izquierda, captura de producto o ilustración a la derecha. Fondo con gradiente diagonal muy sutil (estilo Stripe) o blanco puro.

**Cards**: blancas sobre `--bg-subtle`, borde `--border` + `--shadow-sm`, hover eleva a `--shadow-md` con `transform: translateY(-2px)`. Icono en contenedor `--accent-subtle`.

```css
.card {
  background: var(--bg-card);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  transition: box-shadow 0.2s, transform 0.2s;
}
.card:hover { box-shadow: var(--shadow-md); transform: translateY(-2px); }
```

**CTA**: primario `--accent` con texto blanco, pill o radio 8px. Patrón Stripe: botón con flecha "→" que se desplaza en hover. Secundario: texto `--accent` sin fondo.

---

## ESTILO 3 — BOLD EDITORIAL

**Inspiración**: Manus, Linear Blog, Vercel Blog.

**Cuándo usarlo**: blogs, medios, marketing de contenidos, anuncios de producto, manifiestos. La tipografía ES el diseño: contrastes extremos de tamaño, jerarquía agresiva. Evitarlo en dashboards o interfaces densas en datos.

**Empresas reales**: Manus (manus.im), Vercel Blog (vercel.com/blog), Linear Blog, The Browser Company, Stripe Press, Increment.

### Variables CSS

```css
:root {
  --bg: #FFFFFF;
  --bg-inverse: #0A0A0A;

  --text: #0A0A0A;
  --text-muted: #666666;

  --accent: #0A0A0A; /* el "acento" es el propio negro: sin color extra */

  --border: #0A0A0A;
  --border-light: #EAEAEA;

  /* Slab serif para titulares + sans para cuerpo */
  --font-display: 'Zilla Slab', 'Roboto Slab', Georgia, serif;
  --font: 'Inter', -apple-system, sans-serif;

  /* Jump ratio extremo: titular 8-12x el cuerpo */
  --text-hero: clamp(3.5rem, 10vw, 8rem);
  --text-body: 1.125rem;

  --radius: 0px; /* esquinas rectas: lenguaje editorial */
  --space-section: clamp(5rem, 12vw, 10rem);
}
```

### Componentes clave

**Nav**: mínima, casi invisible. Solo logo + 2-3 enlaces en sans pequeña, mayúsculas con tracking. Borde inferior fino `--border-light` o nada.

**Hero**: el titular ocupa el 40-60% del viewport en `--font-display`, weight 600-700, line-height 1.0-1.1. Alineación asimétrica (izquierda, nunca centrado). Fecha/categoría en sans diminuta encima, estilo kicker de periódico.

```css
.hero h1 {
  font-family: var(--font-display);
  font-size: var(--text-hero);
  line-height: 1.05;
  letter-spacing: -0.03em;
  max-width: 14ch;
}
.kicker {
  font-family: var(--font);
  font-size: 0.8rem;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  color: var(--text-muted);
}
```

**Cards**: sin sombras ni fondos. Separadores horizontales `1px solid var(--border-light)`, como índice de revista: número/fecha + titular slab + extracto en sans. Hover: subrayado del titular.

**CTA**: enlaces de texto subrayados con flecha, o bloque invertido (fondo `--bg-inverse`, texto blanco) a ancho completo al final del artículo. Nada de botones pill con sombra.

**Cuerpo de artículo**: columna de lectura `max-width: 68ch`, `--text-body` con line-height 1.7. Pull quotes en `--font-display` a 2rem cruzando el margen.

---

## ESTILO 4 — MINIMAL JAPANESE

**Inspiración**: Applesuisse, Muji digital.

**Cuándo usarlo**: marcas premium, lujo, producto físico de alta gama, portfolios, estudios de diseño. El espacio en blanco es el protagonista; el producto/foto habla por sí solo. Evitarlo cuando hay que comunicar mucha información o features comparables.

**Empresas reales**: Muji (muji.com), Apple (páginas de producto), Aesop (aesop.com), Kinfolk, Teenage Engineering (línea minimal), Normann Copenhagen.

### Variables CSS

```css
:root {
  --bg: #F5F5F0;
  --bg-card: #FFFFFF;

  --text: #1A1A1A;
  --text-muted: #7A7A72;

  /* Sin colores de acento: la jerarquía se construye con tamaño y espacio */

  --border: #E3E3DC;

  --font: 'Noto Sans JP', 'Helvetica Neue', sans-serif;
  --font-serif: 'Noto Serif JP', Georgia, serif; /* opcional, detalles */

  --text-hero: clamp(1.75rem, 3.5vw, 2.75rem); /* titulares CONTENIDOS, no enormes */
  --tracking: 0.05em;

  --radius: 0px;
  --space-section: clamp(6rem, 15vw, 12rem); /* espaciado muy generoso */
  --space-element: 3rem;
}
```

### Componentes clave

**Nav**: texto fino, espaciado generoso entre enlaces (3rem+), weight 400, tracking `--tracking`. Sin CTA destacado en la nav: todo al mismo nivel visual.

**Hero**: fotografía a sangre o producto centrado con vacío masivo alrededor. Titular pequeño en proporción (nunca más de 3rem), weight 400-500, a menudo debajo de la imagen, no encima.

```css
.hero {
  min-height: 90vh;
  display: grid;
  place-items: center;
  padding: var(--space-section) 2rem;
}
.hero h1 {
  font-size: var(--text-hero);
  font-weight: 400;
  letter-spacing: var(--tracking);
  text-align: center;
}
```

**Cards**: imagen + caption. Sin bordes, sin sombras, sin fondos. La separación es el propio espacio (gap 4rem+). Caption en `--text-muted` a 0.85rem con tracking.

**CTA**: enlace de texto con subrayado fino a 1px y offset, o botón fantasma de borde 1px `--text` que invierte colores en hover con transición lenta (0.4s). Nunca colores llamativos.

```css
.btn-ghost {
  border: 1px solid var(--text);
  background: transparent; color: var(--text);
  padding: 0.9rem 2.5rem;
  letter-spacing: var(--tracking);
  transition: background 0.4s ease, color 0.4s ease;
}
.btn-ghost:hover { background: var(--text); color: var(--bg); }
```

---

## ESTILO 5 — TECH BRUTALIST

**Inspiración**: shadcn/ui, Clerk, Railway.

**Cuándo usarlo**: dev tools, APIs, documentación, CLIs, infraestructura. El público es desarrollador y valora densidad, precisión y cero decoración. Evitarlo en público general o marketing emocional.

**Empresas reales**: shadcn/ui (ui.shadcn.com), Clerk (clerk.com), Railway (railway.com), Warp, Fly.io, Neon, Turso.

### Variables CSS

```css
:root {
  --bg: #000000;
  --bg-elevated: #0A0A0A;
  --bg-code: #111111;

  --text: #FAFAFA;
  --text-muted: #A1A1A1;

  --accent: #FAFAFA; /* el blanco ES el acento */
  --accent-functional: #22C55E; /* verde solo para estados: ok/online */
  --danger: #EF4444;

  --border: #27272A;
  --border-strong: #52525B;

  --font: 'Inter', -apple-system, sans-serif;
  --font-mono: 'Geist Mono', 'JetBrains Mono', 'Fira Code', monospace;

  --radius: 6px;
  --space-section: clamp(3rem, 8vw, 6rem); /* denso, sin vacíos teatrales */
}
```

### Componentes clave

**Nav**: borde inferior `1px solid var(--border)` siempre visible. Breadcrumbs o tabs en `--font-mono` a 0.85rem. Atajo de teclado visible (`⌘K`) en el buscador.

**Hero**: titular medio (3-4rem max) weight 600, acompañado SIEMPRE de un bloque de código o terminal real como prueba. El código es el hero.

```css
.terminal {
  background: var(--bg-code);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  font-family: var(--font-mono);
  font-size: 0.875rem;
  padding: 1.25rem;
}
.terminal .prompt::before { content: '$ '; color: var(--text-muted); }
```

**Cards**: bordes visibles `1px solid var(--border)` que pasan a `--border-strong` en hover. Grid con `gap: 1px` y fondo `--border` para crear retícula de líneas compartidas (patrón Vercel/Railway). Labels en mono uppercase.

```css
.grid-bordered {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1px;
  background: var(--border);
  border: 1px solid var(--border);
}
.grid-bordered > * { background: var(--bg); padding: 2rem; }
```

**CTA**: botón blanco sobre negro (inversión total), radio 6px, texto weight 500. Secundario: borde `--border-strong`. Junto al CTA, siempre el comando de instalación copiable en mono.

```css
.btn-primary {
  background: var(--text); color: var(--bg);
  padding: 0.6rem 1.25rem; border-radius: var(--radius);
  font-weight: 500;
}
.btn-primary:hover { background: #E4E4E7; }
```

---

## ESTILO 6 — WARM PROFESSIONAL

**Inspiración**: Webflow, HubSpot, Intercom.

**Cuándo usarlo**: marketing, CRM, herramientas para empresas medianas, servicios con trato humano. Profesional pero cercano: colores cálidos, esquinas redondeadas, ilustraciones y fotos de personas. Evitarlo en productos puramente técnicos o de lujo.

**Empresas reales**: Webflow (webflow.com), HubSpot (hubspot.com), Intercom (intercom.com), Mailchimp, Typeform, Calendly.

### Variables CSS

```css
:root {
  --bg: #FAFAF8;
  --bg-card: #FFFFFF;
  --bg-warm: #FFF3ED; /* bloques destacados */

  --text: #1F2421;
  --text-secondary: #51564F;
  --text-muted: #8A8F87;

  --accent: #FF6B4A;        /* coral cálido */
  --accent-hover: #E8552F;
  --accent-subtle: #FFE8E0;
  --secondary: #2D7A6E;     /* verde de apoyo para iconos/badges */

  --border: #E8E6E1;
  --shadow-soft: 0 8px 24px rgba(31, 36, 33, 0.08);

  --font: 'Plus Jakarta Sans', -apple-system, sans-serif;

  --radius: 12px;
  --radius-lg: 20px;
  --radius-pill: 999px;
  --space-section: clamp(4rem, 10vw, 7.5rem);
}
```

### Componentes clave

**Nav**: fondo `--bg`, CTA pill `--accent` siempre visible a la derecha. Enlaces weight 500 en `--text-secondary`. En móvil, el CTA se mantiene fuera del menú hamburguesa.

**Hero**: titular weight 700-800 con una palabra subrayada o resaltada en `--accent` (subrayado dibujado a mano en SVG, marca de la casa de este estilo). Foto de personas reales o ilustración cálida a la derecha. Social proof (logos de clientes) inmediatamente debajo.

```css
.highlight {
  position: relative;
  white-space: nowrap;
}
.highlight svg { /* subrayado SVG dibujado */
  position: absolute;
  left: 0; bottom: -0.15em;
  width: 100%; height: 0.3em;
  color: var(--accent);
}
```

**Cards**: blancas con `--shadow-soft`, radio `--radius-lg`, sin borde o borde muy claro. Icono en círculo `--accent-subtle`. Hover con elevación suave. Testimonios con foto circular de la persona.

```css
.card {
  background: var(--bg-card);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-soft);
  padding: 2rem;
  transition: transform 0.2s ease;
}
.card:hover { transform: translateY(-4px); }
```

**CTA**: botón pill `--radius-pill` fondo `--accent`, texto blanco weight 600. Bloque CTA final de página sobre fondo `--bg-warm` con titular + botón + claim de garantía ("Sin permanencia", "Prueba gratis 14 días").

```css
.btn-primary {
  background: var(--accent); color: #fff;
  padding: 0.85rem 1.75rem;
  border-radius: var(--radius-pill);
  font-weight: 600;
  transition: background 0.2s, transform 0.1s;
}
.btn-primary:hover { background: var(--accent-hover); transform: scale(1.02); }
```

---

## Reglas transversales (aplican a los 6 estilos)

1. **Un estilo por proyecto**: copiar el `:root` completo y no mezclar tokens entre estilos.
2. **Tipografía**: cargar fuentes con `font-display: swap` y máximo 2 familias (+1 mono si aplica).
3. **Accesibilidad**: contraste mínimo 4.5:1 en texto normal en todos los estilos; verificar especialmente acentos sobre fondo (#7C4DFF y #FF6B4A necesitan texto blanco, nunca negro).
4. **Responsive**: todos los tamaños de titular con `clamp()`; probar en 320px, 768px, 1024px y 1440px.
5. **Motion**: transiciones 0.15-0.2s en estilos 1, 2, 5 y 6; 0.4s en el 4; casi ninguna en el 3. Respetar `prefers-reduced-motion`.
6. **Coherencia con frontend-ui-engineering**: esta skill define la dirección visual; la skill `frontend-ui-engineering` define la calidad de implementación (estados, accesibilidad, componentes). Usar ambas juntas.
