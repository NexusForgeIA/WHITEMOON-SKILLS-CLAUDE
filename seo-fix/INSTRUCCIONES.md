# Instrucciones de despliegue — Día 1 + Día 2

## Archivos generados

1. `robots.txt` → subir a `https://whitemoon.es/robots.txt`
2. `sitemap.xml` → subir a `https://whitemoon.es/sitemap.xml`
3. `faq-schema.html` → reemplazar el bloque FAQPage actual en el `<head>` de index.html

---

## Paso a paso

### 1. Subir robots.txt y sitemap.xml
Sube los dos archivos a la raíz del dominio. Verifica que cargan abriendo:
- https://whitemoon.es/robots.txt
- https://whitemoon.es/sitemap.xml

Ambos deben devolver 200 (no 404, no 403).

### 2. Descomentar la etiqueta sitemap en el `<head>` de index.html
Cambia esto:
```html
<!-- <link rel="sitemap" type="application/xml" href="https://whitemoon.es/sitemap.xml"> -->
```
Por esto:
```html
<link rel="sitemap" type="application/xml" href="https://whitemoon.es/sitemap.xml">
```

### 3. Reemplazar el FAQ schema
En el `<head>` de index.html, busca el bloque `<script type="application/ld+json">` que contiene `"@type": "FAQPage"` con 8 preguntas y reemplázalo por el contenido de `faq-schema.html` (6 preguntas que coinciden con las visibles).

### 4. Borrar la sección oculta (cloaking)
Busca y borra entera esta sección en el `<body>`:
```html
<section style="position:absolute;width:1px;height:1px;overflow:hidden;
  clip:rect(0,0,0,0);white-space:nowrap;" aria-hidden="true">
  <h2>Agencia de Inteligencia Artificial en Majadahonda y Madrid</h2>
  <p>WHITEMOON es la agencia líder en IA aplicada...</p>
  <p>Nuestros servicios incluyen: chatbot WhatsApp para clínicas...</p>
</section>
```

### 5. Borrar la meta keywords
En el `<head>` borra:
```html
<meta name="keywords" content="agencia inteligencia artificial Majadahonda, ...">
```

### 6. Validar
- FAQ schema: https://search.google.com/test/rich-results → introduce https://whitemoon.es/
- Performance: https://pagespeed.web.dev/ → introduce https://whitemoon.es/
- Sitemap: https://www.xml-sitemaps.com/validate-xml-sitemap.html

### 7. Google Search Console
1. Entra en https://search.google.com/search-console
2. Añade la propiedad **whitemoon.es** (tipo "Dominio") con verificación DNS
3. En "Sitemaps" → enviar `sitemap.xml`
4. En "Inspección de URLs" → introduce `https://whitemoon.es/` → "Solicitar indexación"
5. Espera 24-72h y vuelve a comprobar `site:whitemoon.es` en Google

### 8. Bing Webmaster Tools (5 min extra)
- https://www.bing.com/webmasters
- Importa propiedad desde GSC (un click)
- Envía sitemap

---

## Resultado esperado en 7-14 días

- `site:whitemoon.es` empieza a devolver resultados en Google
- Aparición para "agencia IA Majadahonda" en posiciones 20-50 (si compite contenido + autoridad de dominio)
- Rich result FAQ aparece en SERP para queries relacionadas
- Eliminado el riesgo de penalización por cloaking
