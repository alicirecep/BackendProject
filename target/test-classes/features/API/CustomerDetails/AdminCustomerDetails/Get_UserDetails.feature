Feature: As an administrator, I should be able to access detailed information of the user with the
  specified id number via API connection.

  Scenario Outline: When a GET request containing valid authorization credentials and the customer id data for the desired
  detailed information is sent to the /api/get-user endpoint, the expected status code returned should be 200,
  and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-user" path parameters
    * The api user prepares a GET request containing the customer "<id>" for which details are to be accessed, to send to the api get User endpoint.
    # Api kullanicisi api get user endpointine gondermek icin detaylarina erisilmek istenen customer idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api get User endpoint.
    # Api kullanicisi get request gonderir ve api get user endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id  |
      | 217 |


  Scenario Outline: When a GET request containing valid authorization credentials and the customer id data for the desired
  detailed information is sent to the /api/get-user endpoint, the user information returned in the response body
  (id, first_name, last_name, username, role_id, email, is_verified, is_active, lang_code, currency_id,
  currency_code, name) should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-user" path parameters
    * The api user prepares a GET request containing the customer "<id>" for which details are to be accessed, to send to the api get User endpoint.
    # Api kullanicisi api get user endpointine gondermek icin detaylarina erisilmek istenen customer idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api get User endpoint.
    # Api kullanicisi get request gonderir ve api get user endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <id>, "<first_name>", "<last_name>", <role_id>, "<email>", <is_verified>, <is_active>, "<lang_code>", <currency_id>, "<currency_code>", "<name>" in the response body.
    # API kullanicisi response bodydeki data <id>, "<first_name>", "<last_name>", <role_id>, "<email>", <is_verified>, <is_active>, "<lang_code>", <currency_id>, "<currency_code>", "<name>" içeriklerini doğrular.

    Examples:
      | id  | id  | first_name  | last_name | role_id | email                           | is_verified | is_active | lang_code | currency_id | currency_code | name                 |
      | 217 | 217 | aleynadilan | ciftcier  | 4       | dilannciftcier@buysellcycle.com | 0           | 1         | en        | 2           | USD           | aleynadilan ciftcier |


  Scenario: When a GET request containing valid authorization credentials and incorrect customer id data is sent to the
  /api/get-user endpoint, the expected status code returned should be 404, and the message in the response
  body should confirm: "user not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-user" path parameters
    * The api user prepares a GET request containing the incorrect customer id to send to the api get User endpoint.
    # Api kullanicisi api get user endpointine gondermek icin yanlis customer idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api get User endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api get user endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario Outline: When a GET request containing invalid authorization credentials and the customer id data for the desired
  detailed information is sent to the /api/get-user endpoint, the expected status code returned should be 401,
  and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/get-user" path parameters
    * The api user prepares a GET request containing the customer "<id>" for which details are to be accessed, to send to the api get User endpoint.
    # Api kullanicisi api get user endpointine gondermek icin detaylarina erisilmek istenen customer idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api get User endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api get user endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 217 |





