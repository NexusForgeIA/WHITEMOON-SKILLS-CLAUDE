# Catálogo de Automatizaciones Vendibles — WhiteMoon

Repertorio para los planes **BASIC / PRO / ENTERPRISE ESENCIAL**. Cada ficha: qué hace (lenguaje de cliente), sectores, plan sugerido, cómo se construye en el stack (disparador → pasos → acción) y riesgo.

**Stack base (siempre):** Supabase del cliente (`wm-[cliente]`) · Edge Functions (Deno) · Postgres + pg_cron · Claude API · Resend/SES (email) · Telegram Bot API · Supabase Storage · pgvector (RAG). Dashboard estático en GitHub Pages gated por token CDN. Ver PLAYBOOK para el detalle.

**Criterio de plan (orientativo):**
- **BASIC** — 1 disparador → 1 acción, sin IA o IA simple. Setup rápido.
- **PRO** — multi-paso con IA (Claude genera/decide) + 1-2 integraciones.
- **ENTERPRISE** — multi-agente, RAG, varias integraciones, panel a medida, colas.

---

## A · Ventas y captación

### A1 · Propuesta comercial automática
- **Qué hace:** entra un lead → genera una propuesta a medida (email + PDF con servicio, precio y condiciones) y la envía (o la deja lista para aprobar).
- **Sectores:** todos. Estrella para agencias, consultoras, servicios B2B.
- **Plan:** PRO (email) · ENTERPRISE (PDF + seguimiento + panel).
- **Construcción:** trigger insert en `leads` → Edge Function → Claude genera propuesta con datos del lead → Resend envía (o guarda `estado=pendiente_aprobar`) → registro en `propuestas`.
- **Riesgo:** 🟢 inbound/warm · 🟡 si es frío (semi-automático + baja).

### A2 · Captador + calificador de leads (chatbot → CRM)
- **Qué hace:** el chatbot de la web capta nombre+teléfono+necesidad, califica por interés y lo mete en el pipeline con aviso al móvil.
- **Sectores:** todos.
- **Plan:** BASIC (captar+avisar) · PRO (calificar con IA + pipeline).
- **Construcción:** chatbot → Edge Function `lead-capture` → insert en `leads` + Telegram/email → Claude clasifica (frío/templado/caliente).
- **Riesgo:** 🟢

### A3 · Seguimiento por estado (nurture multicanal)
- **Qué hace:** según el estado del lead, dispara el mensaje correcto (email o `wa.me` asistido): recordatorio, segunda oportunidad, reactivación.
- **Sectores:** todos.
- **Plan:** PRO.
- **Construcción:** pg_cron diario → Edge Function revisa `leads` por estado/antigüedad → genera mensaje con Claude → envía email (Resend) o prepara `wa.me` para el comercial.
- **Riesgo:** 🟢 warm · 🟡 frío.

### A4 · Onboarding de cliente nuevo
- **Qué hace:** al firmar un cliente, envía email de bienvenida personalizado + checklist + próximos pasos, y crea sus registros.
- **Sectores:** agencias, SaaS, servicios recurrentes.
- **Plan:** BASIC.
- **Construcción:** trigger insert en `clientes` → Edge Function → Claude redacta bienvenida → Resend + crea filas de onboarding.
- **Riesgo:** 🟢

### A5 · Recuperación de presupuestos/carritos
- **Qué hace:** si un presupuesto/pedido queda sin cerrar X días, envía recordatorio con incentivo.
- **Sectores:** e-commerce, talleres, reformas, dental.
- **Plan:** PRO.
- **Construcción:** pg_cron → detecta `estado=abierto` + antigüedad → Claude redacta recordatorio → email/WhatsApp asistido.
- **Riesgo:** 🟢

---

## B · Atención al cliente y soporte

### B1 · Auto-respuesta de emails con IA (RAG)
- **Qué hace:** responde correos de clientes automáticamente usando la base de conocimiento del negocio; escala a humano si no sabe.
- **Sectores:** todos con volumen de soporte.
- **Plan:** ENTERPRISE (RAG + escalado).
- **Construcción:** email entrante (webhook del proveedor) → Edge Function → pgvector busca en docs → Claude redacta respuesta → envía o marca para humano.
- **Riesgo:** 🟢

