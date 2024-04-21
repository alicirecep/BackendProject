Feature: As a user, I want to add a new address record to my profile via API connection.

  Scenario Outline: When a valid POST body containing authorization credentials and necessary data
  (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the
  /api/profile/address-store endpoint, the returned status code should be validated as 201, and the
  message information in the response body should confirm as "address added successfully".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/address-store" path parameters
    # APi kullanicisi "api/profile/address-store" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile address store endpoint.
    # Api kullanicisi api profile address store endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response from the api profile address store endpoint.
    # Api kullanicisi post request gonderir ve api profile address store endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address added successfully" oldugunu dogrular

    Examples:
      | name   | email            | address              | phone      | city        | state    | country | postal_code | address_type |
      | Aleyna | aleyna@gmail.com | Sultanbeyli Istanbul | 5478526698 | Sultanbeyli | Istanbul | Turkey  | 38000       | 11           |


  Scenario Outline: The creation of the new address record via the API should be verified through the API itself.
  (The creation of the record can be confirmed by sending a GET request to the /api/profile/customerDetailsAddress
  endpoint with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    # APi kullanicisi ""api/profile/customerDetailsAddress" path parametrelerini olusturur
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile customerDetailsAddress endpoint.
    # Api kullanicisi api profile customerDetailsAddress endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends the GET request and records the response returned from the api profile customerDetailsAddress endpoint.
    # Api kullanicisi get request gonderir ve api profile customerDetailsAddress endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id  |
      | 167 |


  Scenario Outline: When a valid authorization information and an invalid email (not containing '@') are sent in the POST
  body (name, email, address, phone, city, state, country, postal_code, address_type) to the /api/profile/address-store
  endpoint, the expected status code to return is 422, and the message in the response body should confirm that
  "The email must be a valid email address.".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/address-store" path parameters
    # APi kullanicisi "api/profile/address-store" path parametrelerini olusturur
    * The api user prepares a POST request containing invalid "<email>" and "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" information to send to the api profile address store endpoint.
    # Api kullanicisi api profile address store endpointine gondermek icin gecersiz "<email>" ve "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response from the api profile address store endpoint.
    # Api kullanicisi post request gonderir ve api profile address store endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The email must be a valid email address."
    # Api kullanicisi response bodydeki message bilgisinin "The email must be a valid email address." oldugunu dogrular

    Examples:
      | name   | email           | address              | phone      | city        | state    | country | postal_code | address_type |
      | Aleyna | aleynagmail.com | Sultanbeyli Istanbul | 5478526698 | Sultanbeyli | Istanbul | Turkey  | 38000       | 11           |


  Scenario Outline: When an invalid POST body containing necessary data (name, email, address, phone, city, state, country,
  postal_code, address_type) and invalid authorization credentials are sent to the /api/profile/address-store endpoint,
  the returned status code should be validated as 401, and the message information in the response body should confirm
  as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/address-store" path parameters
    # APi kullanicisi "api/profile/address-store" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile address store endpoint.
    # Api kullanicisi api profile address store endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response from the api profile address store endpoint.
    # Api kullanicisi post request gonderir ve api profile address store endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | name   | email            | address              | phone      | city        | state    | country | postal_code | address_type |
      | Aleyna | aleyna@gmail.com | Sultanbeyli Istanbul | 5478526698 | Sultanbeyli | Istanbul | Turkey  | 38000       | 11           |


