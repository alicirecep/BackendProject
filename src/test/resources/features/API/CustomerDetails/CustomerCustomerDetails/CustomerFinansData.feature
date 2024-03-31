Feature: As a user, I should be able to access the financial information of the customer via API connection.

  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization credentials,
  the expected status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user saves the response returned from the api profile get customer data endpoint.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization credentials,
  the data returned in the response body (wallet_running_balance, wallet_pending_balance, total_coupon, total_wishlist,
  total_cancel_order) should be validated.

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user saves the response returned from the api profile get customer data endpoint.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder
    * The api user verifies the data in the response body returned from the api profile get customer data endpoint.
    # API kullanıcı api profile get customer data endpointinden donen response bodydeki datalari doğrular.


  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with invalid authorization credentials,
  the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user saves the response returned from the api profile get customer data endpoint and confirms that the status code is '401' and the message is Unauthorized.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder, status codeun '401' ve message bilgisinin Unauthorized oldugunu dogrular


