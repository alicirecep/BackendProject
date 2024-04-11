Feature: As a user, I want to be able to update the information of the address in my profile with the
  specified ID number through the API connection.

  Scenario Outline: When a PATCH request body containing valid authorization credentials, the desired address ID to be
  updated, and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent
  to the /api/profile/customerAddressUpdate/{id} endpoint, the returned status code should be validated as 202, and
  the message information in the response body should confirm as "address updated successfully".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/customerAddressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" data to send to the api profile customerAddressUpdate endpoint.
    # Api kullanicisi api profile customerAddressUpdate endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and records the response from the api profile customerAddressUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api profile customerAddressUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address updated successfully" oldugunu dogrular

    Examples:
      | id  | name   | email            | address | phone      | city    | state | country | postal_code | address_type |
      | 165 | Zeynep | zeynep@gmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline: When a valid authorization information and an incorrect (non-existent in the system) address ID are
  included in the PATCH request body (name, email, address, phone, city, state, country, postal_code, address_type) sent
  to the /api/profile/customerAddressUpdate/{id} endpoint, the expected status code to return is 404, and the message
  in the response body should confirm that "address not found".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/customerAddressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" data to send to the api profile customerAddressUpdate endpoint.
    # Api kullanicisi api profile customerAddressUpdate endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user records the response from the api profile customerAddressUpdate endpoint and verifies that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile customerAddressUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular


    Examples:
      | id  | name   | email            | address | phone      | city    | state | country | postal_code | address_type |
      | 458 | Zeynep | zeynep@gmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline: When a PATCH request body is sent to the /api/profile/customerAddressUpdate/{id} endpoint with valid
  authorization credentials, containing the desired address ID for update, and an invalid email (not containing '@'),
  along with fields: name, email, address, phone, city, state, country, postal_code, address_type, the expected status
  code returned should be 422, and the message in the response body should validate as
  "The email must be a valid email address.".

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/customerAddressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing invalid "<email>" and "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" information to send to the api profile customerAddressUpdate endpoint.
    # Api kullanicisi api profile customerAddressUpdate endpointine gondermek icin gecersiz "<email>" ve "<name>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user records the response from the api profile customerAddressUpdate endpoint, verifying that the status code is '422' and the reason phrase is Unprocessable Entity.
    # Api kullanicisi api profile customerAddressUpdate endpointinden donen responsei kaydeder, status codeun '422' ve reason phrase bilgisinin Unprocessable Entity oldugunu dogrular

    Examples:
      | id  | name   | email           | address | phone      | city    | state | country | postal_code | address_type |
      | 165 | Zeynep | zeynepgmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline: When a PATCH request body containing invalid authorization credentials, the desired address ID to be
  updated, and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent to
  the /api/profile/customerAddressUpdate/{id} endpoint, the returned status code should be validated as 401, and the message
  information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/customerAddressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" data to send to the api profile customerAddressUpdate endpoint.
    # Api kullanicisi api profile customerAddressUpdate endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user records the response from the api profile customerAddressUpdate endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile customerAddressUpdate endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  | name   | email            | address | phone      | city    | state | country | postal_code | address_type |
      | 165 | Zeynep | zeynep@gmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline: The updated_Id information in the response body returned from the /api/profile/customerAddressUpdate/{id}
  endpoint should be verified to match the id path parameter specified in the  /api/profile/customerAddressUpdate/{id} endpoint.

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/customerAddressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" data to send to the api profile customerAddressUpdate endpoint.
    # Api kullanicisi api profile customerAddressUpdate endpointine gondermek icin "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and records the response from the api profile customerAddressUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api profile customerAddressUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the returned response body matches the id specified in the endpoints path parameter.
    # Api kullanicisi donen response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular

    Examples:
      | id  | name   | email            | address | phone      | city    | state | country | postal_code | address_type |
      | 165 | Zeynep | zeynep@gmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline: The update of the address record via the API should be confirmed through the API itself.
  (The updated_Id returned in the response body can be used to send a GET request to the /api/profile/customerDetailsAddres
  endpoint to confirm that the record has been updated.)

    * The api user constructs the base url with the "customer" token.
    # APi kullanicisi "customer" token ile base urli olusturur
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile customerDetailsAddress endpoint.
    # Api kullanicisi api profile customerDetailsAddress endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends the GET request and records the response returned from the api profile customerDetailsAddress endpoint.
    # Api kullanicisi get request gonderir ve api profile customerDetailsAddress endpointinden donen responsei kaydeder
    * The api user verifies that the email information in the response body is "<emailValue>".
    # API kullanicisi response bodydeki email bilgisinin "<emailValue>" olduğunu doğrular.

    Examples:
      | id  | emailValue       |
      | 165 | zeynep@gmail.com |


