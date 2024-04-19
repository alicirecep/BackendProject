Feature: As an administrator, I want to be able to update holiday information for the specified id number via API connection.

  Scenario Outline: When a PATCH request containing valid authorization credentials, the holiday id to be updated, and the updated
  holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, the expected status code
  returned should be 202, and the message in the response body should confirm: "holiday updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/<id>" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<year>", "<name>" and "<date>" data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api holidayUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "holiday updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "holiday updated successfully" oldugunu dogrular

    Examples:
      | id | year | name   | date       |
      | 78 | 2027 | Bayram | 2027-01-01 |


  Scenario Outline: When a PATCH request containing valid authorization credentials, an incorrect (non-existent in the system)
  holiday id, and the updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, the
  expected status code returned should be 404, and the message in the response body should confirm:
  "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/<id>" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<year>", "<name>" and "<date>" data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir patch request hazirlar
    * The api user saves the response from the api holidayUpdate endpoint and verifies that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api holidayUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id   | year | name   | date       |
      | 2547 | 2027 | Bayram | 2027-01-01 |


  Scenario Outline: When a PATCH request containing invalid authorization credentials, the holiday id to be updated, and the
  updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, the expected status
  code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/<id>" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<year>", "<name>" and "<date>" data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir patch request hazirlar
    * The api user saves the response returned from the api holidayUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api holidayUpdate endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id | year | name   | date       |
      | 78 | 2027 | Bayram | 2027-01-01 |


  Scenario Outline: The updated_Id information in the response body returned from the /api/holidayUpdate/{id} endpoint should be
  verified to be the same as the id path parameter specified in the /api/holidayUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/<id>" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<year>", "<name>" and "<date>" data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api holidayUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.
    # Api kullanicisi response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular

    Examples:
      | id | year | name   | date       |
      | 78 | 2027 | Bayram | 2027-01-01 |


  Scenario Outline: The update of the holiday record via the API should be confirmed through the API itself.
  (The update of the record can be verified by sending a GET request to the /api/holidayDetails endpoint with the
  updated_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the holiday <id> for which details are to be accessed, to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin detaylarina erisilmek istenen holiday idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api holidayDetails endpoint.
    # Api kullanicisi get request gonderir ve api holidayDetails endpointinden donen responsei kaydeder
    * The api user verifies that the name information in the response body is "<nameValue>".
    # API kullanicisi response bodydeki name bilgisinin "<nameValue>" olduğunu doğrular.

    Examples:
      | id | nameValue |
      | 78 | Bayram    |




