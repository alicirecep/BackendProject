Feature: As an administrator, I want to be able to access the details of the FAQ with the specified id number via API connection.

  Scenario Outline: When a GET request containing valid authorization credentials and the id of the FAQ to be accessed is sent to
  the /api/faqsDetails endpoint, the expected status code returned should be 200, and the message in the response
  body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    # Api kullanicisi "api/faqsDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the FAQ <id> for which details are to be accessed, to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin detaylarina erisilmek istenen faqs idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api faqsDetails endpoint.
    # Api kullanicisi get request gonderir ve api faqsDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id |
      | 2  |
      | 4  |


  Scenario Outline: When a GET request containing valid authorization credentials and the id of the FAQ to be accessed is sent to
  the /api/faqsDetails endpoint, the data returned in the response body (id, user_id, title, description, status,
  created_at, updated_at) should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    # Api kullanicisi "api/faqsDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the FAQ <id> for which details are to be accessed, to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin detaylarina erisilmek istenen faqs id iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api faqsDetails endpoint.
    # Api kullanicisi get request gonderir ve api faqsDetails endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <id>, "<title>", "<description>", <status>, "<created_at>", "<updated_at>" in the response body.
    # API kullanicisi response bodydeki data <id>, "<title>", "<description>", <status>, "<created_at>", "<updated_at>"  içeriklerini doğrular.

    Examples:
      | id | id | title                                | description                                                                 | status | created_at                  | updated_at                  |
      | 2  | 2  | How do I know when my order is here? | A representative will call you                                              | 1      | 2024-01-22T23:18:58.000000Z | 2024-01-22T23:18:58.000000Z |
      | 4  | 4  | What if the item is out of stock?    | We hold our own inventory in our warehouses, so we rarely run out of stock. | 1      | 2024-01-22T23:18:58.000000Z | 2024-01-22T23:18:58.000000Z |


  Scenario Outline: When a GET request containing valid authorization credentials and an incorrect (non-existent in the system)
  FAQ's id is sent to the /api/faqsDetails endpoint, the expected status code returned should be 404, and the
  message in the response body should confirm: "Faqs not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    # Api kullanicisi "api/faqsDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the FAQ <id> that are not present in the system to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin sistemde bulunmayan faqs idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api faqsDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 256 |


  Scenario Outline: When a GET request containing invalid authorization credentials and the id of the FAQ to be accessed is sent to
  the /api/faqsDetails endpoint, the expected status code returned should be 401, and the message in the response body should
  confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    # Api kullanicisi "api/faqsDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the FAQ <id> for which details are to be accessed, to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin detaylarina erisilmek istenen faqs idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api faqsDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 2  |
