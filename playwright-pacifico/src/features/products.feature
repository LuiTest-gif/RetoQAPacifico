Feature: Gestión de productos en Sauce Demo

  Como usuario de Sauce Demo
  Quiero agregar productos al carrito
  Para poder realizar una compra

  Background:
    Given que estoy en la página de login de Sauce Demo

  @products @positive
  Scenario: Agregar un producto y visualizarlo en el carrito
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    And agrego el primer producto al carrito
    Then el contador del carrito debería mostrar "1"
    When abro el carrito de compras
    Then debería visualizar el carrito
    And debería visualizar el producto "Sauce Labs Backpack" en el carrito
