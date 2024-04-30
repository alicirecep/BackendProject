Feature: As an administrator, I want to add a new holiday record for staff via API connection.

  Scenario Outline: When a valid authorization information and necessary holiday data (year, name, date) are sent in the POST body
  to the /api/holidayAdd endpoint, it should be verified that the returned status code is 201 and the message information
  in the response body is "holiday added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters
    # APi kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<year>", "<name>", and "<date>" data to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api holidayAdd endpoint.
    # Api kullanicisi post request gonderir ve api holidayAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "holiday added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "holiday added successfully" oldugunu dogrular

    Examples:
      | year | name                       | date       |
      | 2024 | 29 Ekim Cumhuriyet Bayramı | 2024-10-29 |


  Scenario Outline: The creation of the new holiday record via the API should be verified through the API itself.
  (The creation of the new holiday record can be confirmed by sending a GET request to the /api/holidayDetails
  endpoint with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayDetails" path parameters
    # APi kullanicisi "api/holidayDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the holiday <id> for which details are to be accessed, to send to the api holidayDetails endpoint.
    # Api kullanicisi api holidayDetails endpointine gondermek icin detaylarina erisilmek istenen holiday idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api holidayDetails endpoint.
    # Api kullanicisi get request gonderir ve api holidayDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id |
      | 44 |


  Scenario Outline: When a POST request containing valid authorization credentials and holiday data (year, name, date) already
  existing in the system is sent to the /api/holidayAdd endpoint, the expected status code returned should be 400,
  and the message in the response body should confirm: "dublicate holiday request".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters
    # APi kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the registered "<year>", "<name>", and "<date>" data to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin sisteme kayitli "<year>", "<name>" ve "<date>" verilerini iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api holidayAdd endpoint.
    # Api kullanicisi post request gonderir ve api holidayAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 400
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the message information in the response body is "dublicate holiday request"
    # Api kullanicisi response bodydeki message bilgisinin "dublicate holiday request" oldugunu dogrular

    Examples:
      | year | name                       | date       |
      | 2024 | 29 Ekim Cumhuriyet Bayramı | 2024-10-29 |


  Scenario Outline: When a POST request containing invalid authorization credentials and holiday data (year, name, date) is sent to
  the /api/holidayAdd endpoint, the expected status code returned should be 401, and the message in the
  response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/holidayAdd" path parameters
    # APi kullanicisi "api/holidayAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<year>", "<name>", and "<date>" data to send to the api holidayAdd endpoint.
    # Api kullanicisi api holidayAdd endpointine gondermek icin "<year>", "<name>" ve "<date>" verilerini iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api holidayAdd endpoint.
    # Api kullanicisi post request gonderir ve api holidayAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | year | name                       | date       |
      | 2024 | 29 Ekim Cumhuriyet Bayramı | 2024-10-29 |