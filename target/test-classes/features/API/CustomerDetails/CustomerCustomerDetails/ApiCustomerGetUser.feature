Feature: Bir kullanici olarak API baglantisi üzerinden sisteme giriş yapan kullanıcıya ait detaylı
  bilgilere erisebilmeliyim.

  Scenario: /api/customerGetUser endpoint'ine gecerli authorization bilgileri ile bir GET request gönderildiginde
  dönen status code'in 200 ve response body'deki message bilgisinin "success" oldugu dogrulanmali.

    * APi kullanicisi "customer" token ile base urli olusturur
    * APi kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder
    * Api kullanicisi status codeun 200 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular

    @API
  Scenario:/api/customerGetUser endpoint'ine gecerli authorization bilgileri ile bir GET request gönderildiginde
  dönen response body'deki datalarin (first_name, last_name, email) sisteme giris yapan kullanici
  bilgileri ile ayni oldugu dogrulanmali.
  (/api/register endpoint'inde register olurken request body'de yazdığımız değerler ile
  /api/customerGetUser endpoint'inde dönen response body'deki (first_name, last_name, email) kullanici
  bilgilerinin ayni olduğu doğrulanmali.)

    * APi kullanicisi "customer" token ile base urli olusturur
    * APi kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder
    * Api kullanicisi donen response bodydeki datalarin sisteme giris yapan kullanici bilgileri ile ayni oldugu dogrular


  Scenario: /api/customerGetUser endpoint'ine gecersiz authorization bilgileri ile bir GET request gönderildiginde
  dönen status code'in 401 ve response body'deki message bilgisinin "Unauthenticated."
  oldugu dogrulanmali.

    * APi kullanicisi "invalid" token ile base urli olusturur
    * APi kullanicisi "api/customerGetUser" path parametrelerini olusturur
    * Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder, status codeun '401' ve error bilgisinin Unauthorized oldugunu dogrular
