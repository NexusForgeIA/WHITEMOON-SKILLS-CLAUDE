# WHITEMOON-SKILLS-CLAUDE

## Propósito
Repositorio de skills, agentes, hooks y referencias para Claude Code en todos los proyectos WhiteMoon.

## Skills disponibles (.claude/skills/)

### Generales (33)
- 20 skills de desarrollo (addyosmani/agent-skills): build, plan, review, ship, spec, test, code-simplify, debugging, security, performance, etc.
- 13 skills de spec-kit (`/speckit.*`)

### Científicas (137) — `.claude/skills/scientific/`
Skills avanzadas de K-Dense-AI/claude-scientific-skills:
- **Bio/Omics**: scanpy, biopython, anndata, lamindb, scvi-tools, pydeseq2, …
- **Química/Materiales**: rdkit, datamol, deepchem, pymatgen, molfeat
- **ML/Estadística**: pytorch-lightning, scikit-learn, statsmodels, pymc, shap
- **Datos**: polars, dask, vaex, zarr-python, geopandas
- **Visualización**: matplotlib, seaborn, scientific-visualization, infographics
- **Documentos científicos**: scientific-writing, latex-posters, pptx-posters
- **Búsqueda académica**: paper-lookup, literature-review, pyzotero, exa-search
- **Lab integrations**: benchling, latchbio, opentrons, protocolsio, omero
- **Cuántica/Física**: qiskit, cirq, pennylane, qutip, fluidsim

Listado completo: `ls .claude/skills/scientific/`

## Comandos slash (.claude/commands/)

### WhiteMoon (workflows principales)
- `/build` → construir features completas
- `/plan` → planificar antes de codificar
- `/review` → revisar código antes de mergear
- `/ship` → checklist antes de subir a producción
- `/spec` → definir especificación
- `/test` → generar tests
- `/code-simplify` → simplificar código complejo

### Git & Version Control (awesome-claude-code)
- `/commit` → commit estructurado con mensaje generado
- `/create-pull-request` → crear PR siguiendo convenciones
- `/pr-review` → revisión exhaustiva de PR
- `/update-branch-name` → renombrar rama según convenciones
- `/release` → preparar release

### Code Analysis & Testing
- `/optimize` → optimizar código
- `/testing_plan_integration` → plan de testing de integración
- `/fix-github-issue` → resolver issue de GitHub
- `/clean` → limpieza de código (black, isort, flake8, mypy)
- `/husky` → setup hooks pre-commit

### Documentation & Changelog
- `/add-to-changelog` → añadir entrada al CHANGELOG
- `/update-docs` → actualizar documentación
- `/context-prime` → cargar contexto del repo
- `/todo` → gestionar TODOs

## Agentes especializados (.claude/agents/)
- `code-reviewer` → revisión profunda de código
- `security-auditor` → auditoría de seguridad
- `test-engineer` → generación de tests

## Hooks (.claude/hooks/)

### claude-mem — memoria persistente entre sesiones
- Captura observaciones automáticamente en cada tool call
- Las comprime semánticamente y las inyecta en sesiones futuras
- Web viewer: <http://localhost:37777>
- Setup: ver `.claude/hooks/claude-mem/INSTALL.md`

Instalación (una sola vez por dev):
```bash
npx claude-mem install
```
Registra plugin a nivel de usuario (`~/.claude/plugins/`), activa hooks
SessionStart/UserPromptSubmit/PostToolUse/PreToolUse/Stop, y persiste
contexto en `~/.claude-mem/`. Reinicia Claude Code tras instalar.

Comandos: `npx claude-mem status|start|stop|search "..."|update`

Privacidad: envolver contenido sensible con `<private>...</private>`.

### Dippy — auto-aprobación de bash seguros
- Auto-aprueba `ls`, `git status`, pipelines de lectura, etc.
- Bloquea destructivos (`rm -rf`, `git push --force`, `terraform destroy`, …)
- Reglas del proyecto en `.dippy` (raíz del repo)
- Setup: ver `.claude/hooks/dippy/INSTALL.md`