### B2 · Handoff chatbot → humano
- **Qué hace:** el bot atiende, y cuando detecta compra/queja/urgencia, pausa la IA y avisa a un humano para que tome el control.
- **Sectores:** todos con chatbot.
- **Plan:** PRO.
- **Construcción:** chatbot → Edge Function detecta intención (Claude) → si escalada, `estado=humano` + aviso Telegram al responsable.
- **Riesgo:** 🟢

### B3 · Clasificador y enrutador de tickets
- **Qué hace:** clasifica cada consulta (ventas, soporte, facturación, urgencia) y la enruta al responsable/canal correcto.
- **Sectores:** todos.
- **Plan:** PRO.
- **Construcción:** entrada (form/email/chat) → Claude clasifica → insert en cola + aviso al responsable de esa categoría.
- **Riesgo:** 🟢

### B4 · Recordatorios de cita (Telegram/email)
- **Qué hace:** recuerda al cliente su cita (24h/2h antes) y permite confirmar/cancelar.
- **Sectores:** dental, estética, fisio, talleres, gestorías.
- **Plan:** BASIC.
- **Construcción:** pg_cron → lee `citas` próximas → email/Telegram (a quien haya iniciado el bot).
- **Riesgo:** 🟢 (Telegram requiere opt-in del cliente).

---

## C · Contenido y marketing

### C1 · Generador de artículos SEO/GEO
- **Qué hace:** genera artículos optimizados (title, meta, schema, FAQ) a partir de un tema o keyword y los deja listos para publicar.
- **Sectores:** todos con blog; ideal para clientes Core.
- **Plan:** PRO.
- **Construcción:** disparador (tema en tabla o cron) → Claude redacta con reglas SEO/GEO → guarda en `articulos` / publica vía API (WordPress/GitHub).
- **Riesgo:** 🟢

### C2 · Programador de redes sociales con IA
- **Qué hace:** genera y calendariza posts (texto + copy) para la semana a partir de los servicios del negocio.
- **Sectores:** todos.
- **Plan:** PRO.
- **Construcción:** cron semanal → Claude genera N posts → guarda en `calendario_social` → dashboard para revisar/aprobar.
- **Riesgo:** 🟢

### C3 · Repurposing de contenido
- **Qué hace:** convierte un artículo/vídeo en varios formatos (post, newsletter, guion corto, FAQ).
- **Sectores:** agencias, formación, servicios.
- **Plan:** PRO.
- **Construcción:** input (URL/texto) → Claude reescribe en N formatos → guarda/entrega.
- **Riesgo:** 🟢

### C4 · Newsletter automática
- **Qué hace:** compone y envía una newsletter periódica con novedades/artículos del negocio, con baja incluida.
- **Sectores:** todos con lista propia.
- **Plan:** PRO.
- **Construcción:** cron → Claude compone desde `articulos`/novedades → Resend a la lista (con unsubscribe).
- **Riesgo:** 🟢 (lista propia consentida).

---

## D · Multimedia IA (extra premium)

### D1 · Vídeo de propiedad/producto con IA
- **Qué hace:** genera un vídeo inmersivo de una propiedad o producto a partir de fotos, para mejorar la visita del comprador.
- **Sectores:** inmobiliaria (ya en demo InmoÉlite), e-commerce.
- **Plan:** ENTERPRISE.
- **Construcción:** subida de fotos → Edge Function → API de generación de vídeo IA → guarda en Storage → publica/entrega.
- **Riesgo:** 🟢

### D2 · Fotografía de producto premium con IA
- **Qué hace:** mejora/estiliza fotos de producto (fondos, iluminación) automáticamente.
- **Sectores:** e-commerce, restauración, inmobiliaria.
- **Plan:** PRO.
- **Construcción:** subida → API de imagen IA → Storage → entrega.
- **Riesgo:** 🟢

