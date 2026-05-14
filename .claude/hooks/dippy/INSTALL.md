# Dippy — Setup en WhiteMoon

Dippy auto-aprueba comandos bash seguros y bloquea destructivos.

## Opción A — Brew (recomendado)

```bash
brew tap ldayton/dippy
brew install dippy
```

Luego en `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      { "matcher": "Bash",
        "hooks": [{ "type": "command", "command": "dippy" }] }
    ]
  }
}
```

## Opción B — Vendor local (este repo)

Apunta el hook al binario incluido en el repo:

```json
{
  "hooks": {
    "PreToolUse": [
      { "matcher": "Bash",
        "hooks": [{ "type": "command",
                    "command": "python3 .claude/hooks/dippy/bin/dippy-hook" }] }
    ]
  }
}
```

Requiere Python 3.8+.

## Configuración

- Global: `~/.dippy/config`
- Proyecto: `.dippy` en la raíz (ya creado con reglas WhiteMoon)

Las reglas del proyecto se combinan con las globales. Edita `.dippy`
en la raíz del repo para añadir `allow`/`deny`/`deny-redirect`.

Documentación completa: <https://github.com/ldayton/Dippy/wiki>
