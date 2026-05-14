# claude-mem — Setup en WhiteMoon

[claude-mem](https://github.com/thedotmack/claude-mem) es un sistema de
memoria persistente que captura observaciones de cada sesión de Claude
Code, las comprime semánticamente y las inyecta automáticamente en
futuras sesiones del mismo proyecto.

> **Importante**: claude-mem se instala como **plugin de Claude Code a
> nivel de usuario** (`~/.claude/plugins/`), no como hook embebido en el
> repo. Esta carpeta contiene únicamente documentación + referencias.

## Instalación (una sola vez por desarrollador)

```bash
npx claude-mem install
```

Esto hace tres cosas:

1. Registra el marketplace `thedotmack` en `~/.claude/plugins/known_marketplaces.json`
2. Descarga el plugin `claude-mem@thedotmack` a `~/.claude/plugins/cache/thedotmack/claude-mem/<version>/`
3. Lo activa en `~/.claude/settings.json` bajo `enabledPlugins`

Alternativa desde Claude Code:

```text
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem
```

Reinicia Claude Code después. Los hooks se cargan automáticamente.

## Hooks que registra (referencia)

`hooks.json.reference` es una copia de los hooks que claude-mem
registra al instalarse. **No edites este archivo en el repo** — el
plugin gestiona su propia versión en `~/.claude/plugins/cache/...`.

Los hooks activos son:

| Hook | Cuándo | Qué hace |
|---|---|---|
| `Setup` | al arrancar Claude Code | comprueba versión del plugin |
| `SessionStart` | nueva sesión / `/clear` / `/compact` | arranca worker e inyecta contexto previo |
| `UserPromptSubmit` | cada prompt del usuario | inicializa sesión en el worker |
| `PreToolUse(Read)` | antes de leer un archivo | añade contexto sobre ese archivo |
| `PostToolUse(*)` | después de cada tool call | guarda observación |
| `Stop` | fin de sesión | genera resumen semántico |

## Comandos útiles

```bash
npx claude-mem status        # estado del worker
npx claude-mem start         # arranca worker manualmente
npx claude-mem stop          # detiene worker
npx claude-mem search "..."  # busca observaciones por texto
npx claude-mem update        # actualiza a la última versión
npx claude-mem uninstall     # desinstala
```

## Web Viewer

Con el worker activo: <http://localhost:37777>

## Configuración

`~/.claude-mem/settings.json` (auto-creado en el primer arranque).

Opciones útiles:

```json
{
  "CLAUDE_MEM_RUNTIME": "worker",
  "CLAUDE_MEM_MODE": "code"
}
```

Modos disponibles: `code` (default EN), `code--zh`, `code--ja`, …
Patrón general: `code--<ISO 639-1>`. Para español puedes probar
`code--es` (puede requerir activación manual del modo en
`~/.claude/plugins/.../plugin/modes/`).

## Privacidad

Envuelve contenido sensible con `<private>...</private>` en tus
prompts: claude-mem no lo persiste.

## Requisitos

- Node.js ≥ 18
- Bun (auto-instalado por el hook si falta)
- uv (auto-instalado si falta; para búsqueda vectorial)
- SQLite 3 (bundled)

Documentación oficial: <https://docs.claude-mem.ai/>
