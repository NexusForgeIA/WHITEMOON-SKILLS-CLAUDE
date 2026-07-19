# Playbook de Construcción de Automatizaciones — WhiteMoon

Cómo convertir cualquier "receta" (workflow de n8n, idea de cliente) en una automatización **nativa en Supabase**, siempre igual de rápido. NO usamos n8n en producción: es solo referencia.

---

## 1 · Traducción n8n → Supabase (el mapeo)

Todo workflow se lee como **disparador + pasos + acción**. Cada nodo tiene equivalente nativo:

| Nodo n8n | Equivalente nativo (nuestro stack) |
|---|---|
| Webhook trigger | Endpoint HTTP de una Edge Function |
| Trigger "on new/updated row" | Database Webhook / trigger de Postgres |
| Schedule / Cron | **pg_cron** |
| Nodo IA (OpenAI/GPT/Gemini) | Llamada a **Claude API** dentro de la Edge Function |
| Email (Gmail/SMTP/Brevo) | **Resend** o Amazon SES |
| HTTP Request | `fetch()` en la Edge Function |
| Google Sheets / Airtable / NocoDB | Tablas **Postgres** en Supabase |
| Pinecone / Vector store | **pgvector** |
| Telegram / Slack | Telegram Bot API (bot de WhiteMoon o del cliente) |
| IF / Switch / Router | Lógica JS/TS en la Edge Function |
| Google Drive / S3 | **Supabase Storage** |
| Wait / Queue | Tabla como cola + pg_cron worker |
| OCR / transcripción | API externa (`fetch`) → resultado a tabla |
| Merge / Aggregate | Query SQL / JS |

Regla: si un workflow tiene 8 nodos, normalmente son **1 disparador + 1-3 Edge Functions + 1-2 tablas + 1 acción de salida**. No hace falta replicar nodo a nodo, sino el resultado.

---

## 2 · Los 7 pasos de montaje (siempre iguales)

1. **Proyecto Supabase del cliente:** `wm-[cliente]` (Modelo A: aislado por cliente). Datos y secrets suyos, separados.
2. **Modelo de datos:** crear las tablas mínimas (ej. `leads`, `propuestas`, `citas`, `logs_automatizacion`). Con RLS.
3. **Edge Functions = los pasos:** una función por unidad lógica (captar, generar, enviar). `verify_jwt:false` solo si es endpoint público; si no, protegida.
4. **Disparadores:** Database Webhook/trigger (on insert/update), endpoint HTTP (webhook externo) o **pg_cron** (programado).
5. **Secrets:** claves (Claude, Resend, Telegram, terceros) en Supabase Secrets del proyecto del cliente. **Nunca en el cliente ni en el repo.**
6. **Dashboard del cliente:** panel estático (HTML/JS) en **GitHub Pages**, gated por **token CDN** (como Scout/panel CDN). Muestra: automatizaciones activas, ejecuciones/logs (`logs_automatizacion`), resultados, toggle on/off, botón manual.
7. **Facturación + monitorización:** alta en el panel CDN (setup + cuota/mes), token de control (impago → off), y una alerta de fallos (si una automatización peta, aviso Telegram).

---

## 3 · Convenciones de nombres

- **Proyecto:** `wm-[cliente]` (ej. `wm-clinicasol`).
- **Edge Functions:** `[dominio]-[accion]` → `lead-capture`, `propuesta-generar`, `propuesta-enviar`, `cita-recordar`, `report-diario`.
- **Tablas de log:** `logs_automatizacion` (columnas: `id, created_at, automatizacion, entrada, salida, estado, error`).
- **Estados:** kebab/enum consistente (`pendiente`, `enviado`, `error`, `pausado`).
- **Notify:** reutilizar el patrón `-notify` server-side (Telegram/Resend), nunca apikeys en cliente.

---

## 4 · Plantilla mental de una Edge Function de automatización

```
1. Recibe el disparo (payload del webhook / fila / cron).
2. Valida y carga datos que falten (query a Postgres / fetch a terceros).
3. (Si aplica) llama a Claude API con un prompt claro → genera/decide.
4. Ejecuta la acción (Resend / Telegram / insert / API externa).
5. Escribe en logs_automatizacion (estado + salida + error si lo hay).
6. Devuelve {ok, ...} y NUNCA expone secretos.
```

Encoding: al enviar/recibir texto con acentos/ñ, **UTF-8 explícito** (bytes UTF-8), o se corrompe (ya nos pasó con Retell).

---

## 5 · Checklist de entrega (antes de dar por hecha una automatización)

- [ ] Proyecto/módulo del cliente creado y aislado.
- [ ] Tablas + RLS.
- [ ] Edge Functions desplegadas (versión confirmada por API/CLI, no "done").
- [ ] Disparador probado end-to-end con dato real → resultado real verificado.
- [ ] Secrets en el proyecto del cliente; cero secretos en cliente/repo.
- [ ] Dashboard estático accesible y gated por token.
- [ ] Log de ejecución escribe correctamente (éxito y error).
- [ ] Alerta de fallo configurada.
- [ ] Datos de prueba borrados, sin residuos.
- [ ] Alta y cuota en panel CDN.

---

## 6 · Legal (aplicar en las 🟡 del catálogo)

- **Email frío B2B:** solo a emails de negocio públicos, con **identificación del remitente + enlace de baja (unsubscribe)**, desde **subdominio de envío aislado** con SPF/DKIM/DMARC (nunca el buzón principal). Evitar particulares en frío (LSSI art. 21).
- **WhatsApp:** no automatizar número personal (baneo + ToS). Solo **wa.me asistido** (lo envía un humano) o Business API para contactos consentidos.
- **Telegram saliente:** solo a quien haya iniciado el bot (opt-in). No hay envío en frío.
- **Scraping/enriquecimiento:** datos públicos B2B, minimización, no revender datos personales. Respetar ToS de portales (idealista, etc. prohíben scraping).
- **Grabación/transcripción:** avisar y consentir.
- **RGPD general:** base legal, derecho de oposición/baja, y datos del cliente en SU proyecto aislado.

---

## 7 · De la venta a la entrega (flujo)

1. Cliente elige plan → miras el **CATÁLOGO**, seleccionas automatizaciones por plan/sector.
2. Defines el alcance (disparadores, acciones, integraciones) en 1 página.
3. Sigues los **7 pasos** de este playbook.
4. Entregas con dashboard + demo del resultado real.
5. Facturas por CDN y dejas la monitorización activa.

Ventaja competitiva a recordar en la venta: **corre en la infraestructura del cliente, sin cuotas por ejecución de n8n/Zapier**, aislado y a medida → margen alto, coste predecible, y no depende de cuentas de terceros que se desconectan.
