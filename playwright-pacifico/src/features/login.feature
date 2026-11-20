Feature: Login en Sauce Demo

  Como usuario de Sauce Demo
  Quiero poder iniciar sesión
  Para acceder a los productos

  Background:
    Given que estoy en la página de login de Sauce Demo

  @login @positive
  Scenario: Inicio de sesión exitoso con usuario estándar
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería visualizar la página de productos

  @login @negative
  Scenario: Inicio de sesión fallido con usuario bloqueado
    When ingreso el usuario "locked_out_user"
    And ingreso la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería visualizar un mensaje de usuario bloqueado

  @login @negative
  Scenario: Inicio de sesión fallido con credenciales inválidas
    When ingreso el usuario "standard_user"
    And ingreso la contraseña "contraseña_incorrecta"
    And hago clic en el botón de login
    Then debería visualizar un mensaje de credenciales inválidas
