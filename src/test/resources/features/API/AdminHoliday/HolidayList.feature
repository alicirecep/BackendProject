Feature: As an administrator, I should be able to access holiday data for staff members via API connection.

  Scenario: When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials, the expected
  status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayList" path parameters
    # Api kullanicisi "api/holidayList" path parametrelerini olusturur
    * The api user saves the response returned from the api holidayList endpoint.
    # Api kullanicisi api holidayList endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular


  Scenario Outline: When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials, the information
  returned in the response body for the holiday with id(x) should be validated, including fields such as year and name.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayList" path parameters
    # Api kullanicisi "api/holidayList" path parametrelerini olusturur
    * The api user saves the response returned from the api holidayList endpoint.
    # Api kullanicisi api holidayList endpointinden donen responsei kaydeder
    * The api user verifies the information of the data at index <dataIndex> in the response body, including "<year>" and "<name>".
    # API kullanıcı response body icindeki <dataIndex> indexe sahip olanin "<year>" ve "<name>" bilgilerini doğrular.

    Examples:
      | dataIndex | year | name            |
      | 4         | 2024 | christmas       |
      | 6         | 2024 | Ramadan Holiday |


  Scenario: When a GET request is sent to the /api/holidayList endpoint with invalid authorization credentials, the expected
  status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayList" path parameters
    # Api kullanicisi "api/holidayList" path parametrelerini olusturur
    * The api user saves the response returned from the api holidayList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api holidayList endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
