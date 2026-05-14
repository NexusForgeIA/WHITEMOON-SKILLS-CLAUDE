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
