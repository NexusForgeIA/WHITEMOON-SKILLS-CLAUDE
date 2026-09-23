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
- Los tres: propuesta a medida, sin permanencia, operativo en 5-7 días laborables.
- Producto suelto: **Auditoría GEO IA** (/auditoria-geo-ia/) — pago único,
  informe en 24h. En web: "Pago único · Sin permanencia", SIN cifra.

Ojo: /precios/ YA NO es fuente de verdad — hoy es un stub meta-refresh a /.
No hay página de tarifa que consultar, así que el precio simplemente no se escribe.

### PRODUCTOS RETIRADOS — no mencionar como producto en venta
Orion / agente de voz · WhiteMoon 360 · Core RAG · Mini Core · Core Orion ·
Orion IA Agent · Pack Ads · Calculadora ITP Pro · Scale · Elite · Orbit ·
Gestoría IA · Orion IA Calls.

/scale/, /elite/, /pack-ads/, /precios/, /servicios/, /recursos/, /mini-core/,
/core-rag/, /core-orion/, /whitemoon-360/, /automatizaciones/ → /
/orion-calls/ → /orion-agent/

El SEO Guardian (check 9) solo falla con "Scale", "Elite", "Orion IA Calls",
"Orbit", "Gestoría IA" y "Pack Ads". El resto hay que cazarlo a mano.
WhiteMoon no gestiona publicidad (Meta Ads) ni como pack ni como servicio.

/calculadora-itp/ y /calculadora-itp-vivienda/ son herramientas gratuitas y
SIGUEN VIVAS. Lo retirado es el SaaS "Calculadora ITP Pro". No confundir.

> NOTA TÉCNICA — `onboarding_clientes.pack` (Supabase): las claves de pack de
> los productos retirados siguen vivas para los clientes ya instalados. Son
> histórico operativo, NO catálogo de venta: no se borran, no se renombran y no
> se usan para generar copy comercial ni para inferir qué se vende hoy.

### PRECIOS PROHIBIDOS — no reintroducir
Tarifa vieja. Ninguna cifra de precio de producto es válida ya.

A · LAS 6 QUE EL GUARDIAN SÍ BLOQUEA
  999€ · 1.800€ · 2.899€ · 3.200€ · 4.500€ · 8.500€
  Lista BAD_PRICES literal de seo_guardian.py. Checks 8 y 13 sobre texto
  visible de todas las páginas. Bloquean el PR. No hay que hacer nada más.

B · LISTA MANUAL — EL GUARDIAN NO LAS VIGILA
  Nadie las para. Grepear a mano en cada PR que toque copy, JSON-LD o JS.
  - Tarifas antiguas (setup): 499€ · 599€ · 799€ · 899€ · 1.499€ · 1.899€ · 2.499€
  - Tarifas antiguas (cuota): 99€/mes · 199€/mes · 299€/mes · 349€/mes · 449€/mes
  - Productos retirados:      3.500€ · 6.500€ · 299€ · 149€

  Grep de referencia:
    grep -rnE "(499|599|799|899|1\.?499|1\.?899|2\.?499|3\.?500|6\.?500|299|149) ?€|(99|199|299|349|449) ?€ ?/ ?mes" --include=*.html --include=*.js . | grep -v "Claude outputs"

  VERIFICAR SIEMPRE CON CONTEXTO antes de tocar nada. El patrón que confirma
  que es tarifa de producto y no otra cosa es `\d+€\s*\+\s*\d+€/mes`
  (setup + cuota juntos). Los números sueltos dan muchísimos falsos positivos.

No se amplía BAD_PRICES con números sueltos: "99", "149", "199", "299" y "499"
son subcadenas de cifras legítimas por todo el sitio (el 199 del teléfono, los
1499/1999 cc del BOE, el z-index:499) y reventaría de falsos positivos. Si se
amplía, con el patrón de contexto, nunca con el número suelto.

