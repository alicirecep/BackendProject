Feature: As a user, I should be able to edit my user information via API connection.

  Scenario: When a POST request with valid authorization credentials and correct data (old_password, password,
  password_confirmation) is sent to the /api/change-password endpoint, the expected status code returned
  should be 200, and the message in the response body should confirm: "password change successfully".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/change-password" path parameters
    * The api user prepares a POST request with correct data to send to the api change password endpoint.
    # Api kullanicisi api change password endpointine gondermek icin dogru datalardan olusan bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api change password endpoint.
    # Api kullanicisi post request gonderir ve api change password endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "password change successfully"


  Scenario: When a POST request with valid authorization credentials and incorrect old_password information is sent to
  the /api/change-password endpoint (old_password, password, password_confirmation), the expected status code returned
  should be 409, and the message in the response body should confirm: "Invalid Credintials.".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/change-password" path parameters
    * The api user prepares a POST request with an incorrect old password to send to the api change password endpoint.
    # Api kullanicisi api change password endpointine gondermek icin yanlis bir old password iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api change password endpoint.
    # Api kullanicisi post request gonderir ve api change password endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 409
    * The api user verifies that the message information in the response body is "Invalid Credintials."


  Scenario: When a POST request with valid authorization credentials and mismatched password and password_confirmation
  information is sent to the /api/change-password endpoint (old_password, password, password_confirmation), the expected
  status code returned should be 422, and the message in the response body should confirm:
  "The password confirmation does not match.".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/change-password" path parameters
    * The api user prepares a POST request with mismatched password and password confirmation to send to the api change password endpoint.
    # Api kullanicisi api change password endpointine gondermek icin password ve password conformation bilgisi ayni olmayan bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api change password endpoint.
    # Api kullanicisi post request gonderir ve api change password endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    * The api user verifies that the message information in the response body is "The password confirmation does not match."


  Scenario: When a POST request with invalid authorization credentials and correct data (old_password, password,
  password_confirmation) is sent to the /api/change-password endpoint, the expected status code returned should be 401,
  and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/change-password" path parameters
    * The api user prepares a POST request with correct data to send to the api change password endpoint.
    # Api kullanicisi api change password endpointine gondermek icin dogru datalardan olusan bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api change password endpoint.
    # Api kullanicisi post request gonderir ve api change password endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."
