# Proceso de Implantación en Cliente — WhiteMoon

Cómo se vende, se acota y se entrega un proyecto de automatización sin improvisar. Aplica a los planes BASIC / PRO / ENTERPRISE ESENCIAL.

**Principio rector:** el alcance NO se decide en la propuesta, se decide en el **descubrimiento**. Nunca se toca código sin saber dónde viven los datos del cliente y sin un alcance de 1 página aceptado.

---

## 0 · La pregunta que lo decide todo

> **¿Dónde viven HOY los datos que la automatización necesita?**

De la respuesta salen tres escenarios, y cambian el alcance, el plan, el precio y el riesgo. Confundirlos es la forma más rápida de perder dinero en un proyecto grande.

| | **A · Tiene software de gestión** | **B · No tiene nada estructurado** | **C · Híbrido** |
|---|---|---|---|
| **Situación** | Usa un vertical (dental: Gesden/Dentalink; taller: DMS; etc.) | Excel, papel, agenda de Google, WhatsApp | Tiene software pero le falta el dato clave |
| **Qué construyes** | Integración (leer/escribir) + panel de control | **Mini-CRM operativo** + automatizaciones | Capa ligera solo para el dato que falta |
| **El cliente mete datos** | No (sigue en su software) | **Sí, vive dentro de tu panel** | Parcialmente |
| **Plan** | PRO | **ENTERPRISE** | PRO / ENTERPRISE |
| **Esfuerzo típico** | 1-2 semanas | **3-6 semanas** | 2-3 semanas |
| **Riesgo principal** | Que **no exista API** | Adopción y soporte operativo | Duplicidad de datos |
| **Permanencia** | Media | **Muy alta** (te vuelves imprescindible) | Media-alta |

**Regla de oro comercial:** si es escenario B y lo vendes como PRO, **pierdes dinero**. Si es escenario A y prometes integración sin verificar la API, **te bloqueas**.

---

## 1 · Fase 0 — Descubrimiento (1-2 días)

Reunión de 30-45 min. Objetivo: determinar escenario, dolor prioritario y viabilidad técnica.

### Guion de la reunión

1. **Dolor:** "¿Qué se te escapa hoy que si lo cazaras te cambiaría el mes?" (dejar hablar; anotar en su lenguaje, no en el tuyo).
2. **Volumen:** ¿cuántos de eso al mes? (leads, presupuestos, citas, pedidos). Sin volumen no hay ROI.
3. **Datos:** las preguntas del cuestionario de abajo.
4. **Personas:** ¿quién lo haría hoy a mano? ¿quién usaría el panel?
5. **Éxito:** "¿qué tendría que pasar en 60 días para que digas que ha merecido la pena?" → esto es el criterio de éxito del proyecto.

### Cuestionario de descubrimiento (obligatorio)

**Datos y sistemas**
- ¿Qué programa usas para gestionar [pacientes/clientes/pedidos]? Nombre exacto y versión.
- ¿Ese programa **tiene API**? ¿Puedes exportar a CSV/Excel? ¿Con qué frecuencia?
- ¿Quién te lo administra? ¿Tienes acceso de administrador?
- Si no hay programa: ¿dónde está la información? (Excel, agenda, papel, WhatsApp)
- ¿Cuántos registros hay hoy? (para la importación inicial)

**Comunicación**
- ¿Por qué canal contactas hoy con tus clientes? (llamada, WhatsApp, email, SMS)
- ¿Tienes email propio de dominio? ¿Quién lo gestiona (Ionos, Google, Microsoft)?
- ¿Tus clientes son **empresas o particulares**? → decide todo el bloque legal.
- ¿Tienes consentimiento/base de datos propia, o querrías captar en frío? → si dice frío, ver § Legal.

**Operativa**
- ¿Quién ejecutaría la acción cuando la automatización avise? (recepción, comercial, tú)
- ¿En qué horario? ¿Hay alguien siempre?
- ¿Qué pasa hoy cuando alguien no contesta? (te dice el hueco real)

**Técnico / accesos**
- ¿Tienes web? ¿Dónde está alojada? ¿Quién la toca?
- ¿Puedes darnos acceso a X? (lo mínimo imprescindible, nunca de más)

### Salida de la Fase 0
- Escenario determinado (A / B / C).
- Dolor prioritario y volumen.
- **Alcance de 1 página** (plantilla abajo) + propuesta con precio.
- **Nada de código hasta que el alcance esté aceptado por escrito.**

---

## 2 · Fase 1 — Infraestructura (medio día)

Invisible para el cliente. Se monta la base:

- Proyecto Supabase `wm-[cliente]` (aislado).
- Repo `WHITEMOON-[CLIENTE]` en NexusForgeIA.
- Tablas + RLS según el alcance.
- Secrets del cliente en su proyecto.
- Importación inicial de datos si aplica (CSV).

**Entregable:** ninguno de cara al cliente. Es preparación.

---

## 3 · Fase 2 — MVP de UNA automatización (2-4 días)

La más importante del proyecto: **aquí se gana o se pierde la confianza.**

- Se construye **solo la automatización de mayor dolor** (la que más dinero mueve).
- Se prueba **con datos reales del cliente**, no de prueba.
- Se le enseña el **primer resultado real** (ese email enviado, ese presupuesto recuperado).

**Entregable:** demostración en vivo del primer resultado + acceso al panel básico.

