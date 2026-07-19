# workflows-venta-whitemoon

Base de conocimiento para **vender y construir automatizaciones** como servicio (planes BASIC / PRO / ENTERPRISE ESENCIAL de whitemoon.es/automatizaciones).

Regla de oro: las plantillas de n8n que circulan por internet son solo **recetas**. Nosotros NO usamos n8n. Cada automatización vendida se construye **nativa en el Supabase del cliente** (`wm-[cliente]`), con Edge Functions + Claude API + Resend/Telegram. Always-on, sin cuotas por ejecución, aislado por cliente, tuyo.

## Archivos

- **CATALOGO-automatizaciones.md** — repertorio de automatizaciones vendibles, por categoría, con sector, plan y cómo se construye. Es el argumentario de venta + de dónde tirar.
- **PLAYBOOK-construccion.md** — la máquina de entrega: mapeo n8n→Supabase, los 7 pasos de montaje, convenciones de nombres y checklist. Es cómo se construye cualquier automatización rápido y siempre igual.

## Cómo se usa

1. Cliente contrata un plan de automatización → mira el CATÁLOGO, elige las automatizaciones que entran en su plan/sector.
2. Abre el PLAYBOOK → sigue los 7 pasos para montarlas en el Supabase del cliente.
3. Cada automatización se entrega con su mini-dashboard (estático, GitHub Pages, gated por token CDN) y se factura por el panel CDN.

## Niveles de riesgo

- 🟢 Verde — sin problema legal/técnico.
- 🟡 Cautela — toca datos personales, cold outreach o scraping → aplicar RGPD/LSSI (consentimiento, baja, identificación, evitar particulares en frío). Ver PLAYBOOK § Legal.
