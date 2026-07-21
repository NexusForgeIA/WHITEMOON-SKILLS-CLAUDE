---
name: deploy-cache
description: >
  Caché real de los sitios WhiteMoon en GitHub Pages + Cloudflare.
  Leer antes de decir "hay que bumpear el ?v=" o "el cambio no llega
  por caché". Triggers: caché, cache, deploy, no se ve el cambio,
  propagación, ?v=, _headers, immutable, purgar, CDN.
---

# SKILL: Caché y propagación de deploys WhiteMoon

Medido en producción sobre `whitemoon.es` el 2026-07-21 (PR #575/#576).
Aplica a todos los repos WhiteMoon servidos por GitHub Pages tras Cloudflare.

## La regla real

**Todo se sirve con `Cache-Control: max-age=14400` (4 h).**
HTML, `/assets/*`, `/*.js`, imágenes e incluso un 404 — todos devuelven el
mismo TTL, con `server: cloudflare`. No hay excepciones por tipo de fichero.

**Un reemplazo in-place se propaga solo en ≤4 h.**
Misma ruta, mismo nombre de fichero → no hay que tocar el HTML ni bumpear nada.

## Regla FALSA — no repetirla

> ~~"`/assets/*` y `/*.js` se sirven `immutable, max-age=31536000`, así que hay
> que bumpear el `?v=` en las ~229 páginas o el cambio nunca llega."~~

Es falso por dos motivos:

1. El `_headers` que declara `immutable, max-age=31536000` es formato
   **Netlify / Cloudflare Pages**. **GitHub Pages lo ignora por completo.**
   El fichero es inerte: se conserva solo por si algún día se migra de host.
2. Quien manda es Cloudflare, con su TTL uniforme de 4 h.

## Cuándo sí bumpear el `?v=`

Solo para **propagación inmediata**. Es **opcional, nunca obligatorio**, y no
hace falta hacerlo en las ~229 páginas. Alternativas mejores:

- **Purgar el caché de Cloudflare** — la vía limpia para forzar propagación ya.
- **Cache-bust puntual con `?x=`** — para verificar un deploy al instante sin
  tocar el repo.

## Verificar un deploy al instante

```bash
# Compara los bytes servidos contra el fichero local, saltándose el edge
curl -sI "https://whitemoon.es/orion-widget.js?x=$(date +%s)" | grep -i content-length
wc -c orion-widget.js
```

## Síntoma que NO es un deploy fallido

Tras un deploy, la URL sin query devuelve los bytes viejos un rato mientras la
misma URL con `?x=` ya trae los nuevos. Es el edge con `age` < 14400.
Esperar, o purgar Cloudflare. No re-desplegar a ciegas.
