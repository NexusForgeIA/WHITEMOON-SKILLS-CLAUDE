#!/usr/bin/env bash
#
# sync-skills.sh — Reinstala las skills globales de Claude Code (~/.claude/skills)
# desde el repositorio WHITEMOON-SKILLS-CLAUDE con un solo comando.
#
# Para cada skill ya presente en el global, busca su carpeta de origen en el repo
# y la reinstala (copia limpia) si ha cambiado. Al terminar lista qué actualizó.
#
# Resolución de origen por nombre, en orden de prioridad:
#   1) skills/                    (skills WhiteMoon — versión canónica)
#   2) .agents/skills/            (pack de diseño / agents)
#   3) .claude/skills/            (skills de ingeniería)
#   4) .claude/skills/scientific/ (pack científico — solo para resolver las que
#                                  YA estén instaladas, p. ej. generate-image)
#
# Las skills del global que NO existan en el repo (p. ej. workctl) se dejan
# intactas. NO instala skills nuevas del repo automáticamente para no arrastrar
# el pack científico; usa --show-available para ver las disponibles sin instalar.
#
# Uso:
#   bash ~/.claude/sync-skills.sh [--pull] [--show-available] [--install NOMBRE ...]
#     --pull            git pull --ff-only del repo antes de reinstalar
#     --show-available  lista skills del repo (no científicas) que no están en global
#     --install NOMBRE  instala (registra) una skill del repo en el global por nombre;
#                       repetible. Resuelve el origen igual que la sincronización.
#
# Variables de entorno:
#   WM_SKILLS_REPO   ruta al repo  (por defecto la de OneDrive/GitHub)
#   CLAUDE_HOME      carpeta .claude (por defecto /c/Users/krisv/.claude)

set -uo pipefail

REPO="${WM_SKILLS_REPO:-/c/Users/krisv/OneDrive/Documentos/GitHub/WHITEMOON-SKILLS-CLAUDE}"
CLAUDE_DIR="${CLAUDE_HOME:-/c/Users/krisv/.claude}"
GLOBAL="$CLAUDE_DIR/skills"
# Orden = prioridad de resolución. scientific va el último (baja prioridad) para
# que las scientific YA instaladas (generate-image, infographics, …) se sincronicen
# sin que su pack colisione con skills de nombre igual en roots superiores.
ROOTS=("skills" ".agents/skills" ".claude/skills" ".claude/skills/scientific")
# Root que --show-available NO lista (evita volcar las ~137 skills científicas).
AVAIL_SKIP=".claude/skills/scientific"

DO_PULL=0; SHOW_AVAIL=0; INSTALL=()
while [ $# -gt 0 ]; do
  case "$1" in
    --pull) DO_PULL=1 ;;
    --show-available) SHOW_AVAIL=1 ;;
    --install)
      shift
      [ $# -gt 0 ] || { echo "--install requiere un NOMBRE de skill" >&2; exit 2; }
      INSTALL+=("$1") ;;
    -h|--help) sed -n '2,30p' "$0"; exit 0 ;;
    *) echo "Argumento desconocido: $1" >&2; exit 2 ;;
  esac
  shift
done

# --- Comprobaciones ---
if [ ! -d "$REPO" ]; then
  echo "✗ No encuentro el repo en: $REPO" >&2
  echo "  Ajusta con: WM_SKILLS_REPO=/ruta/al/repo bash ~/.claude/sync-skills.sh" >&2
  exit 1
fi
mkdir -p "$GLOBAL"

if [ "$DO_PULL" = "1" ]; then
  echo "↻ git pull --ff-only en $REPO"
  git -C "$REPO" pull --ff-only || { echo "✗ git pull falló" >&2; exit 1; }
  echo ""
fi

# Imprime la ruta relativa del origen de una skill, o devuelve 1 si no está.
find_src() {
  local name="$1" root
  for root in "${ROOTS[@]}"; do
    [ -f "$REPO/$root/$name/SKILL.md" ] && { printf '%s/%s' "$root" "$name"; return 0; }
  done
  return 1
}

# 0 si el SKILL.md tiene frontmatter YAML con name + description.
has_frontmatter() {
  [ -f "$1" ] || return 1
  local c
  c=$(awk 'BEGIN{n=0}/^---[[:space:]]*$/{n++;if(n==2)exit;next}n==1{print}' "$1" \
      | grep -ciE '^(name|description):')
  [ "$c" -ge 2 ]
}

updated=(); unchanged=(); skipped=(); warn_fm=()

# --- Instalación explícita por --install (registra skills nuevas del repo) ---
# Se ejecuta ANTES del barrido para que las recién instaladas existan en global;
# el barrido las omite (ya reportadas aquí) vía la comprobación de pertenencia.
installed=(); install_fail=()
for iname in "${INSTALL[@]+"${INSTALL[@]}"}"; do
  if rel="$(find_src "$iname")"; then
    rm -rf "$GLOBAL/$iname"
    cp -r "$REPO/$rel" "$GLOBAL/$iname"
    has_frontmatter "$GLOBAL/$iname/SKILL.md" || warn_fm+=("$iname")
    installed+=("$iname|$rel")
  else
    install_fail+=("$iname")
  fi
