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

  #wallet_balances tablosunda type='Referral' ve ' id ' si 10 ile 20 araliginda olan dataların amount degerlerinin toplamini hesaplayiniz
  @DB11
  Scenario:  Calculate the sum of the amount values of the data with type='Referral' and 'id' between 10 and 20 in the wallet_balances table
    * Query is prepared and executed in the database for the wallet_balances table
    * Verify the calculate sum of the amount values of the data
    * Database connection is closed

    ##US_12 attendances tablosunda benzersiz olan 'note' ları günlere gore ayirip listeleyiniz.
  @DB12
  Scenario:List the unique 'notes' in the US_12 attendances table, separated by days.
    * Query is prepared and executed in the database for the attendances table
    * Verify List the unique 'notes' values of the data
    * Database connection is closed

  #US13 seller_products tablosundaki ürünlerden hiçbir kuponla ilişkilendirilmemiş olanların ilk 3ünü listeleyiniz:
  @DB13
  Scenario:List the top 3 products in the seller_products table that are not associated with any coupon
    * product query not associated with a coupon is prepared
    * Verify List the top 3 products
    * Database connection is closed

    #US_14 refund_reasons tablosunda 'reason' degeri Null olan veri olup olmadigini dogrulayiniz.
  @DB14
  Scenario: Verify whether there is data in the refund_reasons table with a 'reason' value of Null.
    * In the refund_reasons table, a query is prepared that retrieves data whose 'reason' value is Null.
    * Verify whether there is data with a 'reason' value of Null
    * Database connection is closed
    ##US_15 customer_coupon_stores tablosunda bulunan ilk 3 verinin bilgilerini users tablosundan getirerek listeleyiniz.
  @DB15
  Scenario:  List the information of the first 3 data in the customer_coupon_stores table from the users table.
    * Prepare the query that brings the information of the first 3 data in the customer_coupon_stores table
    * Verify the information of the first 3 data in the table
    * Database connection is closed
  ## US_16 order_address_details tablosunda shipping_address = 'Switzerland' olan id leri orders tablosuna göre listeleyin.
  @DB16
  Scenario:List ids with shipping_address = 'Switzerland' in the order_address_details table according to the orders table.
    * In the order_address_details table, prepare a query that retrieves ids with shipping_address = 'Switzerland'
    * Verify the shipping_address information of 3 data in the table
    * Database connection is closed

  # US_17 attendances tablosunda 2022 yılından önce oluşturulmuş attendanceslardan user tablosunda id=5 olan verinin  email adresini  dogrulayınız
  @DB17
  Scenario: Verify the email address of the data with id=5 in the user table from the attendances created before 2022 in the attendances table.
    * Prepare a query that retrieves the data with id 5 in the user table created before 2022 in the attendances table
    * Verify the e-mail address of the data with id 5
    * Database connection is closed
    #bank_accounts tablosuna toplu olarak 5 veri girip eklendiğini dogrulayiniz.
  @DB18
  Scenario: Enter 5 data in bulk to the bank_accounts table and verify that it is added.

    * Prepare a query that adds 5 data to the bank_accounts table in bulk.
    * 5 Enter the data in bulk. Check that it is added to the table.
    * Database connection is closed

  @DB19
  Scenario: Verify that the opening_balance value of the data with bank_name=? in the bank_accounts table is not updated with a negative value.
    * Bank names in the table are saved
    * Prepare a query that verifies that the bank_accounts table is not updated with a negative value
    * Verify bank_accounts table is not updated with a negative value
    * Database connection is closed

    # US_20 device_tokens tablosuna aynı anda 10 veri girip tabloya eklendiğini dogrulayınız.
  @DB20
  Scenario: Enter 10 data into the device_tokens table at the same time and verify that it is added to the table.
    * Prepare a query that adds 10 data to the device_tokens table in bulk.
    * 10 Enter the data in bulk. Check that it is added to the table.
    * Database connection is closed
    #US_21 guest_order_details tablosunda order_id ye göre verilen sipariş adedini hesaplayınız.Sipariş numarası (order_id=?) olan verinin shipping_name bilgisini update ediniz.
  @DB21
  Scenario: Calculate the number of orders placed according to the order_id in the guest_order_details table. Update the shipping_name information of the data with order number (order_id=?).
    * Query is prepared to calculate the number of orders placed according to the order_id in the guest_order_details table
    * Updates the shipping_name of the data with the order number order_id 23
    * Database connection is closed

