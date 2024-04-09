Feature: As an administrator, I want to be able to access detailed information about the department with the specified ID number
  via the API connection.

  Scenario Outline: When a GET request body containing valid authorization information and the department ID to access detailed
  information is sent to the /api/departmentDetails endpoint, the returned status code should be 200, and the
  message information should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> to access their details from the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin detaylarina erisilmek istenen department idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api departmentDetails endpoint.
    # Api kullanicisi get request gonderir ve api departmentDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 14 |


  Scenario Outline: When a GET request body containing valid authorization information and the department ID to access detailed
  information is sent to the /api/departmentDetails endpoint, the data (id, name ,details, status, cerated_at,
  updated_at) in the returned response body should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> to access their details from the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin detaylarina erisilmek istenen department idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response returned from the api departmentDetails endpoint.
    # Api kullanicisi get request gonderir ve api departmentDetails endpointinden donen responsei kaydeder
    * The api user verifies that the content of the response body includes the data <id>, "<name>", "<details>", <status>, "<created_at>" and "<updated_at>".
    # API kullanicisi response bodydeki data <id>, "<name>", "<details>", <status>, "<created_at>", "<updated_at>"  içeriklerini doğrular.


    Examples:
      | id | id | name      | details              | status | created_at                  | updated_at                  |
      | 14 | 14 | Marketing | Marketing Department | 1      | 2024-04-09T10:25:47.000000Z | 2024-04-09T10:25:47.000000Z |


  Scenario Outline: When a GET request body containing valid authorization information and an incorrect (non-existent in the system)
  department ID is sent to the /api/departmentDetails endpoint, the returned status code should be 404, and the
  message information should be verified as "department not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> that are not present in the system to send to the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin sistemde bulunmayan department idsini iceren bir get request hazirlar
    * The api user records the response returned from the api departmentDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api departmentDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 548 |


  Scenario Outline: When a GET request body containing invalid authorization information and the department ID to access detailed
  information is sent to the /api/departmentDetails endpoint, the returned status code should be 401, and the
  message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the department <id> to access their details from the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin detaylarina erisilmek istenen department idsini iceren bir get request hazirlar
    * The api user records the response returned from the api departmentDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api departmentDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


    Examples:
      | id |
      | 14 |

