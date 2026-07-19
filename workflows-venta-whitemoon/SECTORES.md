# Fichas por Sector — WhiteMoon

Inteligencia sectorial para vender e implantar automatizaciones. Una ficha por vertical: dolores, escenario probable, automatizaciones recomendadas (IDs del CATÁLOGO), preguntas de descubrimiento propias, matices legales y prompt listo para usar.

**Cómo se usa:** llega un cliente → abres su ficha → llevas la reunión con las preguntas de aquí → determinas escenario real → alcance de 1 página (PROCESO §6).

**AVISO CRÍTICO sobre los softwares listados:** son los que **suelen** aparecer en cada sector. NO están verificados sus APIs. **Nunca prometas una integración sin comprobar en Fase 0 que la API existe, es accesible y el cliente tiene credenciales.** Es el red flag nº1 del proceso.

**Recordatorio de escenarios (PROCESO §0):** A = tiene software de gestión (integras) · B = no tiene nada estructurado (mini-CRM → ENTERPRISE) · C = híbrido (capa ligera).

---

## 1 · Clínicas dentales

**Dolores típicos**
- Presupuestos altos (implantes, ortodoncia, estética) que se escuchan y no se aceptan.
- No-shows que dejan huecos de agenda imposibles de rellenar.
- Pacientes que no vuelven a revisión/limpieza en 6-12 meses.
- Recepción saturada: no da tiempo a perseguir presupuestos.

**Escenario probable:** A o C. Suelen tener software de gestión, pero el campo "estado del presupuesto" a menudo no se explota.

**Software habitual (VERIFICAR API):** Gesden, Dentalink, Odontonet, Clinicminds, Nemotec.

**Automatizaciones recomendadas**
- BASIC: B4 recordatorios de cita · E2 reporte diario
- PRO: **A5 recuperación de presupuestos (la estrella)** · A3 reactivación de pacientes · A2 captador+calificador web
- ENTERPRISE: B1 auto-respuesta con RAG sobre tratamientos · panel a medida

**Preguntas específicas**
- ¿Qué % de presupuestos de implante/ortodoncia se te queda sin aceptar? ¿Cuánto factura uno de media?
- ¿Dónde ves si un presupuesto está aceptado o pendiente? ¿Lo puedes exportar?
- ¿Cuántos no-shows tienes al mes?
- ¿Quién persigue hoy los presupuestos? ¿Con qué frecuencia?

**Legal**
- Pacientes = **particulares** y **datos de salud** (categoría especial). Nada de captación en frío.
- Solo base propia con relación contractual. Contrato de encargo de tratamiento **obligatorio**.
- RLS estricto, acceso mínimo, backups. WhatsApp solo `wa.me` asistido desde recepción.

**Prompt listo**
> Clínica dental con [software / sin software], [nº] presupuestos abiertos al mes y ticket medio de [X]€. Prepárame el alcance de una página: escenario, plan, automatizaciones del catálogo, tablas, disparadores, canales y criterio de éxito a 60 días.

---

## 2 · Gestorías y asesorías

**Dolores típicos**
- Clientes que preguntan lo mismo mil veces (plazos, documentación, estado de un trámite).
- Recogida de documentación: perseguir al cliente para que envíe papeles.
- Picos estacionales (renta, trimestrales) que colapsan el despacho.
- Captación: dependen del boca a boca.

**Escenario probable:** A. Casi siempre tienen software fiscal/contable, pero cerrado.

**Software habitual (VERIFICAR API):** A3 (Wolters Kluwer), Sage Despachos, Sage 50/ContaSol, Holded, Odoo.

**Automatizaciones recomendadas**
- BASIC: B4 recordatorios de plazos · E2 reporte
- PRO: **B3 clasificador de consultas** · A2 captador web · C1 contenido SEO (muy potente en fiscal) · A3 seguimiento de documentación pendiente
- ENTERPRISE: **B1 auto-respuesta con RAG** sobre normativa y procedimientos propios · F3 chatea con tus datos

**Preguntas específicas**
- ¿Cuántas consultas repetidas recibís al día? ¿Por qué canal?
- ¿Cómo pedís la documentación al cliente y cuánto tardáis en tenerla?
- ¿Tenéis un cuadro de plazos por cliente?
- ¿Quién responde los emails y cuánto tiempo le come?

**Legal**
- Clientes suelen ser **empresas y autónomos** → email B2B más defendible (siempre con baja e identificación).
- Datos fiscales sensibles: aislamiento y RLS. **Nunca inventar datos fiscales ni plazos** en respuestas automáticas: la IA cita la fuente o deriva al gestor.

**Prompt listo**
> Gestoría con [software], [nº] clientes y [X] consultas repetidas al día. Prepárame el alcance de una página priorizando reducción de consultas y recogida de documentación.

---

## 3 · Talleres mecánicos

