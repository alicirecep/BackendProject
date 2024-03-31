Feature: As an administrator, I should be able to access all registered user information via API connection.

  Scenario: When a GET request is sent to the /api/get-users endpoint with valid authorization credentials, the expected
  status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-users" path parameters
    * The api user saves the response returned from the api get users endpoint.
    # Api kullanicisi api get users endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario Outline: When a GET request is sent to the /api/get-users endpoint with valid authorization credentials, the information
  returned in the response body for the user with id(x) should be validated, including fields such as first_name, username,
  email, name.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-users" path parameters
    * The api user saves the response returned from the api get users endpoint.
    # Api kullanicisi api get users endpointinden donen responsei kaydeder
    * The api user verifies the information of the data at the index <dataIndex> in the response body, including "<first_name>", "<username>", "<email>", "<name>".
    # API kullanıcı response body icindeki <dataIndex> indexe sahip olanın bilgilerini "<first_name>", "<username>", "<email>", "<name>" doğrular.

    Examples:
      | dataIndex | first_name | username | email              | name      |
      | 1         | Customerr  | customer | customer@gmail.com | Customerr |


  Scenario: When a GET request is sent to the /api/get-users endpoint with invalid authorization credentials, the expected
  status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/get-users" path parameters
    * The api user saves the response returned from the api get users endpoint and confirms that the status code is '401' and the message is Unauthorized.
    # Api kullanicisi api/get-users endpointinden donen responsei kaydeder, status codeun '401' ve message bilgisinin Unauthorized oldugunu dogrular
