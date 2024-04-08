Feature: As an administrator, I want to be able to delete the record specified by the FAQ's id via the API connection.

  Scenario Outline: When a DELETE request containing valid authorization credentials and the FAQ's id to be deleted is sent to the
  /api/faqsDelete endpoint, the expected status code returned should be 202, and the message in the response
  body should confirm: "faqs deleted successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDelete" path parameters
    # APi kullanicisi "api/faqsDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the FAQ <id> to be deleted to send to the api faqsDelete endpoint.
    # Api kullanicisi api faqsDelete endpointine gondermek icin silinmek istenen faqs idsini iceren bir delete request hazirlar
    * The api user sends the DELETE request and saves the response returned from the api faqsDelete endpoint.
    # Api kullanicisi delete request gonderir ve api faqsDelete endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "faqs deleted successfully"
    # Api kullanicisi response bodydeki message bilgisinin "faqs deleted successfully" oldugunu dogrular

    Examples:
      | id |
      | 22 |


  Scenario Outline: When a DELETE request containing valid authorization credentials and an incorrect (non-existent in the system)
  FAQ's id is sent to the /api/faqsDelete endpoint, the expected status code returned should be 404, and the
  message in the response body should confirm: "faqs not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDelete" path parameters
    # APi kullanicisi "api/faqsDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the FAQ <id> that are not present in the system to send to the api faqsDelete endpoint.
    # Api kullanicisi api faqsDelete endpointine gondermek icin sistemde bulunmayan faqs idsini iceren bir delete request hazirlar
    * The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api faqsDelete endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id   |
      | 2222 |


  Scenario Outline: When a DELETE request containing invalid authorization credentials and the FAQ's id to be deleted is sent to
  the /api/faqsDelete endpoint, the expected status code returned should be 401, and the message in the response
  body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/faqsDelete" path parameters
    # APi kullanicisi "api/faqsDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the FAQ <id> to be deleted to send to the api faqsDelete endpoint.
    # Api kullanicisi api faqsDelete endpointine gondermek icin silinmek istenen faqs idsini iceren bir delete request hazirlar
    * The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api faqsDelete endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 22 |


  Scenario Outline: The Deleted_Id information returned in the response body from the /api/faqsDelete endpoint should be verified to
  be identical to the id information contained in the DELETE request body sent to the /api/faqsDelete endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDelete" path parameters
    # APi kullanicisi "api/faqsDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the FAQ <id> to be deleted to send to the api faqsDelete endpoint.
    # Api kullanicisi api faqsDelete endpointine gondermek icin silinmek istenen faqs idsini iceren bir delete request hazirlar
    * The api user sends the DELETE request and saves the response returned from the api faqsDelete endpoint.
    # Api kullanicisi delete request gonderir ve api faqsDelete endpointinden donen responsei kaydeder
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.
    # Api kullanicisi response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugu dogrular

    Examples:
      | id |
      | 22 |


  Scenario Outline: The deletion of the desired FAQ record via the API should be verified within the API itself.
  (The deletion of the record can be verified by sending a GET request to the /api/faqsDetails endpoint with the
  Deleted_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GET request containing the Deleted <id> to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin sildiği Deleted Idyi iceren bir get request hazirlar
    * The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api faqsDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id |
      | 22 |