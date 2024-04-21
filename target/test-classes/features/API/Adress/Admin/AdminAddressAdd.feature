Feature: As an administrator, I want to be able to add a new address record for a customer specified by customer_id
  via the API connection.

  Scenario Outline: When a POST body containing valid authorization credentials and necessary data (customer_id, name,
  email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/addressAdd endpoint,
  the returned status code should be validated as 201, and the message information in the response body should confirm
  as "address added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressAdd" path parameters
    # APi kullanicisi "api/profile/addressAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressAdd endpoint.
    # Api kullanicisi api profile addressAdd endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response returned from the api profile addressAdd endpoint.
    # Api kullanicisi post request gonderir ve api profile addressAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address added successfully" oldugunu dogrular

    Examples:
      | customer_id | name  | email                  | address           | phone   | city     | state    | country | postal_code | address_type |
      | 32          | Zehra | zehra@buysellcycle.com | Salzburg Bergheim | 5465464 | Bergheim | Salzburg | Austria | 5101        | 11           |


  Scenario Outline: The creation of the new address record via the API using the customer ID should be verified through
  the API itself.
  (The creation of the record can be confirmed by sending a GET request to the /api/profile/addressDetails endpoint
  with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    # APi kullanicisi "api/profile/addressDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile addressDetails endpoint.
    # Api kullanicisi get request gonderir ve api profile addressDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    Examples:
      | id  |
      | 174 |


  Scenario Outline: When a POST body containing valid authorization credentials and an invalid email (not containing '@')
  is sent to the /api/profile/addressAdd endpoint, along with fields: customer_id, name, email, address, phone, city, state,
  country, postal_code, address_type, the expected status code returned should be 422, and the message in the response body
  should confirm as "The email must be a valid email address.".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressAdd" path parameters
    # APi kullanicisi "api/profile/addressAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing invalid "<email>" and <customer_id>, "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" information to send to the api profile addressAdd endpoint.
    # Api kullanicisi api profile addressAdd endpointine gondermek icin gecersiz "<email>" ve <customer_id>, "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response returned from the api profile addressAdd endpoint.
    # Api kullanicisi post request gonderir ve api profile addressAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 422
    # Api kullanicisi status codeun 422 oldugunu dogrular
    * The api user verifies that the message information in the response body is "The email must be a valid email address."
    # Api kullanicisi response bodydeki message bilgisinin "The email must be a valid email address." oldugunu dogrular

    Examples:
      | customer_id | name  | email                 | address           | phone   | city     | state    | country | postal_code | address_type |
      | 32          | Zehra | zehrabuysellcycle.com | Salzburg Bergheim | 5465464 | Bergheim | Salzburg | Austria | 5101        | 11           |


  Scenario Outline: When a POST body containing invalid authorization credentials and necessary data (customer_id, name,
  email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/addressAdd endpoint,
  the returned status code should be validated as 401, and the message information in the response body should confirm
  as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/addressAdd" path parameters
    # APi kullanicisi "api/profile/addressAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressAdd endpoint.
    # Api kullanicisi api profile addressAdd endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and records the response returned from the api profile addressAdd endpoint.
    # Api kullanicisi post request gonderir ve api profile addressAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | customer_id | name  | email                  | address           | phone   | city     | state    | country | postal_code | address_type |
      | 32          | Zehra | zehra@buysellcycle.com | Salzburg Bergheim | 5465464 | Bergheim | Salzburg | Austria | 5101        | 11           |


