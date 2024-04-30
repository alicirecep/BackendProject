Feature: As a user, I should be able to access detailed information about the user who logged into the
  system via API connection.

  Scenario: When a GET request is sent to the /api/customerGetUser endpoint with valid authorization credentials,
  the expected status code returned should be 200, and the message in the response body should confirm: "success"

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/customerGetUser" path parameters
    # Api kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * The api user saves the response returned from the api customerGetUser endpoint.
    # Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular


  Scenario Outline:When a GET request is sent to the /api/customerGetUser endpoint with valid authorization credentials, the
  data returned in the response body (first_name, last_name, email) should be validated to match the information
  of the user who logged into the system.
  (The values provided in the request body during registration at the /api/register endpoint should match the
  user information (first_name, last_name, email) returned in the response body at the /api/customerGetUser
  endpoint.).

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/customerGetUser" path parameters
    # Api kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * The api user saves the response returned from the api customerGetUser endpoint.
    # Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder
    * The api user verifies that the data in the response body, such as "<first_name>", "<last_name>", "<email>", matches the information of the logged in user in the system.
    # Api kullanicisi response bodydeki datalarin "<first_name>", "<last_name>", "<email>" sisteme giris yapan kullanici bilgileri ile ayni oldugu dogrular

    Examples:
      | first_name  | last_name | email                           |
      | aleynadilan | ciftcier  | dilannciftcier@buysellcycle.com |


  Scenario: /api/customerGetUser endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde
  dönen status code'in 401 ve response body'deki message bilgisinin "Unauthenticated."
  oldugu dogrulanmali.

    * The api user constructs the base url with the "invalid" token.
     # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/customerGetUser" path parameters
    # Api kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * The api user saves the response returned from the api customerGetUser endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
