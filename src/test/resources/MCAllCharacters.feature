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
             
    @id:4 @CreateCharacter
    Scenario: T-API-BTFAC-123-CA04- Crear Personaje
        Given url base_url + 'characters'
        And header Content-Type = 'application/json'
        And def character = read('classpath:../payloads/newCharacter.json')
        And request character
        When method POST
        Then status 201
        And print response
        And match response.name == 'SuperMan'
        Examples:
            | read('classpath:../data/datacharacter.csv') |

    @id:5 @UpdateCharacter
    Scenario Outline: T-API-BTFAC-123-CA05- Actualizar Personaje
        Given url base_url + 'characters/' + idCharacter
        * print idCharacter
        And header Content-Type = 'application/json'
        And def character = read('classpath:../payloads/UpdateData.json')
        And request character
        When method PUT
        Then status 200
        And print response
        And match response.name == 'Batman'
        Examples:
            | read('classpath:../dataCharacterID.csv') |
  
 