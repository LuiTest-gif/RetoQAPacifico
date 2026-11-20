# Reto de Automatización QA BackEnd

Suite automatizada para la API de Usuarios de [ServeRest](https://serverest.dev/), implementada con Java, Maven y Karate DSL.

## Tecnologías

- Java 21
- Maven 3.9+
- Karate DSL 1.5.2
- JUnit 5
- Gherkin

## Prerrequisitos

- JDK 21 configurado en `JAVA_HOME`.
- Maven disponible mediante el comando `mvn`.
- Conexión a internet para utilizar el ambiente público.

## Instalación y ejecución

```bash
mvn clean test
```

Ejecutar por etiqueta:

```bash
mvn test -Dkarate.options="--tags @usuarios"
mvn test -Dkarate.options="--tags @get"
mvn test -Dkarate.options="--tags @post"
mvn test -Dkarate.options="--tags @put"
mvn test -Dkarate.options="--tags @delete"
mvn test -Dkarate.options="--tags @positivo"
mvn test -Dkarate.options="--tags @negativo"
mvn test -Dkarate.options="--tags @crud"
```

## Ambientes

Por defecto se usa `https://serverest.dev`. Para ejecutar contra ServeRest local:

```bash
npx serverest@latest
mvn test -Dkarate.env=local
```

## Endpoints cubiertos

| Método | Endpoint | Cobertura |
|---|---|---|
| GET | `/usuarios` | Listado, esquema y filtro por correo |
| POST | `/usuarios` | Registro válido, correo repetido, ausente y con formato inválido |
| GET | `/usuarios/{_id}` | Usuario existente e inexistente |
| PUT | `/usuarios/{_id}` | Actualización válida y correo inválido |
| DELETE | `/usuarios/{_id}` | Eliminación válida e ID inexistente |

También se incluye un escenario E2E que crea, consulta, actualiza, elimina y confirma la eliminación de un usuario.

## Estructura

```text
src/test/java/runners/           Runner JUnit
src/test/resources/
  features/usuarios/             Escenarios por endpoint
  helpers/                       Utilidades reutilizables
  requests/                      Cuerpos JSON base
  schemas/                       Esquemas de respuesta
  karate-config.js               Configuración por ambiente
```

## Reportes

Después de ejecutar la suite, abra:

```text
target/karate-reports/karate-summary.html
```

## Consideraciones

- El ambiente público limpia sus datos periódicamente.
- Los correos se generan con UUID para evitar duplicados.
- Los datos creados por las pruebas se eliminan cuando corresponde.
- ServeRest devuelve algunos campos y mensajes en portugués. Las aserciones los conservan textualmente porque forman parte del contrato real de la API.
- `target/` no se incluye en Git.

La estrategia, patrones y técnicas de prueba se explican en [ESTRATEGIA_AUTOMATIZACION.md](ESTRATEGIA_AUTOMATIZACION.md).
