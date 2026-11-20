# Estrategia de automatización

## Objetivo

Validar la gestión de usuarios de ServeRest mediante pruebas automatizadas de API construidas con Karate DSL.

## Enfoque

La suite cubre las operaciones CRUD de `/usuarios`: listar, registrar, buscar por ID, actualizar y eliminar. Cada endpoint tiene su propio feature para facilitar mantenimiento, trazabilidad y ejecución selectiva mediante etiquetas.

## Organización y reutilización

- `features/usuarios`: escenarios por endpoint y flujo CRUD integrado.
- `helpers`: creación y eliminación reutilizable de usuarios.
- `requests`: cuerpos JSON base.
- `schemas`: contratos JSON reutilizables.
- `karate-config.js`: URL base y configuración por ambiente.

Esta separación cumple una función equivalente a un patrón de capas: los escenarios describen el comportamiento, mientras que configuración, datos, contratos y utilidades se mantienen fuera de ellos.

## Técnicas de diseño

- Partición de equivalencia: solicitudes válidas e inválidas.
- Happy path y unhappy path: respuesta esperada y manejo de errores.
- Transición de estados: usuario inexistente, creado, consultado, actualizado y eliminado.
- Pruebas de contrato: validación de tipos y estructura JSON.
- Esquema de escenario: reutilización del flujo de validación de correo con distintos ejemplos.

## Datos de prueba

Cada usuario utiliza un correo basado en UUID. Esto evita conflictos con ejecuciones anteriores y permite que la suite sea independiente. Los escenarios eliminan sus datos cuando corresponde.

## Validaciones

- Código HTTP.
- Mensajes funcionales.
- Identificadores generados.
- Valores enviados y recibidos.
- Esquemas JSON.

Los nombres de escenarios, variables y documentación están escritos en español. Los nombres de campos y mensajes en portugués se mantienen únicamente cuando son parte de la respuesta original de ServeRest y deben validarse sin alteraciones.

## Reportería

Karate genera reportes HTML en `target/karate-reports/` y Surefire genera resultados adicionales en `target/surefire-reports/`.
