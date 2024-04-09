Feature: As an administrator, I want to be able to add a new department record via the API connection.

  Scenario Outline: When a POST body containing valid authorization information and necessary data (name, details, status) is sent
  to the /api/departmentAdd endpoint, the returned status code should be 201, and the message information in the
  response body should be verified as "department added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentAdd" path parameters
    # APi kullanicisi "api/departmentAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<details>" and <status> information to send to the api departmentAdd endpoint.
    # Api kullanicisi api departmentAdd endpointine gondermek icin "<name>", "<details>" ve <status> bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response returned from the api departmentAdd endpoint.
    # Api kullanicisi post request gonderir ve api departmentAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "department added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "department added successfully" oldugunu dogrular

    Examples:
      | name      | details              | status |
      | Marketing | Marketing Department | 1      |
      | HR        | HR Department        | 2      |


  Scenario Outline: The creation of the new department record via the API should be verified from the API itself.
  (The creation of the record can be confirmed by sending a GET request to the /api/departmentDetails endpoint
  with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> to access their details from the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin detaylarina erisilmek istenen department idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api departmentDetails endpoint.
    # Api kullanicisi get request gonderir ve api departmentDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 15 |
      | 16 |


  Scenario Outline: When a POST body containing invalid authorization information and necessary data (name, details, status) is
  sent to the /api/departmentAdd endpoint, the returned status code should be 401, and the message information
  in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departmentAdd" path parameters
    # APi kullanicisi "api/departmentAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<details>" and <status> information to send to the api departmentAdd endpoint.
    # Api kullanicisi api departmentAdd endpointine gondermek icin "<name>", "<details>" ve <status> bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response returned from the api departmentAdd endpoint.
    # Api kullanicisi post request gonderir ve api departmentAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular


    Examples:
      | name      | details              | status |
      | Marketing | Marketing Department | 1      |


