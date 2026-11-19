@usuarios @put @actualizar
Feature: Actualizar usuarios

  Background:
    * url baseUrl

  @positivo
  Scenario: Actualizar un usuario existente
    * def created = call read('classpath:helpers/crear-usuario.feature')
    * def suffix = java.util.UUID.randomUUID() + ''
    * def updateBody = read('classpath:requests/actualizar-usuario.json')
    * set updateBody.email = 'actualizado.' + suffix + '@example.com'
    Given path 'usuarios', created.userId
    And request updateBody
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'
    Given path 'usuarios', created.userId
    When method get
    Then status 200
    And match response.nome == updateBody.nome
    And match response.email == updateBody.email
    * def userId = created.userId
    * call read('classpath:helpers/eliminar-usuario.feature')

  @negativo
  Scenario: Rechazar una actualización con correo inválido
    * def created = call read('classpath:helpers/crear-usuario.feature')
    * def updateBody = read('classpath:requests/actualizar-usuario.json')
    * set updateBody.email = 'correo-invalido'
    Given path 'usuarios', created.userId
    And request updateBody
    When method put
    Then status 400
    And match response.email == 'email deve ser um email válido'
    * def userId = created.userId
    * call read('classpath:helpers/eliminar-usuario.feature')
