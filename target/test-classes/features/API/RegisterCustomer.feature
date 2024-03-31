Feature: As a user/administrator, I should be able to create a new customer record in the system via API connection.

  Scenario: When a POST body consisting of valid data (first_name, last_name, email, password,
  password_confirmation, user_type, referral_code) is sent to the /api/register endpoint, the expected status
  code returned should be 201, and the response message should confirm: "Successfully registered"

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    # APi kullanicisi "api/register" path parametrelerini olusturur
    * The api user prepares a POST request consisting of valid data to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin gecerli datalardan olusan bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Successfully registered"
    # Api kullanicisi response bodydeki message bilgisinin "Successfully registered" oldugunu dogrular


  Scenario: The creation of a customer via API should be verified to confirm whether the customer exists in the customer
  list using API connection.(The existence of a customer record can be confirmed by comparing the id returned in the
  response body of the /api/register endpoint with the customer records returned in the response body of the /api/get-users endpoint.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/get-users" path parameters
    * The api user saves the response returned from the api get users endpoint.
    # Api kullanicisi api get users endpointinden donen responsei kaydeder
    * The api user confirms that the customer record has been created.
    # Api kullanicisi customer kaydiniin olusturuldugunu dogrular.


  Scenario: When a valid POST body containing data fields (first_name, last_name, email, password,
  password_confirmation, user_type, referral_code) is sent to the /api/register endpoint, the data in the
  response body (first_name, last_name, email) should be verified to match the data sent in the request body.

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request consisting of valid data to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin gecerli datalardan olusan bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the data in the response returned from the api register endpoint matches the data sent in the request body.
    # Api kullanicisi api register endpointinden donen responsedaki datalarin request body de gonderilen datalar ile ayni oldugunu dogrular.


  Scenario:When an invalid email (an existing email) from the data is sent in the POST body (first_name, last_name, email,
  password, password_confirmation, user_type, referral_code) to the /api/register endpoint, the expected status
  code returned should be 422, and the response message should confirm: "The email has already been taken.".

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request to send to the api register endpoint using an invalid email.
    # Api kullanicisi api register endpointine gondermek icin gecersiz emailden olusan bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The email has already been taken."
    # Api kullanicisi response bodydeki message bilgisinin "The email has already been taken." oldugunu dogrular


  Scenario: When a POST body with incomplete data (missing email) consisting of (first_name, last_name, email, password,
  password_confirmation, user_type, referral_code) is sent to the /api/register endpoint, the expected status
  code returned should be 422, and the response message should confirm: "The email field is required.".

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request with a missing email to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin eksik email iceren bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The email field is required."
    # Api kullanicisi response bodydeki message bilgisinin "The email field is required." oldugunu dogrular


  Scenario: When a POST body with incomplete data (missing password) consisting of (first_name, last_name, email,
  password, password_confirmation, user_type, referral_code) is sent to the /api/register endpoint, the expected
  status code returned should be 422, and the response message should confirm:
  "The password field is required.".

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request with a missing password to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin eksik password iceren bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The password field is required."
    # Api kullanicisi response bodydeki message bilgisinin "The password field is required." oldugunu dogrular


  Scenario: When a POST body containing mismatched password and password_confirmation is sent to the /api/register
  endpoint (first_name, last_name, email, password, password_confirmation, user_type, referral_code), the
  expected status code returned should be 422, and the response message should confirm:
  "The password confirmation does not match.".

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request with mismatched password and password confirmation to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin eslesmeyen password ve password confirmation iceren bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The password confirmation does not match."
    # Api kullanicisi response bodydeki message bilgisinin "The password confirmation does not match." oldugunu dogrular

  @API
  Scenario: When a POST body containing a password with fewer than 8 characters is sent to the /api/register endpoint
  (first_name, last_name, email, password, password_confirmation, user_type, referral_code), the expected status
  code returned should be 422, and the response message should confirm:
  "The password field minimum 8 character.".

    * The api user creates the base url.
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request with a password containing fewer than '8' characters to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin 8 den az karakterli password iceren bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The password field minimum 8 character."
    # Api kullanicisi response bodydeki message bilgisinin "The password field minimum 8 character." oldugunu dogrular