**Dolores típicos**
- Revisiones, ITV y cambios de aceite que se pasan porque nadie avisa.
- Presupuestos de reparación que el cliente no aprueba y se olvidan.
- Clientes que no vuelven; se van al taller de al lado.
- Todo en la cabeza del jefe de taller o en un cuaderno.

**Escenario probable:** **B** (muy frecuente). Muchos talleres pequeños no tienen DMS → mini-CRM → **ENTERPRISE**.

**Software habitual (VERIFICAR API):** GestiTaller, Milenium, Aitana, Nexus, Odoo. Muchos: nada o Excel.

**Automatizaciones recomendadas**
- BASIC (solo si ya tienen datos): B4 recordatorios
- PRO (escenario A/C): A5 recuperación de presupuestos · A3 avisos de revisión/ITV
- ENTERPRISE (escenario B): **mini-CRM de vehículos** (cliente, matrícula, servicio, fecha, próxima revisión) + A3 avisos + A5 presupuestos

**Preguntas específicas**
- ¿Dónde apuntas hoy qué coche entró, qué le hiciste y cuándo le toca la próxima?
- ¿Cuántos coches pasan al mes? ¿Cuántos históricos tienes para importar?
- ¿Cuántas revisiones/ITV se te escapan al mes? ¿Qué factura media pierdes?
- **¿Quién va a meter los datos cada vez que entra un coche?** (si no hay respuesta clara, el proyecto muere)

**Legal**
- Mezcla de **particulares y flotas de empresa**. Con particulares, solo base propia y consentimiento.
- WhatsApp `wa.me` asistido, nunca automatizar el número del taller.

**Prompt listo**
> Taller mecánico [con/sin] software, [nº] coches al mes. Prepárame el alcance de una página incluyendo las tablas del mini-CRM de vehículos si es escenario B, y el criterio de éxito a 60 días.

---

## 4 · Estética y belleza

**Dolores típicos**
- Huecos de agenda de última hora.
- Clientas que no repiten tratamiento ni completan bonos/sesiones.
- Captación por Instagram sin sistema: mensajes que se pierden.
- Promociones que no se comunican bien a la base existente.

**Escenario probable:** A o C. Es de los sectores con más adopción de software de citas.

**Software habitual (VERIFICAR API):** Flowww, Bewe, Nubapp, Treatwell, Booksy.

**Automatizaciones recomendadas**
- BASIC: B4 recordatorios + confirmación
- PRO: **A3 reactivación y seguimiento de bonos** · A2 captador web/redes · C2 programador de redes sociales · A5 recuperación de presupuestos de tratamiento
- ENTERPRISE: D2 fotografía con IA (antes/después, contenido) · panel a medida

**Preguntas específicas**
- ¿Cuántas sesiones de bono se quedan sin consumir?
- ¿Cuántos huecos de última hora tienes a la semana?
- ¿Por dónde te escriben más: Instagram, WhatsApp, web?
- ¿Tienes la base de clientas con teléfono y última visita?

**Legal**
- **Particulares.** Base propia con consentimiento; nada de frío.
- Si hay tratamientos médico-estéticos → puede haber datos de salud: extremar.
- Fotos de clientas: consentimiento explícito para uso comercial.

**Prompt listo**
> Centro de estética con [software], [nº] clientas activas y [X] bonos sin consumir. Prepárame el alcance priorizando reactivación y huecos de agenda.

---

## 5 · Inmobiliaria

**Dolores típicos**
- Leads de portales que se contestan tarde y se pierden (el primero que llama se lleva la visita).
- Captación de propietarios que quieren vender: es el cuello de botella real del negocio.
- Visitas de curiosos que hacen perder el día.
- Seguimiento de compradores en cartera: se enfría.

**Escenario probable:** A o C. Suelen tener CRM inmobiliario propio del sector.

**Software habitual (VERIFICAR API):** Inmovilla, Witei, Sooprema, Idealista Tools, Optima CRM.

**Automatizaciones recomendadas**
- BASIC: E4 alertas de lead nuevo · E2 reporte
- PRO: **A2 captador + calificador de leads (respuesta en minutos)** · A3 seguimiento de cartera de compradores · C1 contenido SEO local
- ENTERPRISE: **D1 vídeo de propiedad con IA** (extra premium, ya en demo InmoÉlite) · B1 auto-respuesta · panel a medida

**Preguntas específicas**
- ¿Cuánto tardáis de media en contestar un lead de portal? (si son horas, ahí está el dinero)
- ¿Cómo captáis propietarios hoy?
- ¿Cuántas visitas se caen por no filtrar antes?
- ¿Tenéis cartera de compradores con sus criterios de búsqueda?

**Legal**
- **Particulares** (propietarios y compradores). Nada de captación en frío scrapeando portales: los portales lo prohíben en sus términos y hay riesgo RGPD.
- La captación de vendedores se hace con **inbound** (landing de valoración gratuita + ads con formulario), no raspando anuncios.

