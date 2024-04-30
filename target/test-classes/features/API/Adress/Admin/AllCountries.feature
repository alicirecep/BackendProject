Feature: As an administrator, I want to be able to access all the country information registered in the system
  via the API connection.

  Scenario: When a GET request body containing valid authorization credentials is sent to the /api/profile/allCountries
  endpoint, the returned status code should be validated as 200, and the message information in the response body should
  confirm as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/allCountries" path parameters
    # APi kullanicisi "api/profile/allCountries" path parametrelerini olusturur
    * The api user saves the response returned from the api profile allCountries endpoint.
    # Api kullanicisi api profile allCountries endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular


  Scenario Outline: When a GET request body containing valid authorization credentials is sent to the
  /api/profile/allCountries endpoint, the returned response body should be validated to confirm that the
  country with an ID of 223 has the following attributes: "code": "TR" and "name": "Turkey".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/allCountries" path parameters
    # APi kullanicisi "api/profile/allCountries" path parametrelerini olusturur
    * The api user saves the response returned from the api profile allCountries endpoint.
    # Api kullanicisi api profile allCountries endpointinden donen responsei kaydeder
    * The api user verifies the "<code>" and "<name>" information of the country with the id '223' in the response body.
    # API kullanıcısi response body icindeki idsi 223 olan ülkenin "<code>" ve "<name>" bilgilerini doğrular.

    Examples:
      | code | name   |
      | TR   | Turkey |


  Scenario: When a GET request body containing invalid authorization credentials is sent to the
  /api/profile/allCountries endpoint, the returned status code should be validated as 401, and the
  message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/allCountries" path parameters
    # APi kullanicisi "api/profile/allCountries" path parametrelerini olusturur
    * The api user records the response from the api profile allCountries endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile allCountries endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

