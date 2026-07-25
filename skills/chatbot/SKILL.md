# SKILL: Chatbot/Agente IA WhiteMoon

## Stack obligatorio
- Edge Function Supabase
- Modelo: claude-haiku-4-5-20251001
- max_tokens: 450
- messages.slice(-12)

## Reglas system prompt
- Máximo 3 frases por respuesta
- Una pregunta a la vez
- Al tener nombre + teléfono: cerrar y enviar lead
- NUNCA dar precios de honorarios internos
- NUNCA inventar datos (BOE, fiscales, legales)

## Envío lead WhatsApp
WA_NUMBER = 34643199580
Siempre incluir: nombre, teléfono, sector, origen "Agente IA"

## Edge Functions activas
- gestoria-demo-chat: Laura, agente IA de la demo de gestoría
- gestotrafic-itp: cálculo ITP + tasa DGT + valor venal (CRM GestoTrafic)

## Motor de cálculo ITP
FUENTE DE VERDAD: `WHITEMOON-WEB/calculadora-itp/index.html`
(BOE 2026 · Orden HAC/1501/2025). Ahí viven la tabla de depreciación
del Anexo IV, los tipos autonómicos, las cuotas fijas y las exenciones.

La Edge Function `gestotrafic-itp` es un port VERBATIM de ese motor,
hecho para el CRM GestoTrafic.

Para cualquier cálculo de ITP: reutilizar uno de los dos. NUNCA
reimplementar el cálculo ni citar cifras del BOE de memoria.
