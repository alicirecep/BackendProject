Feature: As an administrator, I want to be able to delete coupon information with the specified ID number via the API connection.

  Scenario Outline: When a DELETE body containing valid authorization information and the coupon ID to be deleted is
  sent to the /api/coupon/couponDelete endpoint, the returned status code should be 202, and the message information
  in the response body should be verified as "coupon deleted successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDelete" path parameters
    # APi kullanicisi "api/coupon/couponDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the coupon <id> to be deleted to send to the api coupon couponDelete endpoint.
    # Api kullanicisi api coupon couponDelete endpointine gondermek icin silinmek istenen coupon idsini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the response returned from the api coupon couponDelete endpoint.
    # Api kullanicisi delete request gonderir ve api coupon couponDelete endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "coupon deleted successfully"
    # Api kullanicisi response bodydeki message bilgisinin "coupon deleted successfully" oldugunu dogrular

    Examples:
      | id |
      | 26 |


  Scenario Outline: When a DELETE body containing valid authorization information and an incorrect
  (non-existent in the system) coupon ID is sent to the /api/coupon/couponDelete endpoint, the returned
  status code should be 404, and the message information in the response body should be verified as "coupon not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDelete" path parameters
    # APi kullanicisi "api/coupon/couponDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the coupon <id> that is not present in the system to send to the api coupon couponDelete endpoint.
    # Api kullanicisi api coupon couponDelete endpointine gondermek icin sistemde bulunmayan coupon idsini iceren bir delete request hazirlar
    * The api user records the response from the api coupon couponDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api coupon couponDelete endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  |
      | 247 |


  Scenario Outline: When a DELETE body containing invalid authorization information and the coupon ID to be deleted is
  sent to the /api/coupon/couponDelete endpoint, the returned status code should be 401, and the message information in
  the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/coupon/couponDelete" path parameters
    # APi kullanicisi "api/coupon/couponDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the coupon <id> to be deleted to send to the api coupon couponDelete endpoint.
    # Api kullanicisi api coupon couponDelete endpointine gondermek icin silinmek istenen coupon idsini iceren bir delete request hazirlar
    * The api user records the response from the api coupon couponDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api coupon couponDelete endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 26 |


  Scenario Outline: The Deleted_Id information in the response body returned from the /api/coupon/couponDelete endpoint
  should be verified to match the id information in the DELETE request body sent to the same /api/coupon/couponDelete endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDelete" path parameters
    # APi kullanicisi "api/coupon/couponDelete" path parametrelerini olusturur
    * The api user prepares a DELETE request containing the coupon <id> to be deleted to send to the api coupon couponDelete endpoint.
    # Api kullanicisi api coupon couponDelete endpointine gondermek icin silinmek istenen coupon idsini iceren bir delete request hazirlar
    * The api user sends a DELETE request and saves the response returned from the api coupon couponDelete endpoint.
    # Api kullanicisi delete request gonderir ve api coupon couponDelete endpointinden donen responsei kaydeder
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.
    # Api kullanicisi response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugunu dogrular

    Examples:
      | id |
      | 26 |


  Scenario Outline: The deletion of the coupon record via the API should be verified from the API itself.
  (The deletion of the record can be confirmed by sending a GET request to the /api/coupon/couponDetails endpoint
  with the Deleted_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/coupon/couponDetails" path parameters
    # Api kullanicisi "api/coupon/couponDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the deleted <id> to send to the api coupon couponDetails endpoint.
    # Api kullanicisi api coupon couponDetails endpointine gondermek icin sildiği Deleted Idyi iceren bir get request hazirlar
    * The api user records the response from the api coupon couponDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api coupon couponDetails endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id |
      | 26 |