**Regla:** no se avanza a la Fase 3 hasta que el cliente vea funcionar el MVP. Si algo del alcance era inviable, se detecta aquí y se renegocia, no al final.

---

## 4 · Fase 3 — Resto del plan + dashboard + formación (3-5 días)

- Se añaden las automatizaciones restantes del plan.
- Dashboard completo (estático, GitHub Pages, gated por token CDN): ejecuciones, logs, resultados, toggles, acción manual.
- **Formación de 30 min** con quien lo va a usar (recepción/comercial), grabada o con guía escrita.

**Entregable:** panel operativo + documento de entrega (qué quedó montado, cómo se usa, a quién llamar).

---

## 5 · Fase 4 — Monitorización y recurrente (continuo)

- Alerta automática de fallos (si una automatización peta → aviso Telegram).
- Revisión mensual de resultados con el cliente (esto renueva la cuota sola).
- Alta en panel CDN: setup + cuota mensual, token de control (impago → off).

**Entregable mensual:** informe corto de resultados (cuántas ejecuciones, qué generó).

---

## 6 · Plantilla — Alcance de 1 página

```
CLIENTE: 
FECHA: 
ESCENARIO: A / B / C
PLAN: BASIC / PRO / ENTERPRISE

1. PROBLEMA A RESOLVER (en palabras del cliente)
   -

2. AUTOMATIZACIONES INCLUIDAS (del catálogo, por ID)
   - [ID] Nombre → qué hace, qué dispara, qué acción ejecuta
   - 
   -

3. DATOS
   - Origen: (software con API / CSV / entrada manual en el panel)
   - Tablas necesarias:
   - Importación inicial: sí/no, nº registros

4. CANALES DE SALIDA
   - Email (desde: ), Telegram (opt-in), wa.me asistido, panel

5. LO QUE NO INCLUYE (explícito, evita discusiones)
   - 

6. QUÉ NECESITAMOS DEL CLIENTE
   - Accesos:
   - Datos:
   - Persona de contacto:

7. CRITERIO DE ÉXITO A 60 DÍAS
   - 

8. PLAZOS Y PRECIO
   - Fases y fechas:
   - Setup: __ € · Cuota mensual: __ €/mes · Sin permanencia
```

---

## 7 · Cómo preciar (guía, no tarifa)

El precio sale de tres factores, no del número de automatizaciones:

1. **Escenario** (A/B/C) → es el multiplicador principal. B cuesta 2-3 veces A.
2. **Origen de datos** → integración con API verificada (barato) vs construir capa propia (caro) vs sin API y con CSV manual (medio + fricción).
3. **Responsabilidad** → si guardas datos personales/salud, asumes RGPD, backups y soporte. Eso va en la **cuota mensual**, no en el setup.

**Reglas:**
- El **setup** cubre construcción; la **cuota** cubre monitorización, soporte y responsabilidad. Nunca vendas setup sin cuota: las automatizaciones se rompen (APIs cambian, dominios caducan).
- Si el cliente vive dentro de tu panel (escenario B), la cuota debe reflejar que **eres su sistema operativo**, no un extra.
- Ante duda de alcance, **acota y cobra ampliación**. Nunca "ya lo vemos".

---

## 8 · Legal — checklist antes de entregar

Aplicar siempre que haya datos personales (casi siempre):

- [ ] ¿Los destinatarios son **empresas o particulares**? Particulares → nada de captación en frío.
- [ ] **Contrato de encargo de tratamiento** firmado (tú eres encargado, el cliente responsable). Obligatorio si guardas datos de sus clientes/pacientes.
- [ ] Datos en **proyecto aislado** del cliente, con **RLS** activo y probado.
- [ ] **Backups** configurados y verificados.
- [ ] Email: identificación del remitente + **enlace de baja** + subdominio de envío con SPF/DKIM/DMARC.
- [ ] WhatsApp: **solo wa.me asistido** (lo envía una persona). Nunca automatizar número personal.
- [ ] Telegram: solo a quien haya hecho **/start** (opt-in).
- [ ] Datos de salud → categoría especial: extremar RLS, acceso mínimo, y dejarlo por escrito.
- [ ] Datos de prueba borrados antes de entregar.

---

## 9 · Errores que matan un proyecto (red flags)

- **Vender una integración sin verificar que la API existe.** Verificarlo en Fase 0, siempre, con documentación en la mano.
- **Confundir escenario B con PRO.** Si el cliente no tiene datos estructurados, es Enterprise.
- **Empezar por la automatización más fácil** en vez de la que más dinero mueve. El MVP debe impresionar.
- **Entregar sin formación.** Si recepción no lo usa, el cliente cancela aunque funcione.
- **Setup sin cuota.** Te quedas manteniendo gratis algo que se rompe solo.
- **Alcance abierto.** Todo lo que no está en el punto 5 del alcance ("lo que NO incluye") acabará reclamándose.
- **Prometer plazos sin Fase 0.** Hasta no saber el escenario, no hay fecha.

---

## 10 · Resumen del circuito

```
Descubrimiento (escenario + dolor + volumen)
        ↓
Alcance de 1 página aceptado + propuesta
        ↓
Infra (wm-[cliente] + repo + tablas)
        ↓
MVP de la automatización estrella → demo con datos reales
        ↓
Resto del plan + dashboard + formación
        ↓
Monitorización + informe mensual + cuota (CDN)
```
