Feature: As an administrator, I want to be able to update the information of the FAQ record with the
  specified FAQ id via API connection.

  Scenario: When a PATCH request containing valid authorization credentials, the FAQ id to be updated, and the updated
  information of the FAQ (title) is sent to the /api/faqsUpdate/{id} endpoint, the expected status code returned
  should be 202, and the message in the response body should confirm: "faqs updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsUpdate/16" path parameters
    # APi kullanicisi "api/faqsUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the title information to send to the api faqsUpdate endpoint.
    # Api kullanicisi api faqsUpdate endpointine gondermek icin title bilgisini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api faqsUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api faqsUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "faqs updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "faqs updated successfully" oldugunu dogrular


  Scenario: When a PATCH request containing valid authorization credentials, the FAQ id to be updated, and the updated
  information of the FAQ (title, description) is sent to the /api/faqsUpdate/{id} endpoint, the expected status code
  returned should be 202, and the message in the response body should confirm: "faqs updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsUpdate/18" path parameters
    # APi kullanicisi "api/faqsUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the title and description information to send to the api faqsUpdate endpoint.
    # Api kullanicisi api faqsUpdate endpointine gondermek icin title ve description bilgilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api faqsUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api faqsUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "faqs updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "faqs updated successfully" oldugunu dogrular


  Scenario: "When a PATCH request containing valid authorization credentials and an incorrect (non-existent in the system)
  FAQ id, along with the updated information of the FAQ (title, description), is sent to the /api/faqsUpdate/{id}
  endpoint, the expected status code returned should be 404, and the message in the response body should
  confirm: "faqs not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsUpdate/87" path parameters
    # APi kullanicisi "api/faqsUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the title and description information to send to the api faqsUpdate endpoint.
    # Api kullanicisi api faqsUpdate endpointine gondermek icin title ve description bilgilerini iceren bir patch request hazirlar
    * The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api faqsUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


  Scenario: When a PATCH request containing invalid authorization credentials, the FAQ id to be updated, and the updated
  information of the FAQ (title, description) is sent to the /api/faqsUpdate/{id} endpoint, the expected status code
  returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/faqsUpdate/18" path parameters
    # APi kullanicisi "api/faqsUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the title and description information to send to the api faqsUpdate endpoint.
    # Api kullanicisi api faqsUpdate endpointine gondermek icin title ve description bilgilerini iceren bir patch request hazirlar
    * The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api faqsUpdate endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


  Scenario: The updated Id information in the response body from the /api/faqsUpdate/{id} endpoint should be verified to be
  the same as the id path parameter specified in the /api/faqsUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsUpdate/18" path parameters
    # APi kullanicisi "api/faqsUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the title and description information to send to the api faqsUpdate endpoint.
    # Api kullanicisi api faqsUpdate endpointine gondermek icin title ve description bilgilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api faqsUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api faqsUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.
    # Api kullanicisi response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular


  Scenario Outline: The update of the FAQ record via the API should be verified through the API itself.
  (The update of the record can be verified by sending a GET request to the /api/faqsDetails endpoint with the
  updated Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GET request containing the FAQ <id> for which details are to be accessed, to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin detaylarina erisilmek istenen faqs idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api faqsDetails endpoint.
    # Api kullanicisi get request gonderir ve api faqsDetails endpointinden donen responsei kaydeder
    * The api user verifies that the title information in the response body is "<titleValue>".
    # API kullanicisi response bodydeki title bilgisinin "<title>" olduğunu doğrular.


    Examples:
      | id | titleValue                           |
      | 16 | How do I know when my order is here? |
      | 18 | How do I know when my order is here? |