### D3 · Transcripción y acta de reuniones/llamadas
- **Qué hace:** transcribe una llamada/reunión y genera acta + tareas + resumen.
- **Sectores:** consultoras, legal, agencias, call center propio.
- **Plan:** PRO.
- **Construcción:** audio → transcripción → Claude genera acta/tareas → guarda/envía.
- **Riesgo:** 🟢 (avisar de grabación / consentimiento).

---

## E · Operaciones y back-office

### E1 · Lectura de facturas/tickets (OCR + registro)
- **Qué hace:** extrae datos de facturas/recibos (foto o PDF) y los registra en una tabla/hoja para contabilidad.
- **Sectores:** todos, gestorías.
- **Plan:** PRO.
- **Construcción:** subida (o Telegram) → OCR/Claude extrae campos → insert en `gastos` → aviso.
- **Riesgo:** 🟢

### E2 · Reporte diario/semanal automático
- **Qué hace:** envía un resumen de KPIs (leads, ventas, citas, pipeline) por Telegram/email a una hora fija.
- **Sectores:** todos.
- **Plan:** BASIC.
- **Construcción:** pg_cron → consulta métricas → Claude redacta resumen → Telegram/email. (Es el patrón de `sofia-coordinator`.)
- **Riesgo:** 🟢

### E3 · Sincronización entre sistemas
- **Qué hace:** mantiene en sincronía dos fuentes (ej. formulario ↔ CRM, pedidos ↔ almacén).
- **Sectores:** e-commerce, servicios con varias herramientas.
- **Plan:** PRO.
- **Construcción:** trigger/cron → Edge Function lee A → transforma → escribe B.
- **Riesgo:** 🟢

### E4 · Alertas y monitorización
- **Qué hace:** vigila un umbral (stock bajo, web caída, review negativa nueva) y avisa al instante.
- **Sectores:** todos.
- **Plan:** BASIC.
- **Construcción:** cron/webhook → chequeo → si condición, aviso Telegram.
- **Riesgo:** 🟢

---

## F · Datos e inteligencia (con cautela legal)

### F1 · Enriquecimiento de prospectos
- **Qué hace:** completa la ficha de un prospecto con datos públicos (web, sector, tamaño).
- **Sectores:** venta B2B.
- **Plan:** PRO.
- **Construcción:** prospecto → Firecrawl/HTTP a su web pública → Claude estructura → guarda.
- **Riesgo:** 🟡 datos públicos B2B + minimización; evitar datos personales sensibles.

### F2 · Extracción de email de web para outreach B2B
- **Qué hace:** saca el email público de contacto de la web del prospecto para email B2B.
- **Sectores:** venta B2B (solo prospectos CON web).
- **Plan:** PRO.
- **Construcción:** Firecrawl a la web → regex email → guarda → alimenta A1/A3 con baja + identificación.
- **Riesgo:** 🟡 LSSI: B2B con baja y remitente identificado; nunca particulares en frío. Enviar desde subdominio de envío aislado (no el buzón principal).

### F3 · Chatea con tus datos (RAG interno)
- **Qué hace:** el equipo/cliente pregunta en lenguaje natural sobre sus documentos/BD y recibe respuestas citadas.
- **Sectores:** legal, gestorías, empresas con documentación.
- **Plan:** ENTERPRISE (es tu Core RAG).
- **Construcción:** docs → pgvector → Edge Function `rag-chat` → Claude responde citando.
- **Riesgo:** 🟢

---

## Notas de venta

- **Empaqueta por resultado, no por tecnología:** el cliente compra "que no se te escape ningún lead" o "propuestas en 2 minutos", no "una Edge Function".
- **Escalera natural:** empieza en BASIC (1 automatización) y sube a PRO/ENTERPRISE añadiendo IA, integraciones y panel.
- **Recurrencia:** el mantenimiento/monitorización de cada automatización justifica la cuota mensual.
- **Diferenciador:** todo corre en el Supabase del cliente, sin cuotas de n8n/Zapier por ejecución → margen alto y sin sorpresas de coste.