**Prompt listo**
> Inmobiliaria con [CRM], [nº] leads de portales al mes y respuesta media de [X]. Prepárame el alcance priorizando velocidad de respuesta y captación de propietarios por inbound.

---

## 6 · Hostelería y restauración

**Dolores típicos**
- Reservas por teléfono que no se cogen en hora punta.
- No-shows de mesa sin coste para el cliente.
- Pedidos a domicilio dependientes de plataformas que se llevan comisión.
- Reseñas: no piden las buenas y no responden las malas.

**Escenario probable:** A o C. Suelen tener TPV y/o gestor de reservas.

**Software habitual (VERIFICAR API):** Ágora, Glop, Revo, Cover Manager, TheFork, Last.app.

**Automatizaciones recomendadas**
- BASIC: B4 recordatorio/confirmación de reserva · E4 alertas
- PRO: **A2 captador de reservas y pedidos por chatbot** (canal propio, sin comisión) · C2 redes sociales · A3 reactivación de clientes
- ENTERPRISE: gestión completa de pedidos + panel + D2 fotografía de producto con IA

**Preguntas específicas**
- ¿Cuántas llamadas se te quedan sin coger en hora punta?
- ¿Qué % de reservas son no-show?
- ¿Cuánto pagas de comisión a plataformas al mes? (ahí está el ROI del canal propio)
- ¿Quién responde las reseñas?

**Legal**
- **Particulares.** Base propia y consentimiento.
- Reseñas: **nunca inventarlas ni incentivarlas de forma engañosa**.

**Prompt listo**
> Restaurante con [TPV/reservas], [nº] reservas/semana y [X]€ de comisiones al mes. Prepárame el alcance priorizando canal propio de reservas/pedidos y reducción de no-shows.

---

## 7 · Electricistas (y gremios: fontanería, cerrajería, climatización)

**Dolores típicos**
- Urgencias que se pierden porque está con las manos ocupadas y no coge el teléfono.
- Presupuestos que da por WhatsApp y no cierra.
- Sin web: solo la ficha de Google, y la competencia aparece antes.
- Facturación y partes de trabajo en papel.

**Escenario probable:** **B** casi siempre. Autónomo sin nada estructurado.

**Software habitual (VERIFICAR API):** normalmente **ninguno**; a veces Holded, Odoo o una app de facturación.

**Automatizaciones recomendadas**
- BASIC / **Pack Mini Core**: landing + chatbot que capta la urgencia 24h y avisa al móvil (entrada perfecta para este sector)
- PRO: A5 seguimiento de presupuestos · A3 reactivación · E1 lectura de facturas
- ENTERPRISE: mini-CRM de partes de trabajo + presupuestos + avisos

**Preguntas específicas**
- Cuando estás en un cuadro y entra una llamada, ¿qué pasa? ¿Cuántas pierdes a la semana?
- ¿Cómo pasas presupuestos hoy? ¿Cuántos cierras?
- ¿Tienes web o solo la ficha de Google?
- ¿Trabajas para particulares, comunidades o empresas?

**Legal**
- Mezcla particulares/comunidades/empresas. Con particulares, solo base propia.
- Ojo: es el sector donde más tentación hay de automatizar WhatsApp. **No.** `wa.me` asistido.

**Prompt listo**
> Electricista autónomo sin web, [X] urgencias perdidas a la semana. Prepárame el alcance: valora si entra por Pack Mini Core o si necesita mini-CRM (escenario B).

---

## 8 · Fisioterapia y salud (podología, psicología, nutrición)

**Dolores típicos**
- Pacientes que abandonan el tratamiento a mitad (y no completan sesiones).
- Huecos por cancelaciones de última hora.
- Captación: dependen de recomendación médica o boca a boca.
- Bonos de sesiones sin consumir.

**Escenario probable:** A o C en clínicas; **B** en profesionales a domicilio o consulta pequeña.

**Software habitual (VERIFICAR API):** Clinicminds, Nubimed, Flowww, Doctoralia, agenda de Google.

**Automatizaciones recomendadas**
- BASIC / **Pack Mini Core** (autónomo a domicilio): landing + chatbot de captación
- PRO: **B4 recordatorios + confirmación** · A3 seguimiento de tratamiento y bonos · A2 captador web
- ENTERPRISE: B1 auto-respuesta con RAG · panel de seguimiento de pacientes

**Preguntas específicas**
- ¿Qué % de pacientes abandona antes de terminar el tratamiento?
- ¿Cuántas sesiones de bono quedan sin consumir?
- ¿Cuántas cancelaciones de última hora tienes?
- ¿Trabajas en clínica o a domicilio?

