Feature: Utilidad para crear un usuario de prueba

  Scenario: Crear usuario con datos dinámicos
    * def suffix = java.util.UUID.randomUUID() + ''
    * def nome = karate.get('nome', 'Usuario QA ' + suffix.substring(0, 8))
    * def email = karate.get('email', 'qa.' + suffix + '@example.com')
    * def password = karate.get('password', 'Qa123456')
    * def administrador = karate.get('administrador', 'false')
    * def user = { nome: '#(nome)', email: '#(email)', password: '#(password)', administrador: '#(administrador)' }
    Given url baseUrl
    And path 'usuarios'
    And request user
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'
    * def userId = response._id
