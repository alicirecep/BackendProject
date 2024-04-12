Feature: As an administrator, I want to be able to access the city information registered in the system with
  the specified state_id via the API connection.

  Scenario Outline: When a GET request body containing valid authorization credentials and the desired state_id to access
  city information is sent to the /api/profile/stateCities endpoint, the returned status code should be validated as 200,
  and the message information in the response body should confirm as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/stateCities" path parameters
    * The api user prepares a GET request containing the state <id> to access city information for the api profile stateCities endpoint.
    # Api kullanicisi api profile stateCities endpointine gondermek icin city bilgilerine erisilmek istenen state_idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile stateCities endpoint.
    # Api kullanicisi get request gonderir ve api profile stateCities endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id   |
      | 3669 |


  Scenario Outline: When a GET request body containing valid authorization credentials and a state_id of 3669 is sent to the
  /api/profile/stateCities endpoint, the returned response body should be validated to confirm that the city with an ID number
  of 40325 has the "name" attribute as "Kizilcahamam".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/stateCities" path parameters
    * The api user prepares a GET request containing the state <id> to access city information for the api profile stateCities endpoint.
    # Api kullanicisi api profile stateCities endpointine gondermek icin city bilgilerine erisilmek istenen state_idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile stateCities endpoint.
    # Api kullanicisi get request gonderir ve api profile stateCities endpointinden donen responsei kaydeder
    * The api user verifies the "<name>" information of the city with the id '40325' in the response body.
    # API kullanıcısi response body icindeki idsi 40325 olan cityin "<name>" bilgisini doğrular.


    Examples:
      | id   | name         |
      | 3669 | Kizilcahamam |


  Scenario Outline: When a GET request body containing valid authorization credentials and an incorrect
  (not found in the system) state_id is sent to the /api/profile/stateCities endpoint, the returned status
  code should be validated as 404, and the message information in the response body should confirm
  as "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/stateCities" path parameters
    * The api user prepares a GET request containing the non-existent state <id> to send to the api profile stateCities endpoint.
    # Api kullanicisi api profile stateCities endpointine gondermek icin sistemde bulunmayan state_id sini iceren bir get request hazirlar
    * The api user records the response from the api profile stateCities endpoint, confirming that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile stateCities endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id   |
      | 5526 |


  Scenario Outline: When a GET request body containing invalid authorization credentials and the desired state_id to
  access city information is sent to the /api/profile/stateCities endpoint, the returned status code should be
  validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/stateCities" path parameters
    * The api user prepares a GET request containing the state <id> to access city information for the api profile stateCities endpoint.
    # Api kullanicisi api profile stateCities endpointine gondermek icin city bilgilerine erisilmek istenen state_idsini iceren bir get request hazirlar
    * The api user records the response from the api profile stateCities endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile stateCities endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id   |
      | 3669 |


