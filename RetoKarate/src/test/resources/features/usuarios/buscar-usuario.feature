@usuarios @get @buscar
Feature: Buscar un usuario por ID

  Background:
    * url baseUrl

  @positivo
  Scenario: Buscar un usuario existente
    * def created = call read('classpath:helpers/crear-usuario.feature')
    Given path 'usuarios', created.userId
    When method get
    Then status 200
    And match response.nome == created.user.nome
    And match response.email == created.user.email
    And match response._id == created.userId
    * def userId = created.userId
    * call read('classpath:helpers/eliminar-usuario.feature')

  @negativo
  Scenario: Buscar un usuario inexistente
    # ServeRest exige que el ID tenga exactamente 16 caracteres alfanumericos.
    Given path 'usuarios', 'AAAAAAAAAAAAAAAA'
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'
