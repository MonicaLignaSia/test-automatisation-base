@TestAllMarvelCharacters
Feature: Test de API Personajes Marvel

    Background:
        * def base_url = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api'
        * configure ssl = true

    @id:1 @getAllCharactersMarvel
    Scenario: T-API-BTFAC-123-CA01- Obtener Todos los Personajes Marvel
        Given url base_url + '/characters'
        When method GET
        Then status 200
        And print response
        