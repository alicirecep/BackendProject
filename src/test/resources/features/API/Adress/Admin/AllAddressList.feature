Feature: As an administrator, I want to be able to access all customer addresses registered in the system via the API connection.

  Scenario: When a GET request body containing valid authorization credentials is sent to the /api/profile/allAddressList
  endpoint, the returned status code should be validated as 200, and the message information in the response body should
  confirm as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user records the response from the api profile allAddressList endpoint.
    # Api kullanicisi api profile allAddressList endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario Outline: When a GET request body containing valid authorization credentials is sent to the
  /api/profile/allAddressList endpoint, the information returned in the response body for the entry with
  id (x) should be validated. This includes fields such as customer_id, name,email, phone, address, city,
  state, country, postal_code.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user records the response from the api profile allAddressList endpoint.
    # Api kullanicisi api profile allAddressList endpointinden donen responsei kaydeder
    * The api user verifies the information of the item at the <dataIndex> index in the response body, including <customer_id>, "<name>", "<email>", "<phone>", "<address>", "<city>", "<state>", "<country>" and "<postal_code>".
    # API kullanıcısi response body icindeki <dataIndex> indexe sahip olanin <customer_id>, "<name>", "<email>", "<phone>", "<address>", "<city>", "<state>", "<country>" ve "<postal_code>" bilgilerini doğrular.

    Examples:
      | dataIndex | customer_id | name     | email               | phone        | address       | city  | state | country | postal_code |
      | 2         | 7           | Oske     | oske.work@gmail.com | 5555555555   | Switzerland   | 39378 | 3438  | 212     | 71190       |
      | 3         | 2           | Customer | customer@gmail.com  | 015236987412 | New York City | 48019 | 3956  | 231     | 15289       |


  Scenario: When a GET request body containing invalid authorization credentials is sent to the /api/profile/allAddressList
  endpoint, the returned status code should be validated as 401, and the message information in the response body should
  confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user records the response from the api profile allAddressList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile allAddressList endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


