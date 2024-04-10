Feature: As a user, I want to view the addresses in my profile via the API connection.
  @API
  Scenario: When a GET request body containing valid authorization information is sent to the
  /api/profile/address-list endpoint, the returned status code should be 200, and the message information
  in the response should be verified as "success".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/address-list" path parameters
    * The api user saves the response returned from the api profile address list endpoint.
    # Api kullanicisi api profile address list endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"



