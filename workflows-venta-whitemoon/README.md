# workflows-venta-whitemoon

Base de conocimiento para **vender y construir automatizaciones** como servicio (planes BASIC / PRO / ENTERPRISE ESENCIAL de whitemoon.es/automatizaciones).

Regla de oro: las plantillas de n8n que circulan por internet son solo **recetas**. Nosotros NO usamos n8n. Cada automatización vendida se construye **nativa en el Supabase del cliente** (`wm-[cliente]`), con Edge Functions + Claude API + Resend/Telegram. Always-on, sin cuotas por ejecución, aislado por cliente, tuyo.

## Archivos

- **CATALOGO-automatizaciones.md** — QUÉ vender: repertorio de automatizaciones por categoría, con sector, plan y cómo se construye. Argumentario de venta.
- **PROCESO-IMPLANTACION-CLIENTE.md** — CÓMO venderlo e implantarlo: escenarios A/B/C, cuestionario de descubrimiento, fases con tiempos, plantilla de alcance, guía de precio, checklist legal y red flags.
- **PLAYBOOK-construccion.md** — CÓMO construirlo: mapeo n8n→Supabase, los 7 pasos de montaje, convenciones y checklist técnico.

## Cómo se usa (en este orden)

1. **Descubrimiento** → PROCESO-IMPLANTACION §0-1: determina el escenario (A/B/C), el dolor y el volumen. Sin esto no hay ni precio ni plazo.
2. **Propuesta** → CATÁLOGO: elige las automatizaciones por plan/sector. Rellena el alcance de 1 página (PROCESO §6) y acuérdalo por escrito.
3. **Construcción** → PLAYBOOK: los 7 pasos, en el Supabase del cliente (`wm-[cliente]`).
4. **Entrega** → dashboard estático gated por token CDN + formación + alta en CDN (setup + cuota).

Regla: **nunca se toca código sin alcance aceptado**, y nunca se vende una integración sin haber verificado que la API existe.

## Niveles de riesgo

- 🟢 Verde — sin problema legal/técnico.
- 🟡 Cautela — toca datos personales, cold outreach o scraping → aplicar RGPD/LSSI (consentimiento, baja, identificación, evitar particulares en frío). Ver PLAYBOOK § Legal.
