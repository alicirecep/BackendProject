Feature: As an administrator, I want to be able to access the FAQ's list via API connection.

  Scenario: When a GET request containing valid authorization credentials is sent to the /api/faqsList endpoint, the expected
  status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsList" path parameters
    # Api kullanicisi "api/faqsList" path parametrelerini olusturur
    * The api user saves the response returned from the api faqsList endpoint.
    # Api kullanicisi api faqsList endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular


  Scenario Outline: When a GET request containing valid authorization credentials is sent to the /api/faqsList endpoint, the
  information returned in the response body for the FAQ with id(x) should be validated, including the (title)
  information.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/faqsList" path parameters
    # Api kullanicisi "api/faqsList" path parametrelerini olusturur
    * The api user saves the response returned from the api faqsList endpoint.
    # Api kullanicisi api faqsList endpointinden donen responsei kaydeder
    * The api user verifies the "<title>" information of the data at index <dataIndex> in the response body.
    # API kullanıcı response body icindeki <dataIndex> indexe sahip olanin "<title>" bilgisini doğrular.

    Examples:
      | dataIndex | title                                |
      | 1         | How do I know when my order is here? |


  Scenario: When a GET request containing invalid authorization credentials is sent to the /api/faqsList endpoint, the
  expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/faqsList" path parameters
    # Api kullanicisi "api/faqsList" path parametrelerini olusturur
    * The api user saves the response returned from the api faqsList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api faqsList endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