Instalación rápida (Brew):
```bash
brew tap ldayton/dippy && brew install dippy
```
Y en `~/.claude/settings.json`:
```json
{ "hooks": { "PreToolUse": [
  { "matcher": "Bash",
    "hooks": [{ "type": "command", "command": "dippy" }] } ] } }
```

Alternativa vendored: `python3 .claude/hooks/dippy/bin/dippy-hook`

## Agent Browser (Vercel Labs)
Browser automation para agentes IA.
Permite a Claude Code controlar un navegador real.

### Casos de uso WhiteMoon:
- Auditar webs de prospectos automáticamente
- Verificar chatbots instalados en producción
- Capturar screenshots de demos
- Prospección automática para Scout CRM

### Comandos:
- Navegar a una URL y extraer información
- Hacer clicks y rellenar formularios
- Tomar screenshots
- Extraer datos estructurados de webs

### Instalación
```bash
npm install -g agent-browser
agent-browser install            # descarga Chrome for Testing (primera vez)
# Linux: agent-browser install --with-deps
```

Skill registrada en `.claude/skills/agent-browser/` (Claude la usa
automáticamente cuando la tarea implica navegador). Plugin manifest
vendorizado en `.claude/plugins/agent-browser/`.

### Flujo recomendado (snapshot + refs)
```bash
agent-browser open https://prospecto.com
agent-browser snapshot -i --json     # accessibility tree con @e1, @e2, …
agent-browser click @e2              # interactúa por ref
agent-browser screenshot demo.png
agent-browser close
```

### Comandos útiles
- `agent-browser snapshot -i` — árbol accesible con refs (@eN)
- `agent-browser find role button click --name "Submit"` — locator semántico
- `agent-browser screenshot --annotate` — captura con etiquetas numeradas
- `agent-browser chat "<instrucción>"` — control por lenguaje natural
- `agent-browser get text @e1` / `get url` / `get title`
- `agent-browser network har start|stop` — grabación HAR
- `agent-browser diff url <a> <b>` — diff visual/snapshot entre dos URLs

### Skills especializadas
```bash
agent-browser skills get core           # workflows + troubleshooting
agent-browser skills get dogfood        # QA / exploratory testing
agent-browser skills get electron       # apps de escritorio (Slack, VS Code, …)
agent-browser skills get slack          # automatización de Slack
agent-browser skills get vercel-sandbox # ejecución en Vercel Sandbox
agent-browser skills get agentcore      # AWS Bedrock AgentCore
```

### Privacidad / seguridad
- `--allowed-domains "example.com,*.example.com"` — allowlist
- `--content-boundaries` — delimita output de páginas para el LLM
- `--max-output 50000` — evita saturar contexto
- Cookies/state files en plaintext — añadir a `.gitignore`

## Spec-Kit (.specify/)
Flujo obligatorio para proyectos nuevos:
`/speckit.specify` → `/speckit.clarify` → `/speckit.plan` → `/speckit.tasks` → `/speckit.implement`

## Reglas
- **Nunca directo a main** — siempre rama + PR (Dippy lo bloquea)
- Usar `/speckit.specify` antes de cualquier proyecto nuevo
- Usar `/review` antes de cualquier merge
- Usar `/ship` antes de cualquier deploy
- Nunca escribir secretos a `.env*` (Dippy lo bloquea)
- Force-push prohibido (Dippy lo bloquea)

## Fuentes
- Skills generales: <https://github.com/addyosmani/agent-skills>
- Skills científicas: <https://github.com/K-Dense-AI/claude-scientific-skills>
- Slash-commands extra: <https://github.com/hesreallyhim/awesome-claude-code>
- Dippy hook: <https://github.com/ldayton/Dippy>
- claude-mem: <https://github.com/thedotmack/claude-mem>
- agent-browser: <https://github.com/vercel-labs/agent-browser>
