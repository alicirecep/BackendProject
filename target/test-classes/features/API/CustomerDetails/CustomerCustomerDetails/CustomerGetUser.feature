Feature: As a user, I should be able to access detailed information about the user who logged into the
  system via API connection.

  Scenario: When a GET request is sent to the /api/customerGetUser endpoint with valid authorization credentials,
  the expected status code returned should be 200, and the message in the response body should confirm: "success"

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/customerGetUser" path parameters
    * The api user saves the response returned from the api customerGetUser endpoint.
    # Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"


  Scenario:/api/customerGetUser endpoint'ine gecerli authorization bilgileri ile bir GET request gönderildiginde
  dönen response body'deki datalarin (first_name, last_name, email) sisteme giris yapan kullanici
  bilgileri ile ayni oldugu dogrulanmali.
  (/api/register endpoint'inde register olurken request body'de yazdığımız değerler ile
  /api/customerGetUser endpoint'inde dönen response body'deki (first_name, last_name, email) kullanici
  bilgilerinin ayni olduğu doğrulanmali.)

    * The api user constructs the base url with the "customer" token.
    * The api user sets "api/customerGetUser" path parameters
    * The api user saves the response returned from the api customerGetUser endpoint.
    * The api user verifies that the data in the returned response body matches the information of the logged in user in the system.
    # Api kullanicisi donen response bodydeki datalarin sisteme giris yapan kullanici bilgileri ile ayni oldugu dogrular


  Scenario: /api/customerGetUser endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde
  dönen status code'in 401 ve response body'deki message bilgisinin "Unauthenticated."
  oldugu dogrulanmali.

    * The api user constructs the base url with the "invalid" token.
    * The api user sets "api/customerGetUser" path parameters
    * The api user saves the response returned from the api customerGetUser endpoint and confirms that the status code is '401' and the message is Unauthorized.
    # Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder, status codeun '401' ve message bilgisinin Unauthorized oldugunu dogrular
