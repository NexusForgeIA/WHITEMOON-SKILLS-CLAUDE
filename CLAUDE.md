# WHITEMOON-SKILLS-CLAUDE

## Propósito
Repositorio de skills, agentes y referencias para Claude Code en todos los proyectos WhiteMoon.

## Skills disponibles (.claude/skills/)
- 20 skills de desarrollo (addyosmani/agent-skills)
- 13 skills de spec-kit (/speckit.*)
- Usar con: /build, /plan, /review, /ship, /spec, /test, /code-simplify

## Comandos slash (.claude/commands/)
/build → construir features completas
/plan → planificar antes de codificar
/review → revisar código antes de mergear
/ship → checklist antes de subir a producción
/spec → definir especificación
/test → generar tests
/code-simplify → simplificar código complejo

## Agentes especializados (.claude/agents/)
- code-reviewer → revisión profunda de código
- security-auditor → auditoría de seguridad
- test-engineer → generación de tests

## Spec-Kit (.specify/)
Flujo obligatorio para proyectos nuevos:
/speckit.specify → /speckit.clarify → /speckit.plan → /speckit.tasks → /speckit.implement

## Reglas
- Nunca directo a main — siempre rama + PR
- Usar /speckit.specify antes de cualquier proyecto nuevo
- Usar /review antes de cualquier merge
- Usar /ship antes de cualquier deploy