**Legal**
- **Datos de salud** (categoría especial). Contrato de encargo obligatorio, RLS estricto, acceso mínimo.
- Nada de captación en frío. Comunicación solo con pacientes propios.
- Nunca dar consejo clínico automatizado: la IA informa y deriva al profesional.

**Prompt listo**
> Fisioterapeuta [en clínica / a domicilio] con [nº] pacientes/mes. Prepárame el alcance priorizando adherencia al tratamiento y huecos de agenda, con el checklist de datos de salud.

---

## 9 · Abogados y procuradores

**Dolores típicos**
- Clientes que llaman constantemente para saber "cómo va lo mío".
- Búsqueda de jurisprudencia y redacción de escritos: horas facturables comidas.
- Captación de casos: dependen de recomendación.
- Documentación del cliente que no llega.

**Escenario probable:** A o C. Suelen tener software de despacho.

**Software habitual (VERIFICAR API):** Kleos y Lexon (Wolters Kluwer), Aranzadi, Sudespacho, Quolaw. (Tú tienes **JusticIA** como producto propio para este vertical.)

**Automatizaciones recomendadas**
- BASIC: B4 recordatorios de vistas y plazos · E2 reporte
- PRO: **B3 clasificador y enrutado de consultas** · A3 seguimiento de documentación · C1 contenido SEO jurídico
- ENTERPRISE: **B1/F3 RAG sobre jurisprudencia y expedientes** · redacción asistida de escritos · panel de estado del expediente para el cliente

**Preguntas específicas**
- ¿Cuánto tiempo se va en contestar "cómo va mi caso"?
- ¿Cuántos escritos redactáis al mes y cuánto tardáis en cada uno?
- ¿Dónde están los expedientes y se pueden consultar por API?
- ¿Quién busca jurisprudencia y cuánto tiempo le lleva?

**Legal**
- **Secreto profesional** + datos que pueden ser categoría especial. Máximo aislamiento.
- La IA **nunca da asesoramiento jurídico** al cliente final: informa del estado y deriva.
- Nunca inventar jurisprudencia ni artículos: siempre citar fuente verificable.

**Prompt listo**
> Despacho de abogados con [software], [nº] expedientes activos. Prepárame el alcance priorizando reducción de llamadas de estado y apoyo a redacción, con las cautelas de secreto profesional.

---

## 10 · Reformas y construcción

**Dolores típicos**
- Presupuestos que se dan y no se cierran (ratio bajísimo).
- Leads que piden precio sin intención real: pierden visitas.
- Obras con seguimiento caótico; el cliente pregunta constantemente.
- Sin web o con una muy antigua.

**Escenario probable:** **B** o C. Suelen ir con Excel y WhatsApp.

**Software habitual (VERIFICAR API):** normalmente ninguno; a veces Holded, Odoo, Presto (presupuestos).

**Automatizaciones recomendadas**
- BASIC / **Pack Mini Core**: landing + chatbot que **cualifica** (tipo de obra, m², presupuesto aproximado, zona) antes de la visita
- PRO: **A2 captador+calificador (clave: filtrar curiosos)** · A5 recuperación de presupuestos · A3 seguimiento
- ENTERPRISE: mini-CRM de obras + seguimiento de estado para el cliente + panel

**Preguntas específicas**
- ¿Cuántos presupuestos das al mes y cuántos cierras?
- ¿Cuántas visitas haces que no van a ningún sitio?
- ¿Qué necesitas saber ANTES de ir a visitar para no perder el día?
- ¿Cómo informas al cliente del avance de la obra?

**Legal**
- **Particulares** mayoritariamente. Base propia y consentimiento.
- Nunca prometer plazos ni precios automáticos sin validación humana: en obra, un precio mal dado es una reclamación.

**Prompt listo**
> Empresa de reformas, [nº] presupuestos/mes con [X]% de cierre. Prepárame el alcance priorizando cualificación previa a la visita y recuperación de presupuestos.

---

## Patrones transversales

**Los 3 dolores que se repiten en casi todos los sectores** (úsalos de gancho en frío):
1. **La llamada/mensaje que no se coge** → se lo lleva el siguiente.
2. **El presupuesto que se da y no se persigue.**
3. **El cliente que ya te compró y no vuelve** (lo más barato de recuperar y lo más olvidado).

**Regla de sector B (sin datos estructurados):** electricistas, reformas, talleres pequeños y autónomos de salud a domicilio suelen ser escenario B → o entran por **Pack Mini Core** (entrada barata) o van a **ENTERPRISE** si necesitan mini-CRM. **Nunca PRO.**

**Regla legal transversal:** si el cliente final es **particular** (dental, estética, fisio, hostelería, reformas, inmobiliaria residencial) → **nada de captación en frío**, solo base propia con consentimiento. Si es **B2B** (gestorías, abogados de empresa, flotas) → email frío defendible con identificación y baja.
