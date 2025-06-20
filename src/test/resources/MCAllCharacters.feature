@TestAllMarvelCharacters
Feature: Test de API Personajes Marvel

    Background:
        * def base_url = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/maligna/api/'
        * configure ssl = true

    @id:1 @getAllCharactersMarvel
    Scenario: T-API-BTFAC-123-CA01- Obtener Todos los Personajes Marvel
        Given url base_url + 'characters'
        When method GET
        Then status 200
        And print response

    @id:2 @GetCharacterID
    Scenario Outline: T-API-BTFAC-123-CA02- Obtener Un Personaje
        Given url base_url + 'characters/'+idCharacter 
        When method GET
        Then status 200
        And print response         
        Examples:
            | read('classpath:../data/dataCharacterID.csv') |    
    
     @id:3 @GetCharacterNotExists
    Scenario Outline: T-API-BTFAC-123-CA03- Obtener Personaje No Existente
        Given url base_url + '/characters/' + idCharacter
        When method GET
        Then status 404
        And print response        
        Examples:
            | read('classpath:../data/dataCharacterID.csv') |