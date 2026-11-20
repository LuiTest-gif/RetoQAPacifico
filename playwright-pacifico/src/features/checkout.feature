Feature: Completar compra en Sauce Demo

  Como usuario de Sauce Demo
  Quiero completar una compra
  Para confirmar mi pedido

  Background:
    Given que estoy en la página de login de Sauce Demo

  @checkout @positive
  Scenario: Completar una compra exitosamente
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    And agrego el primer producto al carrito
    And abro el carrito de compras
    And ingreso al proceso de checkout
    And ingreso mis datos de compra
    And continúo con el resumen de la compra
    And finalizo la compra
    Then debería visualizar la confirmación de compra

  @checkout @negative
  Scenario: Intentar continuar el checkout sin ingresar los datos obligatorios
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    And agrego el primer producto al carrito
    And abro el carrito de compras
    And ingreso al proceso de checkout
    And continúo con el resumen de la compra
    Then debería visualizar un mensaje de error en el checkout
