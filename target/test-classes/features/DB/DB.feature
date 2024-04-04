#ö
@DB
Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      #Categories tablosunda 'slug = fashion' olan bir categorie'nin name değerini dogrulayınız.
  @DB01
  Scenario: US01_Verify the name value of a categorie with 'slug = fashion' in the categories table.
    * Verify the name value of a categorie Query is prepared and executed.
    * Verify the "name" information Results are obtained.
    * Database connection is closed

    #cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz. cities tablosu uzerinden verinin eklendigini dogrulayiniz.
  @DB02
  Scenario: US_02 Add data containing the values (id,name,state_id,status,created_at) to the cities table. verify that the data was added from the cities table.
    * Insert data to the cities table
    * Verify the data information Result is obtained.
    * Database connection is closed

      # cities tablosunda (id=?,name=?) degerlerini iceren veriyi siliniz. Silindigini dogrulayiniz.
  @DB03
  Scenario: US_03 Delete the data containing the values (id=?,name=?) in the cities table. Verify that it has been deleted.
    * Insert data to the cities table
    * Verify the data information Result is obtained.
    * Delete city to the cities table
    * Verify the data information Result is obtained.
    * Database connection is closed

    #contacts tablosunda (id,name,email,query_type,message) bilgileri iceren bir veri ekleyip message bilgisini update ediniz.
  @DB04
  Scenario: US04 In the contacts table, add a data containing (id,name,email,query_type,message) and update the message information.
    * Insert data to the contacts table
    * Verify the data information Result is obtained.
    * Update message data to the contacts table
    * Verify the data information Result is obtained.
    * Database connection is closed

    # contacts tablosunda (id,name,email,query_type,message) bilgileri iceren bir veri ekleyiniz.
    # Eklenen veriyi contacts tablosunda email bilgisi girerek siliniz.Silindiğini doğrulayiniz.
  @DB05
  Scenario:US_05 Add a data containing  information in the contacts table.
  Delete the added data by entering the email information in the contacts table.
    * Insert data to the contacts table
    * Verify the data information Result is obtained.
    * Delete data to the contacts table
    * Verify the data information Result is obtained.
    * Database connection is closed

    #coupon_products tablosunu coupon_id'ye göre gruplayarak her kupon için kaç ürün olduğunu bulunuz.
  @DB06
  Scenario:US_06 Group the coupon_products table by coupon_id and find how many products there are for each coupon.
    * Query is prepared and executed in the database for coupon_products table by coupon_id groups
    * Verify the data coupon_id groups information Result is obtained.
    * Database connection is closed

  @DB07
  Scenario:US_07

    # delivery_processes tablosunda ilk 5 verinin name bilgilerinin tersten sırasıyla (Shipped,Recieved,Processing,Pending,Delivered) oldugunu dogrulayiniz.
  @DB08
  Scenario: US_08 Verify that the first 5 data names in the delivery_processes table are in reverse order.

    * Query is prepared and executed in the database for the delivery_processes table are in reverse order
    * Verify that the first 5 data names
    * Database connection is closed

    # log_activity tablosunda ip='46.2.239.35' adresiyle method='Delete' edilen konuların kac tane oldugunu hesaplayıp dogrulayiniz.
  @DB09
  Scenario:In the log_activity table, calculate and verify the number of topics with ip and method
    * Query is prepared and executed in the database for the log_activity table
    * Verify the count of subject
    * Database connection is closed

    #order_address_details tablosunda ' shipping_address ' ile ' billing_address' i aynı olmayan kullanicilarin sayisini dogrulayiniz.
    @DB10
    Scenario: Verify the number of users whose 'shipping_address' and 'billing_address' are not the same in the order_address_details table.
      * Query is prepared and executed in the database for the order_address_details table
      * Verify the adresses details aren't the same
      * Database connection is closed



