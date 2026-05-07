# Día 3-4: Performance + Imágenes

## Objetivo
- Reducir el peso del HTML de la home (~80KB de logos en base64 → externos)
- Mejorar LCP y CLS añadiendo `loading="lazy"`, `width` y `height` a todas las `<img>`
- Arreglar el `<img src="">` vacío del footer
- Eliminar duplicados de `<link rel="preconnect">`

Impacto esperado: **LCP -1.5 a -3 segundos**, **CLS cerca de 0**, mejora directa en Core Web Vitals.

---

## 1. Extraer los logos base64 a archivos físicos

### 1.1 Generar los archivos PNG desde el HTML actual
En tu equipo (terminal con Node o Python), extrae los dos base64 que tienes embebidos:

**Logo del nav (52px de alto):**
```bash
# Copia el string base64 que empieza por "iVBORw0KGgoAAAANSUhE..." del primer <img> del nav
# Decodifícalo a logo.png
echo 'iVBORw0KGgoAAAANSUhE...' | base64 -d > logo.png
```

**Logo del hero (380px wide):**
```bash
# Copia el segundo string base64 (el del hero, mucho más grande)
echo 'iVBORw0KGgoAAAANSUhE...' | base64 -d > logo-hero.png
```

### 1.2 Optimizarlos a WebP
```bash
# Necesitas cwebp (instala con: brew install webp / apt install webp)
cwebp -q 85 logo.png -o logo.webp
cwebp -q 90 logo-hero.png -o logo-hero.webp
```

### 1.3 Subirlos a la raíz del dominio
- `https://whitemoon.es/logo.png` (fallback)
- `https://whitemoon.es/logo.webp`
- `https://whitemoon.es/logo-hero.png`
- `https://whitemoon.es/logo-hero.webp`

También necesitas:
- `https://whitemoon.es/og-image.jpg` (1200x630, ya referenciada en OG y Schema)
- `https://whitemoon.es/favicon.ico` (32x32)

---

## 2. Reemplazar el logo del nav

**ANTES** (línea del nav, dentro de `.nav-logo`):
```html
<a href="javascript:void(0)" class="nav-logo" onclick="window.scrollTo({top:0,behavior:'smooth'})">
  <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALQAAABSCAIAAABys...[80KB]..."
       alt="WHITEMOON" style="height:52px;width:auto;">
</a>
```

**DESPUÉS:**
```html
<a href="javascript:void(0)" class="nav-logo" onclick="window.scrollTo({top:0,behavior:'smooth'})" aria-label="WhiteMoon - Inicio">
  <picture>
    <source srcset="/logo.webp" type="image/webp">
    <img src="/logo.png"
         alt="WhiteMoon Agencia IA"
         width="180"
         height="52"
         style="height:52px;width:auto;"
         fetchpriority="high">
  </picture>
</a>
```

---

## 3. Reemplazar el logo del hero

**ANTES** (en la sección `<section class="hero">`):
```html
<div style="display:flex;justify-content:center;margin-bottom:36px;">
  <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaQAAAC..."
       alt="WHITEMOON Agencia de IA"
       style="max-width:380px;width:80%;height:auto;filter:drop-shadow(...);">
</div>
```

**DESPUÉS:**
```html
<div style="display:flex;justify-content:center;margin-bottom:36px;">
  <picture>
    <source srcset="/logo-hero.webp" type="image/webp">
    <img src="/logo-hero.png"
         alt="WhiteMoon Agencia de Inteligencia Artificial"
         width="420"
         height="190"
         style="max-width:380px;width:80%;height:auto;filter:drop-shadow(0 0 32px rgba(124,77,255,0.35));"
         fetchpriority="high">
  </picture>
</div>
```

> `fetchpriority="high"` solo en estos dos logos (uno está sobre el fold). El resto de imágenes deben ir con `loading="lazy"`.

---

## 4. Arreglar el `<img src="">` del footer

**ANTES:**
```html
<a href="javascript:void(0)" class="foot-brand" onclick="window.scrollTo({top:0,behavior:'smooth'})" aria-label="WhiteMoon">
  <img class="foot-logo" alt="WhiteMoon" src="">
</a>
```

**DESPUÉS:**
```html
<a href="javascript:void(0)" class="foot-brand" onclick="window.scrollTo({top:0,behavior:'smooth'})" aria-label="WhiteMoon">
  <img class="foot-logo"
       src="/logo.png"
       alt="WhiteMoon"
       width="180"
       height="52"
       loading="lazy">
</a>
```

