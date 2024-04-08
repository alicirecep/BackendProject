Feature: As an administrator, I want to be able to add a new Refund&Reason record to the system via the API connection.

  Scenario Outline: When a POST body containing valid authorization information and necessary data (reason) is sent to the
  /api/refundReasonAdd endpoint, the returned status code should be 201, and the message information in the
  response body should be verified as "refundReason added successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonAdd" path parameters
    # APi kullanicisi "api/refundReasonAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<reason>" information to send to the api refundReasonAdd endpoint.
    # Api kullanicisi api refundReasonAdd endpointine gondermek icin "<reason>" bilgisini iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api refundReasonAdd endpoint.
    # Api kullanicisi post request gonderir ve api refundReasonAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 201
    # Api kullanicisi status codeun 201 oldugunu dogrular
    * The api user verifies that the message information in the response body is "refundReason added successfully"
    # Api kullanicisi response bodydeki message bilgisinin "refundReason added successfully" oldugunu dogrular

    Examples:
      | reason           |
      | product mismatch |


  Scenario Outline: The creation of the new Refund&Reason record via the API should be verified.
  (The creation of the record can be verified by sending a GET request to the /api/refundReasonDetails endpoint
  with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api refundReasonDetails endpoint.
    # Api kullanicisi get request gonderir ve api refundReasonDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 19 |


  Scenario Outline: When a POST body containing invalid authorization information and necessary data (reason) is sent to the
  /api/refundReasonAdd endpoint, the returned status code should be 401, and the message information in the
  response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token.
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/refundReasonAdd" path parameters
    # APi kullanicisi "api/refundReasonAdd" path parametrelerini olusturur
    * The api user prepares a POST request containing the "<reason>" information to send to the api refundReasonAdd endpoint.
    # Api kullanicisi api refundReasonAdd endpointine gondermek icin "<reason>" bilgisini iceren bir post request hazirlar
    * The api user sends the POST request and saves the response returned from the api refundReasonAdd endpoint.
    # Api kullanicisi post request gonderir ve api refundReasonAdd endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 401
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the message information in the response body is "Unauthenticated."
    # Api kullanicisi response bodydeki message bilgisinin "Unauthenticated." oldugunu dogrular

    Examples:
      | reason           |
      | product mismatch |

