Feature: As an administrator, I want to be able to delete department information with the specified ID
  number via the API connection.

  Scenario Outline: When a DELETE body containing valid authorization information and the department ID to be deleted is sent to
  the /api/departmentDelete endpoint, the returned status code should be 202, and the message information in the
  response body should be verified as "department deleted successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDelete" path parameters
    # APi kullanicisi "api/departmentDelete" path parametrelerini olusturur
    * The api user prepares a delete request containing the department <id> to be deleted and sends it to the api departmentDelete endpoint.
    # Api kullanicisi api departmentDelete endpointine gondermek icin silinmek istenen department idsini iceren bir delete request hazirlar
    * The api user sends the delete request and records the response returned from the api departmentDelete endpoint.
    # Api kullanicisi delete request gonderir ve api departmentDelete endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "department deleted successfully"
    # Api kullanicisi response bodydeki message bilgisinin "department deleted successfully" oldugunu dogrular

    Examples:
      | id |
      | 18 |


  Scenario Outline: When a DELETE body containing valid authorization information and an incorrect (non-existent in the system)
  department ID is sent to the /api/departmentDelete endpoint, the returned status code should be 404, and the
  message information in the response body should be verified as "department not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDelete" path parameters
    # APi kullanicisi "api/departmentDelete" path parametrelerini olusturur
    * The api user prepares a delete request containing the department <id> that are not present in the system and sends it to the api departmentDelete endpoint.
    # Api kullanicisi api departmentDelete endpointine gondermek icin sistemde bulunmayan department idsini iceren bir delete request hazirlar
    * The api user records the response from the api departmentDelete endpoint and verifies that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api departmentDelete endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 548 |


  Scenario Outline: When a DELETE body containing invalid authorization information and the department ID to be deleted is sent to
  the /api/departmentDelete endpoint, the returned status code should be 401, and the message information in the
  response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departmentDelete" path parameters
    # APi kullanicisi "api/departmentDelete" path parametrelerini olusturur
    * The api user prepares a delete request containing the department <id> to be deleted and sends it to the api departmentDelete endpoint.
    # Api kullanicisi api departmentDelete endpointine gondermek icin silinmek istenen department idsini iceren bir delete request hazirlar
    * The api user records the response from the api departmentDelete endpoint and verifies that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api departmentDelete endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 18 |


  Scenario Outline: The Deleted_Id information in the response body from the /api/departmentDelete endpoint should be verified to
  be identical to the id information in the DELETE request body sent to the /api/departmentDelete endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDelete" path parameters
    # APi kullanicisi "api/departmentDelete" path parametrelerini olusturur
    * The api user prepares a delete request containing the department <id> to be deleted and sends it to the api departmentDelete endpoint.
    # Api kullanicisi api departmentDelete endpointine gondermek icin silinmek istenen department idsini iceren bir delete request hazirlar
    * The api user sends the delete request and records the response returned from the api departmentDelete endpoint.
    # Api kullanicisi delete request gonderir ve api departmentDelete endpointinden donen responsei kaydeder
    * The api user verifies that the Deleted id in the response body matches the id information in the request body.
    # Api kullanicisi donen response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugu dogrular


    Examples:
      | id |
      | 18 |


  Scenario Outline: The deletion of the department record via the API should be validated from the API itself.
  (The deletion of the record can be confirmed by sending a GET request to the /api/departmentDetails endpoint
  with the Deleted_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the Deleted <id> to access the department details via the api departmentDetails endpoint.
    # Api kullanicisi api departmentDetails endpointine gondermek icin sildiği Deleted Idyi iceren bir get request hazirlar
    * The api user records the response returned from the api departmentDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api departmentDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id |
      | 18 |


