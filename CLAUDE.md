## OBLIGATORIO ANTES DE CUALQUIER DISEÑO WEB

Aplica a TODOS los repos: demos de clientes, webs, whitemoon.es.

Lee estas skills en este orden ANTES de escribir una sola línea de HTML/CSS:

1. ~/.claude/skills/emil-design-eng/SKILL.md        ← PRIMERO SIEMPRE
2. ~/.claude/skills/local-business-rebuild/SKILL.md
3. ~/.claude/skills/frontend-design-pro/SKILL.md
4. ~/.claude/skills/00-design-references/
5. ~/.claude/skills/responsive-design/SKILL.md
6. ~/.claude/skills/review-animations/SKILL.md  ← usar después de implementar motion

> `review-animations` tiene `disable-model-invocation: true` — no se
> auto-invoca. Úsala explícitamente tras implementar cualquier animación:
> "revisa las animaciones con la skill review-animations antes del PR"

### Por qué Emil va primero
Emil Kowalski (animations.dev) — los detalles que el usuario NUNCA nota
conscientemente son los que hacen que algo se SIENTA bien.
"All those unseen details combine to produce something that's just stunning,
like a thousand barely audible voices all singing in tune." — Paul Graham

### Plan obligatorio antes de codificar

Escribe este bloque ANTES de escribir código:

<!-- DESIGN PLAN
  Palette: (4-6 hex exactos con justificación de uso)
  Tipografía:
    - Display: [fuente] — por qué esta y no otra
    - Body: [fuente] — justificación
  Firma visual única:
    - [El elemento que hace que esta web NO parezca IA genérica]
  Motion (Emil):
    - Animaciones: ¿cuáles? ¿por qué? Easing y duración exactos.
    - Sin animaciones decorativas — solo feedback o contexto.
  Autocrítica — NO es ninguno de estos defaults de IA:
    [ ] Fondo crema #F4F1EA + serif display + acento terracota
    [ ] Fondo negro + acento acid-green o vermilion
    [ ] Broadsheet dense con hairline rules
  Si NO pasa: revisar el plan antes de continuar.
-->

### Reglas universales WhiteMoon — diseño web
- Cero emojis en webs de clientes
- Sin border-radius > 4px en webs profesionales
- Sin gradientes de color
- Sin cards genéricas icono+título+descripción
- Sin sombras excesivas
- Layout asimétrico donde sea posible
- Animaciones solo con propósito: feedback o contexto, nunca decoración

---

# CLAUDE.md — WhiteMoon Agencia IA

## EMPRESA
WhiteMoon Agencia IA — Majadahonda, Madrid
Fundador: Cristobal Martinez Comas
Web: whitemoon.es | Email: comercial@whitemoon.es
WhatsApp: 643 199 580 | Personal: 699 72 72 18

## STACK TÉCNICO
- Frontend: HTML/CSS/JS puro (sin frameworks)
- Backend: Supabase (mlaqtniujnvfxcvcourm)
- IA: Claude API (claude-haiku-4-5-20251001)
- CDN: nexusforgeia.github.io/whitemoon-cdn
- Deploy: GitHub Pages
- Org: NexusForgeIA

## CATÁLOGO — modelo de 3 productos (ninguno tiene permanencia)
LA WEB NO PUBLICA TARIFA. Nunca escribir un precio: ni en web, ni en copy,
ni en JSON-LD, ni en JS. El precio se cierra en una llamada.
Fórmula estándar: "Propuesta a medida, sin permanencia."

- **Spark** (/spark/) — agente de IA conversacional en la web que el cliente YA tiene.
- **Core Spark Web** (/core/) — web nueva con el agente dentro + SEO y GEO/AEO
  desde el día 1. Para quien NO tiene web.
- **Agente IA Citas** (/agente-ia-citas/) — agente de reservas para negocios de
  cita previa (peluquería, estética, uñas, barbería, taller, fisio, podología,
  dental…): el cliente reserva solo por QR, con un enlace o desde el agente
  embebido en su web, sin llamadas. Panel de citas (alta manual, mover/cancelar,
  importar) y reseñas por WhatsApp que envía el propio negocio en un clic.
  NO usa la API de WhatsApp Business ni envía nada automático. No garantiza ventas.
- Los tres: propuesta a medida, sin permanencia. Spark y Core Spark Web:
  operativo en 5-7 días laborables. (Agente IA Citas: plazo SIN cifra, aún no
  verificado.)
- Producto suelto: **Auditoría GEO IA** (/auditoria-geo-ia/) — pago único,
  informe en 24h. En web: "Pago único · Sin permanencia", SIN cifra.

## COLORES WHITEMOON
--bg: #08080d
--p: #7c4dff
--p2: #9d70ff
--g: #00d4aa
--text: #f0f0f5
--muted: #8888a0

## REGLAS GIT — ABSOLUTAS
1. NUNCA push directo a main
2. Siempre rama + PR: fix/desc o feat/desc
3. gh pr create + gh pr merge --squash
4. NUNCA decir "abre el PR manualmente"
5. API key Claude NUNCA expuesta en ningún repo

## PRINCIPIOS KARPATHY (obligatorios)
1. Think Before Coding — preguntar antes de asumir
2. Simplicity First — mínimo código que resuelve el problema
3. Surgical Changes — tocar solo lo necesario
4. Goal-Driven Execution — definir criterios de éxito verificables

## REGLA DE DISEÑO — LEER SIEMPRE PRIMERO
Antes de cualquier demo o web visual:
→ Leer skills/design-override/SKILL.md
→ Nivel mínimo: linear.app / vercel.com
→ Nunca plantillas genéricas de Tailwind/shadcn

## SKILLS INSTALADAS
Antes de cualquier tarea leer las skills relevantes.

