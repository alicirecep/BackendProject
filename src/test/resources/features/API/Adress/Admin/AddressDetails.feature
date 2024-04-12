Feature: As an administrator, I want to be able to access the address information of a customer with a
  specified ID number via the API connection.

  Scenario Outline: When a GET request body containing valid authorization credentials and the desired address id to
  access detailed information is sent to the /api/profile/addressDetails endpoint, the returned status code should be
  validated as 200, and the message information in the response body should confirm as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile addressDetails endpoint.
    # Api kullanicisi get request gonderir ve api profile addressDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id  |
      | 171 |


  Scenario Outline: When a GET request body containing valid authorization credentials and the desired address id to
  access detailed information is sent to the /api/profile/addressDetails endpoint, the data returned in the response
  body should be validated. This data should include fields such as id, customer_id, name, email, phone, address,
  city, state, country, postal_code, is_shipping_default, is_billing_default, created_at, updated_at.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile addressDetails endpoint.
    # Api kullanicisi get request gonderir ve api profile addressDetails endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <id>, <customer_id>, "<name>", "<email>", "<phone>", "<address>", "<city>", "<state>", "<country>", "<postal_code>", <is_shipping_default>, <is_billing_default>, "<created_at>" and "<updated_at>" in the response body.
    # API kullanicisi response bodydeki data <id>, <customer_id>, "<name>", "<email>", "<phone>", "<address>", "<city>", "<state>", "<country>", "<postal_code>", <is_shipping_default>, <is_billing_default>, "<created_at>" ve "<updated_at>"  içeriklerini doğrular.

    Examples:
      | id  | id  | customer_id | name  | email           | phone     | address      | city  | state | country | postal_code | is_shipping_default | is_billing_default | created_at                  | updated_at                  |
      | 171 | 171 | 217         | Dilan | dilan@gmail.com | 547895562 | Tokat merkez | Almus | Tokat | Turkey  | 38000       | 0                   | 0                  | 2024-04-11T18:23:58.000000Z | 2024-04-11T18:23:58.000000Z |


  Scenario Outline: When a GET request body containing valid authorization credentials and an incorrect
  (non-existent in the system) address id is sent to the /api/profile/addressDetails endpoint, the returned
  status code should be validated as 404, and the message information in the response body should confirm
  as "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the non-existent address <id> to send to the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin sistemde bulunmayan address idsini iceren bir get request hazirlar
    * The api user records the response returned from the api profile addressDetails endpoint and verifies that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile addressDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 587 |


  Scenario Outline: When a GET request body containing invalid authorization credentials and the desired address id to
  access detailed information is sent to the /api/profile/addressDetails endpoint, the returned status code should be
  validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user saves the response from the api profile addressDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile addressDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 171 |


