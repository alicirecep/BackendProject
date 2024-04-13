Feature: As an administrator, I want to be able to update the existing address information of a customer with
  the specified address ID number and belonging customer_id via the API connection.

  Scenario Outline: When a PATCH request body, containing the address ID and the correct customer_id, along with valid
  authorization information, is sent to the /api/profile/addressUpdate/{id} endpoint for update, with fields (customer_id,
  name, email, address, phone, city, state, country, postal_code, address_type), the returned status code should be 202,
  and the message in the response body should confirm that it is "address updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/addressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressUpdate endpoint.
    # Api kullanicisi api profile addressUpdate endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and records the response from the api profile addressUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api profile addressUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "address updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "address updated successfully" oldugunu dogrular

    Examples:
      | id  | customer_id | name   | email                   | address | phone    | city     | state    | country | postal_code | address_type |
      | 148 | 4           | Aleyna | aleyna@buysellcycle.com | Hungary | 54325688 | Budapest | Budapest | Hungary | 1011        | 11           |


  Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect
  (non-existent in the system) address ID is sent to the /api/profile/addressUpdate/{id} endpoint, with fields
  (customer_id, name, email, address, phone, city, state, country, postal_code, address_type), the returned
  status code should be 404, and the message in the response body should confirm that it is "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/addressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressUpdate endpoint.
    # Api kullanicisi api profile addressUpdate endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user records the response from the api profile addressUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile addressUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  | customer_id | name   | email                   | address | phone    | city     | state    | country | postal_code | address_type |
      | 897 | 4           | Aleyna | aleyna@buysellcycle.com | Hungary | 54325688 | Budapest | Budapest | Hungary | 1011        | 11           |


  Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect customer_id is
  sent to the /api/profile/addressUpdate/{id} endpoint, with fields (customer_id, name, email, address, phone, city, state,
  country, postal_code, address_type), the returned status code should be 404, and the message in the response body should
  confirm that it is "address not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/addressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressUpdate endpoint.
    # Api kullanicisi api profile addressUpdate endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user records the response from the api profile addressUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api profile addressUpdate endpointinden donen responsei kaydeder, status codeun '404' ve reason phrase bilgisinin Not Found oldugunu dogrular

    Examples:
      | id  | customer_id | name   | email                   | address | phone    | city     | state    | country | postal_code | address_type |
      | 148 | 5           | Aleyna | aleyna@buysellcycle.com | Hungary | 54325688 | Budapest | Budapest | Hungary | 1011        | 11           |


  Scenario Outline: When a PATCH request body containing invalid authorization information is sent to the
  /api/profile/addressUpdate/{id} endpoint, with the address ID to be updated and the correct customer_id
  (customer_id, name, email, address, phone, city, state, country, postal_code, address_type), including
  the expected status code upon response verification should be 401, and the message in the response body
  should confirm as '"Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/profile/addressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/addressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressUpdate endpoint.
    # Api kullanicisi api profile addressUpdate endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user saves the response from the api profile addressUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api profile addressUpdate endpointinden donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  | customer_id | name   | email                   | address | phone    | city     | state    | country | postal_code | address_type |
      | 148 | 4           | Aleyna | aleyna@buysellcycle.com | Hungary | 54325688 | Budapest | Budapest | Hungary | 1011        | 11           |


  Scenario Outline: The updated_Id information in the response body from the /api/profile/addressUpdate/{id} endpoint
  should be verified to be the same as the id path parameter specified in the /api/profile/addressUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressUpdate/<id>" path parameters
    # APi kullanicisi "api/profile/addressUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" and "<address_type>" information to send to the api profile addressUpdate endpoint.
    # Api kullanicisi api profile addressUpdate endpointine gondermek icin <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>" ve "<address_type>" verilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and records the response from the api profile addressUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api profile addressUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the updated id information in the returned response body matches the id specified in the endpoints path parameter.
    # Api kullanicisi donen response body icindeki updated Id bilgisinin endpointde yazan id path parametresi ile ayni oldugu dogrular

    Examples:
      | id  | customer_id | name   | email                   | address | phone    | city     | state    | country | postal_code | address_type |
      | 148 | 4           | Aleyna | aleyna@buysellcycle.com | Hungary | 54325688 | Budapest | Budapest | Hungary | 1011        | 11           |


  Scenario Outline: The update of the address record should be confirmed through the API.
  (The updated_Id returned in the response body can be used to send a GET request to the /api/profile/addressDetails
  endpoint in order to verify that the record has been updated.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the address <id> to be accessed for the api profile addressDetails endpoint.
    # Api kullanicisi api profile addressDetails endpointine gondermek icin detaylarina erisilmek istenen address idsini iceren bir get request hazirlar
    * The api user sends a GET request and records the response from the api profile addressDetails endpoint.
    # Api kullanicisi get request gonderir ve api profile addressDetails endpointinden donen responsei kaydeder
    * The api user verifies that the address information in the response body is "<addressValue>".
    # API kullanicisi response bodydeki address bilgisinin "<addressValue>" olduğunu doğrular.

    Examples:
      | id  | addressValue |
      | 148 | Hungary      |
