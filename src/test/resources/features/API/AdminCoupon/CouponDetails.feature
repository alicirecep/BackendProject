Feature: As an administrator, I want to be able to access the details of the coupon with the specified ID number via the API connection.

  Scenario Outline: When a GET request body containing valid authorization information and the coupon ID to access
  details is sent to the /api/coupon/couponDetails endpoint, the returned status code should be 200, and the message
  information should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the details of the coupon <id> to be accessed for sending to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin detaylarina erisilmek istenen coupon idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api coupon couponDetails endpoint.
    # Api kullanicisi get request gonderir ve api coupon couponDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id |
      | 9  |
      | 21 |


  Scenario Outline: When a GET request body containing valid authorization information and the coupon ID to access
  details is sent to the /api/coupon/couponDetails endpoint, the data (id, title ,coupon_code, coupon_type, start_date,
  end_date, discount, discount_type, minimum_shopping, maximum_discount, created_by, updated_by, is_expire, is_multiple_buy,
  multiple_buy_limit, created_at, updated_at ) returned in the response body should be validated.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the details of the coupon <id> to be accessed for sending to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin detaylarina erisilmek istenen coupon idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api coupon couponDetails endpoint.
    # Api kullanicisi get request gonderir ve api coupon couponDetails endpointinden donen responsei kaydeder
    * The api user verifies the contents of the data in the response body, including the <id>, "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <created_by>, <updated_by>, <is_expire>, <is_multiple_buy>, "<created_at>" and "<updated_at>" fields.
    # API kullanicisi response bodydeki data <id>, "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <created_by>, <updated_by>, <is_expire>, <is_multiple_buy>, "<created_at>", "<updated_at>"  içeriklerini doğrular.

    Examples:
      | id | id | title       | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | created_by | updated_by | is_expire | is_multiple_buy | created_at                  | updated_at                  |
      | 9  | 9  | Urun kuponu | 321321321   | 1           | 2024-03-25 | 2024-04-23 | 20       | 0             | 79         | 79         | 0         | 1               | 2024-03-25T10:19:25.000000Z | 2024-03-25T10:23:33.000000Z |


  Scenario Outline: When a GET request body containing valid authorization information and an incorrect (non-existent
  in the system) coupon ID is sent to the /api/coupon/couponDetails endpoint, the returned status code should be 404,
  and the message information should be verified as "coupon not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the nonexistent coupon <id> to send to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin sistemde bulunmayan coupon idsini iceren bir get request hazirlar
    * The api user records the response from the api coupon couponDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api coupon couponDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 587 |


  Scenario Outline: When a GET request body containing invalid authorization information and the coupon ID to access
  details is sent to the /api/coupon/couponDetails endpoint, the returned status code should be 401, and the message
  information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the details of the coupon <id> to be accessed for sending to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin detaylarina erisilmek istenen coupon idsini iceren bir get request hazirlar
    * The api user records the response from the api coupon couponDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api coupon couponDetails endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 9  |


