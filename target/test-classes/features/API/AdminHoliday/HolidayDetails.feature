Feature: As an administrator, I should be able to access detailed information about the holiday with the
  specified id number via API connection.

  Scenario: When a GET request containing valid authorization credentials and the holiday id data for the desired detailed
  information is sent to the /api/holidayDetails endpoint, the expected status code returned should be 200, and
  the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the holiday ids for which details are to be accessed, to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin detaylarina erisilmek istenen holiday idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api holidayDetails endpoint.
    # Api kullanicisi get request gonderir ve api holidayDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

  @API
  Scenario Outline: When a GET request containing valid authorization credentials and the holiday id data for the desired detailed
  information is sent to the /api/holidayDetails endpoint, the data returned in the response body (id, year, name,
  type, date, created_at, updated_at) should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the holiday ids for which details are to be accessed, to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin detaylarina erisilmek istenen holiday idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api holidayDetails endpoint.
    # Api kullanicisi get request gonderir ve api holidayDetails endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <id>, "<year>", "<name>", <type>, "<date>", "<created_at>", "<updated_at>" in the response body.
    # API kullanicisi response bodydeki data <id>, "<year>", "<name>", <type>, "<date>", "<created_at>", "<updated_at>" içeriklerini doğrular.

    Examples:
      | id | year | name            | type | date                  | created_at                  | updated_at                  |
      | 18 | 2024 | Ramadan Holiday | 1    | 2024-04-10,2024-04-12 | 2024-03-23T19:26:18.000000Z | 2024-03-23T19:26:18.000000Z |


  Scenario: When a GET request containing valid authorization credentials and an incorrect (non-existent in the system)
  holiday id is sent to the /api/holidayDetails endpoint, the expected status code returned should be 404, and the
  message in the response body should confirm: "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the holiday ids that are not present in the system to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin sistemde bulunmayan holiday idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api holidayDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario: When a GET request containing invalid authorization credentials and the holiday id data for the desired detailed
  information is sent to the /api/holidayDetails endpoint, the expected status code returned should be 401, and
  the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the holiday ids for which details are to be accessed, to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin detaylarina erisilmek istenen holiday idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api holidayDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
