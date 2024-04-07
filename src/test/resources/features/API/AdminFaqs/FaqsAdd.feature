Feature: As an administrator, I want to be able to create a new FAQ record via API connection

  Scenario: When a POST request containing valid authorization credentials and necessary information (title, description) is
  sent to the /api/faqsAdd endpoint, the expected status code returned should be 201, and the message in the
  response body should confirm: "Faqs added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsAdd" path parameters
    # APi kullanicisi "api/faqsAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the necessary information to send to the api faqsAdd endpoint.
    # Api kullanicisi api faqsAdd endpointine gondermek icin gerekli bilgileri iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api faqsAdd endpoint.
    # Api kullanicisi post request gonderir ve api faqsAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Faqs added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "Faqs added successfully" oldugunu dogrular


  Scenario Outline: The creation of the new FAQ record via the API should be verified through the API itself.
  (The creation of the record can be verified by sending a GET request to the /api/faqsDetails endpoint with the
  added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GET request containing the FAQ <id> for which details are to be accessed, to send to the api faqsDetails endpoint.
    # Api kullanicisi api faqsDetails endpointine gondermek icin detaylarina erisilmek istenen faqs idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api faqsDetails endpoint.
    # Api kullanicisi get request gonderir ve api faqsDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 17 |


  Scenario: When a POST request containing invalid authorization credentials and necessary information (title, description)
  is sent to the /api/faqsAdd endpoint, the expected status code returned should be 401, and the message in the
  response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/faqsAdd" path parameters
    # APi kullanicisi "api/faqsAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the necessary information to send to the api faqsAdd endpoint.
    # Api kullanicisi api faqsAdd endpointine gondermek icin gerekli bilgileri iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api faqsAdd endpoint.
    # Api kullanicisi post request gonderir ve api faqsAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular