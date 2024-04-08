Feature: As an administrator, I want to access the details of the Refund&Reason with the specified ID number via the
  API connection.

  Scenario Outline: When a GET request body containing valid authorization information and the refund&reason ID to access detailed
  information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 200 and the
  message information in the response body should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api refundReasonDetails endpoint.
    # Api kullanicisi get request gonderir ve api refundReasonDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 2  |
      | 3  |


  Scenario Outline: When a GET request body containing valid authorization information and the refund&reason ID to access detailed
  information is sent to the /api/refundReasonDetails endpoint, the data (id, reason, created_at, update_at) in the
  returned response body should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api refundReasonDetails endpoint.
    # Api kullanicisi get request gonderir ve api refundReasonDetails endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <id>, "<reason>", "<created_at>", "<updated_at>" in the response body.
    # API kullanicisi response bodydeki data <id>, "<reason>", "<created_at>", "<updated_at>"  içeriklerini doğrular.

    Examples:
      | id | id | reason              | created_at                  | updated_at                  |
      | 2  | 2  | Product defactive   | 2024-01-22T23:19:00.000000Z | 2024-01-22T23:19:00.000000Z |
      | 3  | 3  | Order wrong product | 2024-01-22T23:19:00.000000Z | 2024-01-22T23:19:00.000000Z |


  Scenario Outline: When a GET request containing valid authorization information and an incorrect (non-existent in the system)
  refund&reason ID is sent to the /api/refundReasonDetails endpoint, the returned status code should be 404,
  and the message information should be validated as "refund Reason  not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    * The api user prepares a GET request containing the refund reason <id> that are not present in the system to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin sistemde bulunmayan refund reason idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api refundReasonDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 256 |


  Scenario Outline: When a GET request body containing invalid authorization information and the refund&reason ID to access
  detailed information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 401,
  and the message information in the response body should be validated as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api refundReasonDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 2  |
