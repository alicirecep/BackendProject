Feature: As an administrator, I want to be able to update department information with the specified ID number
  via the API connection.

  Scenario Outline: When a PATCH request body containing valid authorization information, the department ID to be updated, and
  necessary data (name, details, status) is sent to the /api/departmentUpdate/{id} endpoint, the returned status
  code should be 202, and the message information in the response body should be verified as
  "department updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentUpdate/<id>" path parameters
    # APi kullanicisi "api/departmentUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<name>", "<details>" and <status> data to send to the api departmentUpdate endpoint.
    # Api kullanicisi api departmentUpdate endpointine gondermek icin "<name>", "<details>" ve <status> verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and records the response returned from the api departmentUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api departmentUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "department updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "department updated successfully" oldugunu dogrular

    Examples:
      | id | name      | details              | status |
      | 16 | Marketing | Marketing Department | 1      |


  Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect (non-existent in the
  system) department ID, along with necessary data (name, details, status), is sent to the /api/departmentUpdate/{id} endpoint,
  the returned status code should be 404, and the message information in the response body should be verified as
  "department not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentUpdate/<id>" path parameters
    # APi kullanicisi "api/departmentUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<name>", "<details>" and <status> data to send to the api departmentUpdate endpoint.
    # Api kullanicisi api departmentUpdate endpointine gondermek icin "<name>", "<details>" ve <status> verilerini iceren bir patch request hazirlar
    * The api user records the response returned from the api departmentUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api departmentUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  | name      | details              | status |
      | 254 | Marketing | Marketing Department | 1      |


  Scenario Outline: When a PATCH request body containing invalid authorization information, along with the department ID to be
  updated and necessary data (name, details, status), is sent to the /api/departmentUpdate/{id} endpoint, the
  returned status code should be 401, and the message information in the response body should be verified as
  "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departmentUpdate/<id>" path parameters
    # APi kullanicisi "api/departmentUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<name>", "<details>" and <status> data to send to the api departmentUpdate endpoint.
    # Api kullanicisi api departmentUpdate endpointine gondermek icin "<name>", "<details>" ve <status> verilerini iceren bir patch request hazirlar
    * The api user records the response returned from the api departmentUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api departmentUpdate endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id | name      | details              | status |
      | 16 | Marketing | Marketing Department | 1      |


  Scenario Outline: The updated_Id information in the response body from the /api/departmentUpdate/{id} endpoint should be
  verified to be identical to the id path parameter specified in the /api/departmentUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentUpdate/<id>" path parameters
    # APi kullanicisi "api/departmentUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the "<name>", "<details>" and <status> data to send to the api departmentUpdate endpoint.
    # Api kullanicisi api departmentUpdate endpointine gondermek icin "<name>", "<details>" ve <status> verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and records the response returned from the api departmentUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api departmentUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the returned response body matches the id specified in the endpoints path parameter.
    # Api kullanicisi donen response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular

    Examples:
      | id | name      | details              | status |
      | 16 | Marketing | Marketing Department | 1      |


  Scenario Outline: The update of the desired department record via the API should be confirmed from the API itself.
  (The update of the record can be verified by sending a GET request to the /api/departmentDetails endpoint with
  the updated_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> to access their details from the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin detaylarina erisilmek istenen department idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api departmentDetails endpoint.
    # Api kullanicisi get request gonderir ve api departmentDetails endpointinden donen responsei kaydeder
    * The api user confirms that the name information in the response body is "<nameValue>".
    # API kullanicisi response bodydeki name bilgisinin "<nameValue>" olduğunu doğrular.


    Examples:
      | id | nameValue |
      | 16 | Marketing |