### .claude/skills/ (39 skills cargables)
> `notebooklm/` existe en la carpeta pero NO se lista: su SKILL.md no tiene
> frontmatter (es un README), así que Claude Code no la carga. Usa `notebooklm-slides`.
- agent-browser
- api-and-interface-design
- browser-testing-with-devtools
- ci-cd-and-automation
- code-review-and-quality
- code-simplification
- context-engineering
- debugging-and-error-recovery
- deprecation-and-migration
- documentation-and-adrs
- frontend-ui-engineering
- git-workflow-and-versioning
- idea-refine
- impeccable
- incremental-implementation
- notebooklm-slides
- performance-optimization
- planning-and-task-breakdown
- security-and-hardening
- shipping-and-launch
- source-driven-development
- spec-driven-development
- speckit-analyze
- speckit-checklist
- speckit-clarify
- speckit-constitution
- speckit-git-commit
- speckit-git-feature
- speckit-git-initialize
- speckit-git-remote
- speckit-git-validate
- speckit-implement
- speckit-plan
- speckit-specify
- speckit-tasks
- speckit-taskstoissues
- test-driven-development
- ui-ux-pro-max
- web-design-systems

### skills/ (skills WhiteMoon)
- chatbot
- deploy-cache → caché real en producción (GitHub Pages + Cloudflare): todo con `max-age=14400` (4 h). Leer antes de asumir que "el cambio no llega por caché" o que hay que bumpear el `?v=`.
- git-flow
- seo-geo-aeo
- supabase
- ui-design

### skills/ — set SEO (17 skills de Vicky Lalwani)
Set completo instalado desde `skills-seo`. README del set en
`skills/skills-seo/README.md` (no es una skill: solo documentación).

**On-page y contenido**
- meta-optimizer → reescribe title tags y meta descriptions para ganar CTR (3 opciones rankeadas por página).
- content-gap → compara la página con el top 10 y lista lo que le falta para competir.
- internal-linker → detecta páginas huérfanas y propone enlaces internos con su anchor text.
- schema-generator → genera JSON-LD válido y pegable para cualquier tipo de página.
- cannibalization-finder → encuentra páginas del mismo sitio peleando por la misma keyword y recomienda la acción.
- ctr-booster → localiza páginas con muchas impresiones y poco clic, y las arregla. **Requiere GSC.**

**Google Search Console** — requieren el conector de Search Console (aún no disponible)
- gsc-auditor → lee datos vivos de GSC y saca quick wins priorizados por esfuerzo/impacto.
- gsc-errors → agrupa los errores de indexación y cobertura y da el fix concreto de cada uno.

**Semrush** — requieren Semrush conectado (aún no disponible)
- semrush-auditor → resume el Site Audit de Semrush por severidad, no una lista cruda de flags.
- semrush-errors → convierte los errores marcados por Semrush en fixes ejecutables rankeados por impacto.

**SEO técnico**
- technical-auditor → crawlea las páginas clave y agrupa los problemas técnicos por tipo.
- technical-errors → convierte los hallazgos técnicos en fixes con código, separando marketer de dev.
- robots-checker → revisa robots.txt y meta robots buscando bloqueos que cuestan tráfico.
- sitemap-validator → valida el sitemap XML (URLs rotas, redirects, no-canónicas, noindex, formato).

**Keywords y enlaces**
- keyword-clusterer → agrupa keywords en clusters por intención y mapea cada uno a una página.
- backlink-analyzer → puntúa el perfil de enlaces, marca tóxicos y sigue altas/bajas.
- github-seo-optimizer → optimiza repos de GitHub (README, descripción, topics) para que se encuentren.

> **Conectores.** `semrush-auditor` y `semrush-errors` necesitan Semrush
> conectado; `gsc-auditor` y `gsc-errors` el conector de Google Search
> Console. Ninguno de los dos está disponible todavía — hasta entonces estas
> cuatro skills solo sirven con datos pegados a mano. El resto funciona sin
> conector (`ctr-booster` da su máximo con datos de GSC, pero acepta un
> export manual).

### Bases de conocimiento
- workflows-venta-whitemoon/ → catálogo de automatizaciones vendibles + playbook de construcción (n8n como receta; se construye nativo en el Supabase del cliente, nunca n8n en producción).

---

## PROTOCOLO DISEÑO WEB — OBLIGATORIO
Cuando crees o diseñes cualquier web nueva para un cliente
(dental, gestoría, taller, estética, inmobiliaria, etc.)
ANTES de escribir HTML/CSS:

1. Leer .claude/skills/ui-ux-pro-max/SKILL.md
   → paletas, tipografía, layouts, componentes premium
   → usar search.py para buscar estilos del sector:
     python3 .claude/skills/ui-ux-pro-max/scripts/search.py "[sector] dark premium"

2. Leer .claude/skills/impeccable/SKILL.md
   → craft, shape, audit, polish, animate
   → referencias en .claude/skills/impeccable/reference/

3. Leer .claude/skills/frontend-ui-engineering/SKILL.md
   → UI de producción accesible y sin estética genérica AI

4. Leer .claude/skills/web-design-systems/SKILL.md
   → sistemas de diseño coherentes y escalables

REGLAS ANTI-GENÉRICO (nunca violar):
- NUNCA layouts completamente centrados y simétricos
- NUNCA cards icono+título+descripción idénticas
- NUNCA gradientes azul-morado genéricos
- NUNCA tipografía system-ui sin carácter
- SIEMPRE asimetría intencional en layouts
- SIEMPRE tipografía con peso y contraste real
- SIEMPRE espaciado generoso y deliberado
- SIEMPRE jerarquía visual clara
- SIEMPRE movimiento sutil con propósito

El design system del cliente tiene prioridad.
Las skills lo complementan y elevan.
