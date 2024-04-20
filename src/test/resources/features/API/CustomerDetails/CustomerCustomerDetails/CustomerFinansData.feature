Feature: As a user, I should be able to access the financial information of the customer via API connection.

  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization credentials,
  the expected status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    # Api kullanicisi "api/profile/get-customer-data" path parametrelerini olusturur
    * The api user saves the response returned from the api profile get customer data endpoint.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular


  Scenario Outline: When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization credentials,
  the data returned in the response body (wallet_running_balance, wallet_pending_balance, total_coupon, total_wishlist,
  total_cancel_order) should be validated.

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    # Api kullanicisi "api/profile/get-customer-data" path parametrelerini olusturur
    * The api user saves the response returned from the api profile get customer data endpoint.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder
    * The api user verifies the content of the data <wallet_running_balance>, <wallet_pending_balance>, <total_coupon>, <total_wishlist>, <total_cancel_order> in the response body.
    # API kullanicisi response bodydeki data <wallet_running_balance>, <wallet_pending_balance>, <total_coupon>, <total_wishlist>, <total_cancel_order> içeriklerini doğrular.

    Examples:
      | wallet_running_balance | wallet_pending_balance | total_coupon | total_wishlist | total_cancel_order |
      | 0                      | 0                      | 0            | 0              | 0                  |


  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with invalid authorization credentials,
  the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/get-customer-data" path parameters
    # Api kullanicisi "api/profile/get-customer-data" path parametrelerini olusturur
    * The api user saves the response returned from the api profile get customer data endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile get customer data endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


