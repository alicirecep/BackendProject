Feature: As a user, I want to be able to delete the information of the address in my profile with the specified
  ID number through the API connection.

  Scenario Outline: When a DELETE body containing valid authorization credentials and the ID of the address to be
  deleted is sent to the /api/profile/customerDeleteAddress endpoint, the returned status code should be validated
  as 202, and the message information in the response body should confirm as "address deleted successfully".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    # APi kullanicisi "api/profile/customerDeleteAddress" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the address <id> to be deleted to send to the api profile customerDeleteAddress endpoint.
    # Api kullanicisi api profile customerDeleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user sends the DELETE request and records the response returned from the api profile customerDeleteAddress endpoint.
    # Api kullanicisi delete request gonderir ve api profile customerDeleteAddress endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address deleted successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address deleted successfully" oldugunu dogrular

    Examples:
      | id  |
      | 170 |


  Scenario Outline: When a DELETE body containing valid authorization credentials and an incorrect
  (non-existent in the system) address ID is sent to the /api/profile/customerDeleteAddress endpoint,
  the returned status code should be validated as 404, and the message information in the response body
  should confirm as "address not found".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    # APi kullanicisi "api/profile/customerDeleteAddress" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the address <id> that is not present in the system to send to the api profile customerDeleteAddress endpoint.
    # Api kullanicisi api profile customerDeleteAddress endpointine gondermek icin sistemde bulunmayan address idsini iceren bir delete request hazirlar
    * The api user records the response from the api profile customerDeleteAddress endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile customerDeleteAddress endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 578 |


  Scenario Outline: When a DELETE body containing invalid authorization credentials and the ID of the address to be
  deleted is sent to the /api/profile/customerDeleteAddress endpoint, the returned status code should be validated as 401,
  and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    # APi kullanicisi "api/profile/customerDeleteAddress" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the address <id> to be deleted to send to the api profile customerDeleteAddress endpoint.
    # Api kullanicisi api profile customerDeleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user records the response from the api profile customerDeleteAddress endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile customerDeleteAddress endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 170 |


  Scenario Outline: The Deleted_Id information in the response body returned from the /api/profile/customerDeleteAddress
  endpoint should be verified to match the id information in the DELETE request body sent to the same
  /api/profile/customerDeleteAddress endpoint.

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    # APi kullanicisi "api/profile/customerDeleteAddress" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the address <id> to be deleted to send to the api profile customerDeleteAddress endpoint.
    # Api kullanicisi api profile customerDeleteAddress endpointine gondermek icin silinmek istenen address idsini iceren bir delete request hazirlar
    * The api user sends the DELETE request and records the response returned from the api profile customerDeleteAddress endpoint.
    # Api kullanicisi delete request gonderir ve api profile customerDeleteAddress endpointinden donen responsei kaydeder
    * The api user verifies that the Deleted id in the response body matches the id information in the delete request body.
    # Api kullanicisi donen response body icindeki Deleted Id bilgisinin delete request body icindeki id bilgisi ile ayni oldugu dogrular

    Examples:
      | id  |
      | 170 |


  Scenario Outline: The deletion of the address record via the API should be confirmed through the API itself.
  (The Deleted_Id returned in the response body can be used to send a GET request to the /api/profile/customerDetailsAddress
  endpoint to confirm that the record has been deleted.)

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the Deleted <id> to send to the api profile customerDetailsAddress endpoint.
    # Api kullanicisi api profile customerDetailsAddress endpointine gondermek icin sildiği Deleted Idyi iceren bir get request hazirlar
    * The api user records the response from the api profile customerDetailsAddress endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile customerDetailsAddress endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 170 |