FALSOS POSITIVOS conocidos — NO son precios:
- 34643199580 / "643 199 580" — el teléfono de WhatsApp contiene "199".
- z-index:499 en /electricistas-madrid/.
- /calculadora-itp/: [[999,45],[1499,60],[1999,90]] son centímetros cúbicos (BOE).
- /calculadora-impuesto-matriculacion/: co2 <= 199 g/km; Ley 38/1992.
- /calculadora-prestacion-paro/: diasCotizados < 1800; tipos legales 70%/60%/IPREM.
- Cuota RETA, IVA 10%, SS 6,35%, IBI 1% y demás constantes fiscales.
- 33.500 € en /calculadora-ingresos-reales-autonomo/ contiene "3.500" como
  subcadena. Igual con cualquier importe acabado en una cifra vigilada.
- Los importes de ejemplo de las calculadoras: son supuestos del usuario.

DONDE NO MIRA NADIE: los stubs de redirección están en IGNORED_DIRS, así que el
Guardian NO revisa su <meta name="description"> — y esa descripción sí la sirve
Google. Al retirar un producto, limpiar también el meta del stub.

## NADA CABLEADO EN JAVASCRIPT
Ningún precio ni claim de rendimiento cableado en JS de cara al cliente ni en
assets/webmcp.js.

seo_guardian.py hace soup(['script','style']).extract() antes de escanear: EL
GUARDIAN NO MIRA DENTRO DE <script> NI DE LOS .js. Verificar con grep a mano en
cada PR que toque JS:

    grep -rnE "[0-9][0-9.]*\s?€|€\s?/\s?mes|puesta en marcha" --include=*.js --include=*.html .
    grep -rnE "\*\s?0\.[0-9]+|[Rr]educci[óo]n [0-9]+%|se amortiza" --include=*.js --include=*.html .

- Si una constante mueve el resultado que ve el usuario, la pone el usuario en
  un input y se declara a la vista. Nada de EFICACIA = .65 escondido.
- assets/webmcp.js es lo que leen los asistentes de IA: un precio ahí lo repiten
  meses aunque cambie la tarifa. Respuesta fija: "Propuesta a medida, sin
  permanencia. La cerramos en una llamada." Hoy no tiene ni un símbolo €.

MEJORA FUTURA: extender seo_guardian.py con un check que grepee precios en .js
y en los <script> no-JSON-LD.

## CLAIMS — qué se puede decir
- NADA de "#1 en ChatGPT" ni "los primeros en Grok": los asistentes no tienen
  ranking posicional y la metodología no lo soporta.
- SÍ vale: "recomendados por ChatGPT y Grok (citas verificadas, no posición #1)".
  Hay capturas desde septiembre de 2026 — citar la frase con su fecha, sin
  adjuntar la imagen (enseña precios y "voz", ambos retirados).
- Sin testimonios ficticios y sin cifras de rendimiento inventadas: nada de
  "+X% de conversión", "recuperan la inversión en X días" ni "media de nuestros
  clientes" sin una fuente que se pueda enseñar. Si el dato no existe, el número
  lo pone el usuario en un input, etiquetado como supuesto suyo.

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

## SKILLS GLOBALES
Ruta base: C:\Users\krisv\OneDrive\Documentos\GitHub\WHITEMOON-SKILLS-CLAUDE

Antes de cualquier tarea de diseño web leer:
- .claude/skills/ui-ux-pro-max/SKILL.md
- .claude/skills/impeccable/SKILL.md
- .claude/skills/frontend-ui-engineering/SKILL.md
- .claude/skills/web-design-systems/SKILL.md

Antes de cualquier tarea de código leer:
- .claude/skills/debugging-and-error-recovery/SKILL.md
- .claude/skills/performance-optimization/SKILL.md
- .claude/skills/security-and-hardening/SKILL.md

Skills WhiteMoon (siempre disponibles):
- skills/seo-geo-aeo/SKILL.md
- skills/chatbot/SKILL.md
- skills/supabase/SKILL.md
- skills/ui-design/SKILL.md
- skills/git-flow/SKILL.md

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
