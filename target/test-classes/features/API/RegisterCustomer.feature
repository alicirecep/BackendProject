Feature: Bir kullanici/yönetici olarak API baglantisi üzerinden sistemde yeni bir customer kaydi olusturabilmeliyim.

  Scenario: /api/register endpoint'ine gecerli datalardan (first_name, last_name, email, password, password_confirmation,
  user_type, referral_code) olusan bir POST body gönderildiginde dönen status code'un 201 oldugu ve response
  message bilgisinin "Successfully registered" oldugu dogrulanabilmeli.

    * APi kullanicisi base urli olusturur
    * APi kullanicisi "api/register" path parametrelerini olusturur
    * Api kullanicisi api register endpointine gondermek icin gecerli datalardan olusan bir post request hazirlar
    * Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder
    * Api kullanicisi status codeun 201 oldugunu dogrular
    * Api kullanicisi response bodydeki message bilgisinin "Successfully registered" oldugunu dogrular


