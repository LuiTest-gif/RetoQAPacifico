@usuarios @delete @eliminar
Feature: Eliminar usuarios

  Background:
    * url baseUrl

  @positivo
  Scenario: Eliminar un usuario existente y comprobar que ya no está disponible
    * def created = call read('classpath:helpers/crear-usuario.feature')
    Given path 'usuarios', created.userId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
    Given path 'usuarios', created.userId
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'

  @negativo
  Scenario: Intentar eliminar un usuario inexistente
    Given path 'usuarios', 'id-inexistente-qa'
    When method delete
    Then status 200
    And match response.message == 'Nenhum registro excluído'
