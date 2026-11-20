# Reto de Automatización QA FrontEnd

Suite de pruebas automatizadas para [Sauce Demo](https://www.saucedemo.com/) desarrollada con Playwright, Cucumber y TypeScript.

## Tecnologías

- Node.js y npm
- TypeScript
- Playwright
- Cucumber
- Gherkin
- Page Object Model
- Locators semánticos de Playwright

## Prerrequisitos

- Node.js 18 o superior.
- Git.

## Instalación

```bash
npm install
npx playwright install
```

## Ejecución

```bash
# Todos los escenarios
npm test

# Por funcionalidad
npm run test:login
npm run test:products
npm run test:checkout

# Por resultado esperado
npm run test:positive
npm run test:negative

# Validar TypeScript
npm run typecheck

# Demostración visible y pausada (Windows)
npm run test:demo
```

Por defecto se ejecuta en modo headless. Para visualizar Chromium:

```bash
set HEADLESS=false && npm test
```

La URL puede cambiarse con la variable `BASE_URL`; si no se define, se utiliza `https://www.saucedemo.com/`.

El comando `npm run test:demo` abre Chromium, aplica una espera de 700 ms entre
acciones y mantiene el resultado de cada escenario visible durante 2 segundos.
Los tiempos pueden personalizarse con `SLOW_MO` y `DEMO_PAUSE`.

## Reportes

Después de ejecutar las pruebas se generan:

- `reports/cucumber-report.html`
- `reports/cucumber-report.json`

Abra el archivo HTML en un navegador para revisar escenarios, pasos y capturas adjuntas en caso de error.

## Estructura

```text
src/
  features/   Escenarios en Gherkin
  pages/      Page Objects, localizadores y acciones
  steps/      Implementación de los pasos
  support/    Hooks y ciclo de vida del navegador
```

## Escenarios cubiertos

1. Login exitoso con `standard_user`.
2. Login rechazado con `locked_out_user`.
3. Login rechazado con credenciales inválidas.
4. Agregar un producto y verificarlo en el carrito.
5. Completar una compra hasta su confirmación.
6. Intentar continuar el checkout sin datos obligatorios.

Las credenciales de prueba fueron proporcionadas por Sauce Demo. La explicación de la estrategia y las técnicas aplicadas se encuentra en [ESTRATEGIA_AUTOMATIZACION.md](ESTRATEGIA_AUTOMATIZACION.md).