#US_22 digital_gift_cards tablosuna 1 adet veri girişi yapıp eklenen veriyi digital_gift_cards tablosunda id numarası girerek siliniz.

  @DB22
  Scenario: Enter 1 data in the digital_gift_cards table and delete the added data by entering the id number in the digital_gift_cards table.
    * Prepare query for  data entry to digital_gift_cards table
    * 1 Enter the data in bulk. Check that it is added to the table.
    * Prepare query for  data delete to digital_gift_cards table
    * Verify the data information Result is obtained.
    * Database connection is closed

    #US_23 email_template_types tablosunda module degeri null olmayan verileri gruplandırarak type adedini sorgulayınız.
  @DB23
  Scenario:In the email_template_types table, query the number of types by grouping the data whose module value is not null.
    * In the email_template_types table, query querying the number of types by grouping the data whose module value is not null is prepared.
    * The results of the type number are checked
    * Database connection is closed
  # US_24 orders tablosunda customer_email verilerinde customer içermeyenleri ve sub_total ı 2000 in altında olan dataları order_number ters sıralı olarak listeleyiniz.
  @DB24
  Scenario: In the orders table, list the data that does not contain customer in the customer_email data
  and the data whose sub_total is below 2000 in reverse order of order_number.
    *  In the orders table, the desired Query is prepared as order_number in reverse order.
    *  30 rows are verified to return
    * Database connection is closed
#US_25 order_payments tablosunda txn_id='none' olmayan verileri txn_id'lerine göre max_amount değerleri 9000 den yüksek olan verileri gruplandırıp max_amount degerlerine göre sıralayın

  @DB25
  Scenario:In the order_payments table, group the data without txn_id='none' according to their txn_id,
  group the data with max_amount values higher than 9000 and sort them according to their max_amount values.
    * Write the desired query in the order_payments table
    * List of Max values is validated
    * Database connection is closed

    #US_26 transactions tablosunda bulunan verileri payment_method bilgilerine göre guruplandırıp amount degerlerinin toplamını hesaplayınız ve toplam amount degeri 7000 'in üstünde olan verileri payment_method bilgilerine göre tersten sıralayınız.
  @DB26
  Scenario: Group the data in the transactions table according to the payment_method information
  and calculate the sum of the amount values and sort the data
  with a total amount value above 7000 in reverse order according to the payment_method information.
    * Prepare the desired Query in the transactions table
    * Verifies the reverse sort list by payment_method for those with a total amount over 7000
    * Database connection is closed

#US_27 transactions tablosunda payment_method='Stripe' ve payment_method= 'Cash On Delivery' olan verilerden description'ları benzersiz olanları listeleyiniz.
  @DB27
  Scenario:In the transactions table, list the data with payment_method='Stripe' and payment_method= 'Cash On Delivery' with unique descriptions.

    * Prepare a query that returns data with unique descriptions in the transactions table
    * Database connection is closed
# US_28 support_tickets tablosunda reference_no bilgilerinde '-' içeren ve içermeyen dataların benzersiz user_id'lerini listeleyiniz.

  @DB28
  Scenario:In the support_tickets table, list the unique user_ids of the data with and without '-' in reference_no.
    * Query is prepared listing the unique user_ids of the data
    * Database connection is closed
#US_29 orders tablosunda ödemesi yapılmış siparişlerin (is_paid =1) ortalama grand_total degerini hesaplayıp dogrulayınız.

  @DB29
  Scenario: Calculate and verify the average grand_total value of paid orders (is_paid =1) in the orders table.
    * Query is prepared Calculate and verify the average grand_total value of paid orders
    * Database connection is closed
# US_30 carts tablosunda 2024-03-30 tarinden önce  is_buy_now=1 olan ürünlerin toplam bedelini hesaplayınız
  @DB30
  Scenario: Calculate the total cost of products with is_buy_now=1 before 2024-03-30 in the carts table
    * Query is prepared Calculate and verify the total cost of products
    * Database connection is closed





