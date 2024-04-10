Feature: As an administrator, I want to be able to update coupon information with the specified ID number via the API connection.

  Scenario Outline: When a PATCH request body containing valid authorization information, the coupon ID to be updated,
  and necessary data (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping,
  maximum_discount, is_expire, is_multiple_buy) is sent to the /api/coupon/couponUpdate/{id} endpoint, the returned
  status code should be 202, and the message information in the response body should be verified as
  "coupon updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    # APi kullanicisi "api/coupon/couponUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api coupon couponUpdate endpoint, containing the data "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponUpdate endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the response returned from the api coupon couponUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api coupon couponUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "coupon updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "coupon updated successfully" oldugunu dogrular

    Examples:
      | id | title    | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 25 | Orderder | ordered     | 2           | 2024-04-18 | 2024-04-20 | 10       | 0             | 1                | 2                | 0         | 1               |


  Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect
  (non-existent in the system) coupon ID, along with necessary data (title, coupon_code, coupon_type, start_date,
  end_date, discount, discount_type,minimum_shopping, maximum_discount, is_expire, is_multiple_buy), is sent to
  the /api/coupon/couponUpdate/{id} endpoint, the returned status code should be 404, and the message information
  in the response body should be verified as "coupon not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    # APi kullanicisi "api/coupon/couponUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api coupon couponUpdate endpoint, containing the data "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponUpdate endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> verilerini iceren bir patch request hazirlar
    * The api user saves the response returned from the api coupon couponUpdate endpoint, confirming that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api coupon couponUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


    Examples:
      | id  | title    | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 547 | Orderder | ordered     | 2           | 2024-04-18 | 2024-04-20 | 10       | 0             | 1                | 2                | 0         | 1               |


  Scenario Outline: When a PATCH request body containing invalid authorization information, along with the coupon ID
  to be updated and necessary data (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type,
  minimum_shopping, maximum_discount, is_expire, is_multiple_buy), is sent to the /api/coupon/couponUpdate/{id} endpoint,
  the returned status code should be 401, and the message information in the response body should be verified as
  "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    # APi kullanicisi "api/coupon/couponUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api coupon couponUpdate endpoint, containing the data "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponUpdate endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> verilerini iceren bir patch request hazirlar
    * The api user saves the response returned from the api coupon couponUpdat endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api coupon couponUpdat endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id | title    | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 25 | Orderder | ordered     | 2           | 2024-04-18 | 2024-04-20 | 10       | 0             | 1                | 2                | 0         | 1               |


  Scenario Outline: The updated_Id information in the response body from the /api/coupon/couponUpdate/{id} endpoint
  should be verified to be identical to the id path parameter written in the /api/coupon/couponUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    # APi kullanicisi "api/coupon/couponUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request to send to the api coupon couponUpdate endpoint, containing the data "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire> and <is_multiple_buy>.
    # Api kullanicisi api coupon couponUpdate endpointine gondermek icin "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <is_expire>, <is_multiple_buy> verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the response returned from the api coupon couponUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api coupon couponUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the returned response body matches the id specified in the endpoints path parameter.
    # Api kullanicisi donen response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular


    Examples:
      | id | title    | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 25 | Orderder | ordered     | 2           | 2024-04-18 | 2024-04-20 | 10       | 0             | 1                | 2                | 0         | 1               |


  Scenario Outline: The update of the coupon record via the API should be verified from the API itself.
  (The update of the record can be confirmed by sending a GET request to the /api/coupon/couponDetails endpoint
  with the updated_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the details of the coupon <id> to be accessed for sending to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin detaylarina erisilmek istenen coupon idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api coupon couponDetails endpoint.
    # Api kullanicisi get request gonderir ve api coupon couponDetails endpointinden donen responsei kaydeder
    * The api user confirms that the title value in the response body is "<titleValue>".
    # API kullanicisi response bodydeki title bilgisinin "<titleValue>" olduğunu doğrular.


    Examples:
      | id | titleValue |
      | 25 | Orderder   |

