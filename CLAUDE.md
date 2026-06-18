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

## PRECIOS (sin permanencia en todos)
- Auditoría IA: 899€ único
- Spark: 499€ + 199€/mes
- Core: 1.800€ + 199€/mes
- Scale: 4.500€ + 449€/mes
- Elite: 8.500€ + 799€/mes
- Gestoría IA: 599€ + 299€/mes

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

## SKILLS INSTALADAS
Antes de cualquier tarea leer las skills relevantes en `.claude/skills/`.

> NOTA DE CARGA: este listado es un índice. Claude Code auto-descubre las skills
> de `.claude/skills/*/SKILL.md` solo al trabajar DENTRO de este repo. Para que
> carguen en CUALQUIER sesión (otros repos) deben copiarse a `~/.claude/skills/`
> (global) o instalarse como plugin.

### Ingeniería (`.claude/skills/`) — 23
- api-and-interface-design — diseño de APIs/interfaces estables (REST, GraphQL, contratos)
- browser-testing-with-devtools — testing en navegador real vía Chrome DevTools MCP
- ci-cd-and-automation — pipelines CI/CD, quality gates y despliegue
- code-review-and-quality — revisión de código multi-eje antes de merge
- code-simplification — refactor para claridad sin cambiar comportamiento
- context-engineering — optimizar contexto y reglas del agente por proyecto
- debugging-and-error-recovery — debugging sistemático de causa raíz
- deprecation-and-migration — deprecación y migración de sistemas/APIs
- documentation-and-adrs — registrar decisiones (ADRs) y documentación
- frontend-ui-engineering — UI de producción accesible y sin estética AI
- git-workflow-and-versioning — prácticas de git, ramas y conflictos
- idea-refine — refinar ideas (pensamiento divergente/convergente)
- incremental-implementation — entregar cambios de forma incremental
- performance-optimization — rendimiento y Core Web Vitals
- planning-and-task-breakdown — desglosar el trabajo en tareas ordenadas
- security-and-hardening — endurecer el código frente a vulnerabilidades
- shipping-and-launch — checklist de lanzamiento a producción y rollback
- source-driven-development — decisiones basadas en documentación oficial
- spec-driven-development — crear specs antes de codificar
- test-driven-development — desarrollo guiado por tests
- notebooklm-slides — prompts de diseño para slides NotebookLM/Kael.im
- agent-browser — automatización de navegador para agentes (CLI)
- notebooklm — ⚠ README sin frontmatter: Claude Code NO la carga como skill (pendiente de arreglar)

### WhiteMoon (`./skills/` y `./.agents/skills/`)
- chatbot — stack de agentes IA y edge functions
- supabase — integración Supabase WhiteMoon
- seo-geo-aeo — SEO, GEO y AEO para WhiteMoon
- ui-design — diseño premium WhiteMoon
- git-flow — flujo de ramas y PRs
- taste / high-end-visual-design / minimalist-ui / design-taste-frontend — diseño premium frontend

### Negocio y meta (raíz `./`)
- deal-sourcing — prospección de empresas y outreach a founders
- competitive-analysis — decks de análisis competitivo
- ai-readiness — evaluación de madurez IA de clientes
- client-review — revisión periódica de cliente
- skill-creator — crear y actualizar skills
- vercel-sandbox — automatización Chrome en Vercel microVMs
