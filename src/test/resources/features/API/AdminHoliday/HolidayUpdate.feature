Feature: As an administrator, I want to be able to update holiday information for the specified id number via API connection.

  Scenario: When a PATCH request containing valid authorization credentials, the holiday id to be updated, and the updated
  holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, the expected status code
  returned should be 202, and the message in the response body should confirm: "holiday updated successfully".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/39" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the updated holiday data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin güncel holiday verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api holidayUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 202
    # Api kullanicisi status codeun 202 oldugunu dogrular
    * The api user verifies that the message information in the response body is "holiday updated successfully"
    # Api kullanicisi response bodydeki message bilgisinin "holiday updated successfully" oldugunu dogrular


  Scenario: When a PATCH request containing valid authorization credentials, the holiday id to be updated, and the holiday
  data (year, name, date) matching the previous records is sent to the /api/holidayUpdate/{id} endpoint, the
  expected status code returned should be 400, and the message in the response body should confirm:
  "dublicate holiday request".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/27" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the holiday data that matches the previous records to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin önceki kayıtlarla eslesen holiday verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api holidayUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 400
    # Api kullanicisi status codeun 400 oldugunu dogrular
    * The api user verifies that the message information in the response body is "dublicate holiday request"
    # Api kullanicisi response bodydeki message bilgisinin "dublicate holiday request" oldugunu dogrular


  Scenario: When a PATCH request containing valid authorization credentials, an incorrect (non-existent in the system)
  holiday id, and the updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint, the
  expected status code returned should be 404, and the message in the response body should confirm:
  "holiday not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/holidayUpdate/98" path parameters
    # APi kullanicisi "api/holidayUpdate/{id}" path parametrelerini olusturur
    * The api user prepares a PATCH request containing the updated holiday data to send to the api holidayUpdate endpoint.
    # Api kullanicisi api holidayUpdate endpointine gondermek icin güncel holiday verilerini iceren bir patch request hazirlar
    * The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.
    # Api kullanicisi patch request gonderir ve api holidayUpdate endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 404
    # Api kullanicisi status codeun 404 oldugunu dogrular
    * The api user verifies that the message information in the response body is "holiday not found"
    # Api kullanicisi response bodydeki message bilgisinin "holiday not found" oldugunu dogrular