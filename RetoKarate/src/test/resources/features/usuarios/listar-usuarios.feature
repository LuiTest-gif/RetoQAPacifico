@usuarios @get @listar
Feature: Listar usuarios registrados

  Background:
    * url baseUrl
    * def userSchema = read('classpath:schemas/usuario-schema.json')

  @positivo
  Scenario: Obtener la lista de usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And match response == { quantidade: '#number', usuarios: '#[]' }
    And match each response.usuarios == userSchema

  @positivo
  Scenario: Filtrar usuarios por correo
    * def created = call read('classpath:helpers/crear-usuario.feature')
    Given path 'usuarios'
    And param email = created.email
    When method get
    Then status 200
    And match response.quantidade == 1
    And match response.usuarios[0].email == created.email
    * def userId = created.userId
    * call read('classpath:helpers/eliminar-usuario.feature')
