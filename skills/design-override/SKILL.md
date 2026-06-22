---
name: design-override
description: >
  ACTIVAR SIEMPRE en cualquier demo, landing o web 
  visual de WhiteMoon antes de escribir una sola 
  línea de código. Anula los patrones de diseño 
  por defecto de Claude. Triggers: demo, landing, 
  hero, web, diseño, visual, frontend, sector, cliente.
---

# WhiteMoon Design Override

## ANTES DE ESCRIBIR CÓDIGO — VERIFICAR

1. ¿Este layout se parece a algo que haría Claude por defecto? → Cámbialo
2. ¿Hay cards simétricas icono+título+descripción? → Elimínalas
3. ¿El hero es texto centrado con gradiente? → No. Nunca.
4. ¿Uso Tailwind con clases genéricas? → CSS custom con variables propias

## PROHIBIDO

- Layout centrado simétrico
- Cards icono+título+descripción en grid
- Gradiente azul-morado en hero
- system-ui como fuente
- Fondo blanco genérico
- Animaciones bounce/pulse genéricas
- 3 columnas de servicios iguales
- Sombras en todo
- Botones con gradiente genérico

## OBLIGATORIO

- Tipografía con carácter (Sora, Cormorant, Space Grotesk)
- Contraste de pesos extremo (200 vs 700)
- Texto fantasma decorativo (opacity 0.04-0.08)
- Números grandes como elementos gráficos (80-120px)
- Asimetría intencional en al menos una sección
- Fondo oscuro (#08080d o similar)
- Hero con vídeo o 3D — nunca imagen estática
- Palabra rotatoria o elemento animado en hero
- Scroll reveal con stagger
- Cursor personalizado en desktop
- Stats en glassmorphism

## NIVEL DE REFERENCIA

Debe estar al nivel de:
linear.app · vercel.com · resend.com · stripe.com · framer.com

NO al nivel de:
plantilla WordPress · shadcn sin modificar · tailwind template

## CHECKLIST ANTES DE ENTREGAR

- [ ] Layout diferente a cualquier template de Tailwind UI
- [ ] Al menos 2 elementos visuales no textuales
- [ ] Hero no es texto centrado con fondo liso
- [ ] Tipografía tiene personalidad propia
- [ ] Animaciones sutiles y con propósito
- [ ] Diseño comunica el sector específico del cliente
- [ ] Asimetría intencional en al menos una sección
