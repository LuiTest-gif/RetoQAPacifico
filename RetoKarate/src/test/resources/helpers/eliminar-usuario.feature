Feature: Utilidad para eliminar un usuario de prueba

  Scenario: Eliminar usuario por ID
    Given url baseUrl
    And path 'usuarios', userId
    When method delete
    Then status 200
