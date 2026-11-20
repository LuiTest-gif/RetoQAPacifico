@usuarios @crud @e2e @positivo
Feature: Flujo completo de gestión de usuarios

  Scenario: Crear, consultar, actualizar y eliminar un usuario
    * url baseUrl
    * def created = call read('classpath:helpers/crear-usuario.feature')

    Given path 'usuarios', created.userId
    When method get
    Then status 200
    And match response.email == created.user.email

    * def newEmail = 'crud.' + java.util.UUID.randomUUID() + '@example.com'
    * def updateBody = { nome: 'Usuario CRUD Actualizado', email: '#(newEmail)', password: 'Qa987654', administrador: 'true' }
    Given path 'usuarios', created.userId
    And request updateBody
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

    Given path 'usuarios', created.userId
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

    Given path 'usuarios', created.userId
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'
