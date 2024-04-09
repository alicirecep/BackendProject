Feature: As an administrator, I want to be able to access departments via the API connection.

  Scenario: When a GET request containing valid authorization information is sent to the /api/departmentList endpoint, the
  returned status code should be 200, and the message information in the response body should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentList" path parameters
    * The api user saves the response returned from the api departmentList endpoint.
    # Api kullanicisi api departmentList endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario Outline: When a GET request containing valid authorization information is sent to the /api/departmentList endpoint, the
  information returned in the response body for the department with ID 'x' should be validated, including the fields
  name and details.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/departmentList" path parameters
    * The api user saves the response returned from the api departmentList endpoint.
    # Api kullanicisi api departmentList endpointinden donen responsei kaydeder
    * The api user verifies that the "<name>" and "<details>" information of the data with the index <dataIndex> in the response body is correct.
    # API kullanıcı response body icindeki <dataIndex> indexe sahip olanin "<name>" ve "<details>" bilgilerini doğrular.

    Examples:
      | dataIndex | name      | details              |
      | 1         | Marketing | Marketing Department |
      | 2         | HR        | HR Department        |


  Scenario: When a GET request containing invalid authorization information is sent to the /api/departmentList endpoint, the
  returned status code should be 401, and the message information in the response body should be verified
  as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/departmentList" path parameters
    * The api user saves the response returned from the api departmentList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api departmentList endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

