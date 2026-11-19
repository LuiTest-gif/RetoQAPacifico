@usuarios @post @crear
Feature: Registrar usuarios

  Background:
    * url baseUrl
    * def creationSchema = read('classpath:schemas/creacion-schema.json')

  @positivo
  Scenario: Registrar un usuario con datos válidos
    * def suffix = java.util.UUID.randomUUID() + ''
    * def requestBody = read('classpath:requests/crear-usuario.json')
    * set requestBody.email = 'crear.' + suffix + '@example.com'
    Given path 'usuarios'
    And request requestBody
    When method post
    Then status 201
    And match response == creationSchema
    And match response.message == 'Cadastro realizado com sucesso'
    * def userId = response._id
    * call read('classpath:helpers/eliminar-usuario.feature')

  @negativo
  Scenario: Rechazar un correo que ya está registrado
    * def created = call read('classpath:helpers/crear-usuario.feature')
    Given path 'usuarios'
    And request created.user
    When method post
    Then status 400
    And match response.message == 'Este email já está sendo usado'
    * def userId = created.userId
    * call read('classpath:helpers/eliminar-usuario.feature')

  @negativo @outline
  Scenario Outline: Rechazar un usuario con correo inválido
    * def requestBody = read('classpath:requests/crear-usuario.json')
    * def correoPrueba = <correo>
    * set requestBody.email = correoPrueba
    * if (correoPrueba == null) karate.remove('requestBody', '$.email')
    Given path 'usuarios'
    And request requestBody
    When method post
    Then status 400
    And match response.email == '<mensajeApi>'

    Examples:
      | correo             | mensajeApi                      |
      | null               | email é obrigatório             |
      | 'correo-invalido'  | email deve ser um email válido  |