Y borra el script al final del footer que inyectaba el src vía JS (ya no lo necesitas):
```html
<!-- BORRAR: -->
<script>
  (function(){
    var navImg = document.querySelector('.nav-logo img');
    var footImg = document.querySelector('.foot-logo');
    if (navImg && footImg) footImg.src = navImg.src;
  })();
</script>
```

---

## 5. Imágenes de los pasos del proceso (sección Servicios)

Las 4 imágenes Unsplash de los pasos deben llevar `loading="lazy"`, `width`, `height` y un `alt` más descriptivo.

**Paso 1 — ANTES:**
```html
<img src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=500&q=80"
     alt="Llamada de diagnóstico"
     style="width:100%;height:100%;object-fit:cover;filter:brightness(.7) saturate(.8)">
```

**Paso 1 — DESPUÉS:**
```html
<img src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=500&q=80&fm=webp"
     alt="Llamada de diagnóstico inicial con WhiteMoon para implantar IA en tu negocio"
     width="500"
     height="333"
     loading="lazy"
     decoding="async"
     style="width:100%;height:100%;object-fit:cover;filter:brightness(.7) saturate(.8)">
```

Aplica el mismo patrón a los 4 pasos:

| Paso | Foto | Alt sugerido |
|---|---|---|
| 1 | photo-1600880292203 | "Llamada de diagnóstico inicial con WhiteMoon" |
| 2 | photo-1555421689 | "Diseño y configuración del agente IA personalizado" |
| 3 | photo-1460925895917 | "Instalación del chatbot IA en tu web en menos de 1h" |
| 4 | photo-1573164713988 | "Tu negocio funcionando con IA 24 horas al día" |

**Mejor aún:** descarga las 4 imágenes, conviértelas a WebP, súbelas a `/img/paso-1.webp`, etc. Tu sitio dejará de depender de Unsplash (más rápido y sin riesgo de que cambien la URL).

---

## 6. Imágenes del Pricing (Pack Advance y Pack Pyme)

Misma operación con las 2 imágenes Unsplash de las tarjetas de precio. Añade `width="800"`, `height="220"`, `loading="lazy"` y `decoding="async"`.

```html
<img src="https://images.unsplash.com/photo-1551434678-e076c223a692?w=800&q=80&fm=webp"
     alt="Pack Advance — chatbot IA para tu negocio"
     width="800"
     height="220"
     loading="lazy"
     decoding="async"
     style="width:100%;height:100%;object-fit:cover;transition:transform .4s">
```

---

## 7. Limpieza de duplicados en el `<head>`

**Borra** la línea duplicada (`<link rel="preconnect" href="https://fonts.googleapis.com">` aparece dos veces). Deja solo una.

**Versión limpia y completa para el `<head>`:**
```html
<!-- Performance: preconnect + dns-prefetch -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="dns-prefetch" href="https://wa.me">
<link rel="dns-prefetch" href="https://images.unsplash.com">

<!-- Favicon -->
<link rel="icon" type="image/png" href="/favicon.ico">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">

<!-- Fuentes (con display=swap) -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
```

---

## 8. (Opcional) Diferir Google Fonts para mejorar FCP

Si quieres ganar más velocidad, sustituye:
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:..." rel="stylesheet">
```

Por:
```html
<link rel="preload" as="style"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      onload="this.onload=null;this.rel='stylesheet'">
<noscript>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap">
</noscript>
```

---

## 9. Validación

Después de subir los cambios:

1. **PageSpeed Insights:** https://pagespeed.web.dev/?url=https%3A%2F%2Fwhitemoon.es%2F
   - Mobile debería pasar de Poor → Good en LCP
   - CLS cerca de 0
2. **Lighthouse en Chrome DevTools** (F12 → Lighthouse): 4 categorías ≥ 85
3. **HTML weight:** abre la home y mira "View Source" — debería pesar ~50% menos que antes
4. Comprueba que **todas las imágenes cargan** (sin 404 en Network tab)

---

## Resumen de cambios

| # | Cambio | Líneas afectadas |
|---|---|---|
| 1 | Logo nav: base64 → `<picture>` con WebP | 1 línea |
| 2 | Logo hero: base64 → `<picture>` con WebP | 1 línea |
| 3 | Footer img src vacío → fix | 1 línea |
| 4 | Borrar script JS de inyección de logo | 6 líneas |
| 5 | 4 imágenes pasos: lazy + dims + alt | 4 líneas |
| 6 | 2 imágenes pricing: lazy + dims + alt | 2 líneas |
| 7 | Borrar `<link preconnect>` duplicado | 1 línea |

**Total:** ~16 líneas modificadas, ~80KB menos de HTML.
