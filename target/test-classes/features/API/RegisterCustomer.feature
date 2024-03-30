Feature: As a user/administrator, I should be able to create a new customer record in the system via API connection.

  Background: The API constructs the base URL and path parameters for the user.

    * The api user creates the base url.
    # APi kullanicisi base urli olusturur
    * The api user sets "api/register" path parameters
    # APi kullanicisi "api/register" path parametrelerini olusturur


  Scenario: When a POST body consisting of valid data (first_name, last_name, email, password,
  password_confirmation, user_type, referral_code) is sent to the /api/register endpoint, the expected status
  code returned should be 201, and the response message should confirm: "Successfully registered"

    * The api user prepares a POST request consisting of valid data to send to the api register endpoint.
    # Api kullanicisi api register endpointine gondermek icin gecerli datalardan olusan bir post request hazirlar
    * The api user sends a POST request and saves the response from the api register endpoint.
    # Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Successfully registered"
    # Api kullanicisi response bodydeki message bilgisinin "Successfully registered" oldugunu dogrular


