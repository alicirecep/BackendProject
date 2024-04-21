Feature: As an administrator, I want to be able to access the state information registered in the system with the
  specified country_id via the API connection.

  Scenario Outline: When a GET request body containing valid authorization credentials and the desired country id to
  access state information is sent to the /api/profile/countryStates endpoint, the returned status code should be
  validated as 200, and the message information in the response body should confirm as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/countryStates" path parameters
    # APi kullanicisi "api/profile/countryStates" path parametrelerini olusturur
    * The api user prepares a GET request containing the country <id> for which state information is to be accessed to send to the api profile countryStates endpoint.
    # Api kullanicisi api profile countryStates endpointine gondermek icin state bilgilerine erisilmek istenen country idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api profile countryStates endpoint.
    # Api kullanicisi get request gonderir ve api profile countryStates endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id  |
      | 223 |


  Scenario Outline: When a GET request body containing valid authorization credentials and a country_id of 223 is sent
  to the /api/profile/countryStates endpoint, the returned response body should be validated to confirm that the state
  with an ID number of 3669 has the "name" attribute as "Ankara".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/countryStates" path parameters
    # APi kullanicisi "api/profile/countryStates" path parametrelerini olusturur
    * The api user prepares a GET request containing the country <id> for which state information is to be accessed to send to the api profile countryStates endpoint.
    # Api kullanicisi api profile countryStates endpointine gondermek icin state bilgilerine erisilmek istenen country idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api profile countryStates endpoint.
    # Api kullanicisi get request gonderir ve api profile countryStates endpointinden donen responsei kaydeder
    * The api user verifies the "<name>" information of the state with the id '3669' in the response body.
    # API kullanıcısi response body icindeki idsi 3669 olan statein "<name>" bilgisini doğrular.

    Examples:
      | id  | name   |
      | 223 | Ankara |


  Scenario Outline: When a GET request body containing valid authorization credentials and an incorrect
  (not found in the system) country id is sent to the /api/profile/countryStates endpoint, the returned
  status code should be validated as 404, and the message information in the response body should confirm
  as "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/countryStates" path parameters
    # APi kullanicisi "api/profile/countryStates" path parametrelerini olusturur
    * The api user prepares a GET request containing the country <id> that do not exist in the system to send to the api profile countryStates endpoint.
    # Api kullanicisi api profile countryStates endpointine gondermek icin sistemde bulunmayan country idsini iceren bir get request hazirlar
    * The api user records the response from the api profile countryStates endpoint, confirming that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile countryStates endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id    |
      | 21456 |


  Scenario Outline: When a GET request body containing invalid authorization credentials and the desired country id to
  access state information is sent to the /api/profile/countryStates endpoint, the returned status code should be
  validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/countryStates" path parameters
    # APi kullanicisi "api/profile/countryStates" path parametrelerini olusturur
    * The api user prepares a GET request containing the country <id> for which state information is to be accessed to send to the api profile countryStates endpoint.
    # Api kullanicisi api profile countryStates endpointine gondermek icin state bilgilerine erisilmek istenen country idsini iceren bir get request hazirlar
    * The api user records the response from the api profile countryStates endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile countryStates endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 223 |

