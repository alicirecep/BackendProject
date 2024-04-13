Feature: As an administrator, I want to be able to delete the address information of the customer with the specified
  ID number via the API connection.

  Scenario Outline: When a DELETE request body containing valid authorization information and the address ID to be deleted
  is sent to the /api/profile/deleteAddress endpoint, the returned status code should be 202, and the message in the
  response body should confirm that it is "address deleted successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/deleteAddress" path parameters
    # APi kullanicisi "api/profile/deleteAddress" path parametrelerini olusturur
    * The api user prepares a delete request containing the address <id> to be deleted to send to the api profile deleteAddress endpoint.
    # Api kullanicisi api profile deleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user sends a delete request and records the response from the api profile deleteAddress endpoint.
    # Api kullanicisi delete request gonderir ve api profile deleteAddress endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address deleted successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address deleted successfully" oldugunu dogrular

    Examples:
      | id  |
      | 175 |


  Scenario Outline: When a DELETE request body containing valid authorization information and an incorrect
  (non-existent in the system) address ID is sent to the /api/profile/deleteAddress endpoint, the returned
  status code should be 404, and the message in the response body should confirm that it is "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/deleteAddress" path parameters
    # APi kullanicisi "api/profile/deleteAddress" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the address <id> that are not present in the system to send to the api profile deleteAddress endpoint.
    # Api kullanicisi api profile deleteAddress endpointine gondermek icin sistemde bulunmayan address idsini iceren bir delete request hazirlar
    * The api user records the response from the api profile deleteAddress endpoint, confirming that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile deleteAddress endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 874 |


  Scenario Outline: When a DELETE request body containing invalid authorization information and the address ID to be
  deleted is sent to the /api/profile/deleteAddress endpoint, the returned status code should be 401, and the message
  in the response body should confirm that it is "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/deleteAddress" path parameters
    # APi kullanicisi "api/profile/deleteAddress" path parametrelerini olusturur
    * The api user prepares a delete request containing the address <id> to be deleted to send to the api profile deleteAddress endpoint.
    # Api kullanicisi api profile deleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user saves the response from the api profile deleteAddress endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile deleteAddress endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 175 |


  Scenario Outline: The Deleted_Id information in the response body returned from the /api/profile/deleteAddress endpoint
  should be verified to be the same as the id information in the DELETE request body sent to the /api/profile/deleteAddress
  endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/deleteAddress" path parameters
    # APi kullanicisi "api/profile/deleteAddress" path parametrelerini olusturur
    * The api user prepares a delete request containing the address <id> to be deleted to send to the api profile deleteAddress endpoint.
    # Api kullanicisi api profile deleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user sends a delete request and records the response from the api profile deleteAddress endpoint.
    # Api kullanicisi delete request gonderir ve api profile deleteAddress endpointinden donen responsei kaydeder
    * The api user verifies that the Deleted id in the response body matches the id information in the request body.
    # Api kullanicisi donen response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugu dogrular

    Examples:
      | id  |
      | 175 |

  @API
  Scenario Outline: The deletion of the address record should be verified through the API.
  (The deletion of the record can be confirmed by sending a GET request to the /api/profile/addressDetails endpoint
  with the Deleted_Id obtained from the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the Deleted <id> to send to the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin sildiği Deleted Idyi iceren bir get request hazirlar
    * The api user records the response returned from the api profile addressDetails endpoint and verifies that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile addressDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 175 |


