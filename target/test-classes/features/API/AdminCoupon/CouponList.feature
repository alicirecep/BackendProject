Feature: As an administrator, I want to be able to access coupon information via the API connection.
  @API
  Scenario: When a GET request body containing valid authorization information is sent to the /api/coupon/couponList endpoint,
  the returned status code should be 200, and the message information should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponList" path parameters
    * The api user saves the response returned from the api coupon couponList endpoint.
    # Api kullanicisi api coupon couponList endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario Outline: When a GET request body containing valid authorization information is sent to the /api/coupon/couponList
  endpoint, the information returned in the response body for the coupon with ID 'x' should be validated, including
  the fields title, coupon_code, start_date, end_date.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponList" path parameters
    * The api user saves the response returned from the api coupon couponList endpoint.
    # Api kullanicisi api coupon couponList endpointinden donen responsei kaydeder
    * The api user verifies the "<title>", "<coupon_code>", "<start_date>" and "<end_date>" information of the item at the <dataIndex> index in the response body.
    # API kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<title>", "<coupon_code>", "<start_date>" ve "<end_date>" bilgilerini doğrular.


    Examples:
      | dataIndex | title     | coupon_code | start_date | end_date   |
      | 0         | New User  | New2024CBO  | 2024-02-04 | 2024-09-01 |
      | 7         | Alisveris | 741852963   | 2024-03-29 | 2024-05-11 |


  Scenario: When a GET request body containing invalid authorization information is sent to the /api/coupon/couponList
  endpoint, the returned status code should be 401, and the message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/couponList" path parameters
    * The api user saves the response returned from the api coupon couponList endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api coupon couponList endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