done

shopt -s nullglob
for destdir in "$GLOBAL"/*/; do
  name="$(basename "$destdir")"
  # Omite las que se acaban de instalar con --install (ya reportadas aparte).
  if [ "${#INSTALL[@]}" -gt 0 ]; then
    skip=0
    for iname in "${INSTALL[@]}"; do [ "$iname" = "$name" ] && { skip=1; break; }; done
    [ "$skip" = 1 ] && continue
  fi
  if rel="$(find_src "$name")"; then
    src="$REPO/$rel"
    if diff -rq "$src" "$destdir" >/dev/null 2>&1; then
      unchanged+=("$name")
    else
      rm -rf "$destdir"
      cp -r "$src" "$GLOBAL/$name"
      updated+=("$name|$rel")
    fi
    has_frontmatter "$GLOBAL/$name/SKILL.md" || warn_fm+=("$name")
  else
    skipped+=("$name")
  fi
done
shopt -u nullglob

# --- Informe ---
echo "════════════════════════════════════════════════"
echo "  sync-skills · destino: $GLOBAL"
echo "  origen:  $REPO"
echo "════════════════════════════════════════════════"

if [ "${#updated[@]}" -gt 0 ]; then
  echo ""
  echo "✓ ACTUALIZADAS (${#updated[@]}):"
  for u in "${updated[@]}"; do printf "   • %-28s ←  %s\n" "${u%%|*}" "${u#*|}"; done
fi
if [ "${#unchanged[@]}" -gt 0 ]; then
  echo ""
  echo "· sin cambios (${#unchanged[@]}): ${unchanged[*]}"
fi
if [ "${#skipped[@]}" -gt 0 ]; then
  echo ""
  echo "↪ externas, no tocadas (${#skipped[@]}; no están en el repo): ${skipped[*]}"
fi
if [ "${#warn_fm[@]}" -gt 0 ]; then
  echo ""
  echo "⚠ sin frontmatter YAML (cargan por encabezado H1, p. ej. WhiteMoon): ${warn_fm[*]}"
fi
if [ "${#installed[@]}" -gt 0 ]; then
  echo ""
  echo "✓ INSTALADAS / REGISTRADAS (${#installed[@]}):"
  for i in "${installed[@]}"; do printf "   • %-28s ←  %s\n" "${i%%|*}" "${i#*|}"; done
fi
if [ "${#install_fail[@]}" -gt 0 ]; then
  echo ""
  echo "✗ NO encontradas en el repo (${#install_fail[@]}): ${install_fail[*]}"
  echo "  Revisa el nombre con: bash ~/.claude/sync-skills.sh --show-available"
fi

if [ "$SHOW_AVAIL" = "1" ]; then
  echo ""
  echo "── disponibles en el repo y NO instaladas (informativo; excluye scientific/) ──"
  for root in "${ROOTS[@]}"; do
    [ "$root" = "$AVAIL_SKIP" ] && continue   # no volcar el pack científico
    for d in "$REPO/$root"/*/; do
      [ -f "${d}SKILL.md" ] || continue
      n="$(basename "$d")"
      [ -d "$GLOBAL/$n" ] && continue
      printf "   - %-28s (%s)\n" "$n" "$root"
    done
  done
fi

total=$(find "$GLOBAL" -mindepth 1 -maxdepth 1 -type d | wc -l)
echo ""
echo "Total en global: $total skills · actualizadas ${#updated[@]} · sin cambios ${#unchanged[@]} · externas ${#skipped[@]}"

# --- Auto-copia del propio script al repo (SOLO copia, sin commit) ---------
# Si la versión viva ($CLAUDE_DIR/sync-skills.sh) difiere de la copia versionada
# del repo (.claude/sync-skills.sh) Y es más nueva (mtime), la copia para que el
# usuario la commitee a mano. Si la del repo fuese más nueva, NO la pisa: avisa.
SELF_SRC="$CLAUDE_DIR/sync-skills.sh"
SELF_DST="$REPO/.claude/sync-skills.sh"
if [ -f "$SELF_SRC" ] && ! diff -q "$SELF_SRC" "$SELF_DST" >/dev/null 2>&1; then
  if [ "$SELF_SRC" -nt "$SELF_DST" ]; then        # -nt: true también si falta el destino
    mkdir -p "$(dirname "$SELF_DST")"
    if cp "$SELF_SRC" "$SELF_DST"; then
      echo ""
      echo "↗ sync-skills.sh copiado al repo (versión viva más nueva):"
      echo "   $SELF_DST"
      echo "   → commitéalo a mano cuando quieras versionar el cambio."
    fi
  else
    echo ""
    echo "⚠ sync-skills.sh: la copia viva difiere pero NO es más nueva que la del repo."
    echo "   No se ha tocado. Revisa cuál es la buena: $SELF_DST"
  fi
fi
