Feature: As an administrator, I want to be able to create a new coupon record via the API connection.

  Scenario Outline: When a POST body containing valid authorization information and necessary data (title, coupon_code,
  coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy)
  is sent to the /api/coupon/couponAdd endpoint, the returned status code should be 201, and the message information in the
  response body should be verified as "coupon added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponAdd" path parameters
    # APi kullanicisi "api/coupon/couponAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api coupon couponAdd endpoint, containing the information "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponAdd endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> ve <is_multiple_buy> bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the response returned from the api coupon couponAdd endpoint.
    # Api kullanicisi post request gonderir ve api coupon couponAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "coupon added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "coupon added successfully" oldugunu dogrular

    Examples:
      | title         | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | Attemt Coupon | attemt      | 2           | 2024-04-15 | 2024-04-17 | 10       | 0             | 1                | 2                | 0         | 1               |


  Scenario Outline: The creation of the new coupon record via the API should be verified from the API itself.
  (The creation of the record can be confirmed by sending a GET request to the /api/coupon/couponDetails endpoint with
  the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the details of the coupon <id> to be accessed for sending to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin detaylarina erisilmek istenen coupon idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api coupon couponDetails endpoint.
    # Api kullanicisi get request gonderir ve api coupon couponDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id |
      | 24 |


  Scenario Outline: When a POST body containing invalid authorization information and necessary data (title,
  coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount,
  is_expire, is_multiple_buy) is sent to the /api/coupon/couponAdd endpoint, the returned status code should be
  401, and the message information in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/couponAdd" path parameters
    # APi kullanicisi "api/coupon/couponAdd" path parametrelerini olusturur
    * The api user prepares a POST request to send to the api coupon couponAdd endpoint, containing the information "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponAdd endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> ve <is_multiple_buy> bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the response returned from the api coupon couponAdd endpoint.
    # Api kullanicisi post request gonderir ve api coupon couponAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | title         | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | Attemt Coupon | attemt      | 2           | 2024-04-15 | 2024-04-17 | 10       | 0             | 1                | 2                | 0         | 1               |



