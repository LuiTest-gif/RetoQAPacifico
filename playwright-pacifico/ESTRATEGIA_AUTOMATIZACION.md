# Estrategia de automatización

## Objetivo

Automatizar los criterios de aceptación del flujo de compra de Sauce Demo, desde el inicio de sesión hasta la confirmación del pedido, incluyendo escenarios positivos y negativos.

## Enfoque

Se utiliza BDD con Cucumber y escenarios redactados en Gherkin para que las pruebas sean comprensibles tanto para perfiles técnicos como funcionales. Playwright controla el navegador y TypeScript aporta tipado estático y mayor mantenibilidad.

## Patrón de diseño

Se aplicó Page Object Model (POM). Cada página concentra sus localizadores y acciones, mientras que los step definitions conectan el lenguaje de negocio de los archivos feature con esas páginas. Esto evita duplicación y permite modificar un selector en un solo lugar.

## Estrategia de locators

Los elementos se identifican mediante los locators recomendados por Playwright:

- `getByRole` para botones y encabezados.
- `getByPlaceholder` para campos de formulario sin una etiqueta asociada.
- `getByText` para contenido visible.
- `getByTestId` como contrato explícito cuando no existe una alternativa semántica estable.

Sauce Demo utiliza el atributo `data-test`, configurado como test ID de Playwright. Se evitan selectores CSS y XPath ligados a la estructura interna del DOM.

## Técnicas de diseño de pruebas

- Partición de equivalencia: credenciales válidas, inválidas y usuario bloqueado.
- Happy path y unhappy path: compra correcta y validación de errores.
- Transición de estados: login, productos, carrito, checkout, resumen y confirmación.

## Cobertura

- Inicio de sesión exitoso.
- Usuario bloqueado.
- Credenciales inválidas.
- Agregar y visualizar un producto en el carrito.
- Compra completa.
- Checkout sin datos obligatorios.

## Evidencias

Cucumber genera reportes HTML y JSON en `reports/`. Cuando un escenario falla, el hook adjunta una captura de pantalla al reporte.
