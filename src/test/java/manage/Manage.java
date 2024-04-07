package manage;

public class Manage {
    public String getVerify_the_name_value_of_a_categorie() {
        return Verify_the_name_value_of_a_categorie;
    }

    //private String Query01 = "SELECT user_id FROM deposits Where amount > 100 And amount <500;";
    /**
     * US_01 Categories tablosunda 'slug = fashion' olan bir categorie'nin name değerini dogrulayınız.
     */
    private String Verify_the_name_value_of_a_categorie = "SELECT name FROM categories Where slug='fashion';";

    public String getDataOfCity() {
        return dataOfCity;
    }

    /**
     * US_02 cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz.
     * cities tablosu uzerinden verinin eklendigini dogrulayiniz.
     */
    private String dataOfCity = "INSERT into cities (id,name,state_id,status,created_at) values (?,?,?,?,?);";

    /**
     * US_03 cities tablosunda (id=?,name=?) degerlerini iceren veriyi siliniz. Silindigini dogrulayiniz.
     */
    private String deleteDataOfCity = "DELETE FROM cities Where id=? And name=?;";

    public String getDeleteDataOfCity() {
        return deleteDataOfCity;
    }

    /**
     * US_04 contacts tablosunda (id,name,email,query_type,message) bilgileri iceren bir veri ekleyip message bilgisini update ediniz.
     */
    private String insertDataOfContactsTable = "INSERT into contacts (id,name,email,query_type,message) Values (?,?,?,?,?);";

    public String getInsertDataOfContactsTable() {
        return insertDataOfContactsTable;
    }

    /**
     * US_04 Update Message Query
     */
    private String updateDataOfContactsTable = "Update contacts SET message=? Where id=?;";

    public String getUpdateDataOfContactsTable() {
        return updateDataOfContactsTable;
    }

    /**
     * US_05 Delete data of Contacts Table
     */
    private String deleteDataOfContactsTable = "Delete from contacts Where email=?;";

    public String getDeleteDataOfContactsTable() {
        return deleteDataOfContactsTable;
    }

    /**
     * US_06 coupon_products tablosunu coupon_id'ye göre gruplayarak her kupon için kaç ürün olduğunu bulunuz.
     */
    private String couponProducts = "SELECT coupon_id, COUNT(product_id) AS product_count FROM coupon_products GROUP BY coupon_id;";

    public String getCouponProducts() {
        return couponProducts;
    }

    /**
     * US_08 delivery_processes tablosunda ilk 5 verinin name bilgilerinin tersten sırasıyla
     */

    private String delivery_processes = "SELECT name FROM delivery_processes GROUP BY name Desc Limit 5;";

    public String getDelivery_processes() {
        return delivery_processes;
    }

    /**
     * US_09 log_activity tablosunda ip='46.2.239.35' adresiyle method='Delete' edilen konuların kac tane oldugunu hesaplayıp dogrulayiniz.
     */

    private String log_activity = "Select  count(*) subject  from log_activity where  ip='46.2.239.35' And method='Delete';";

    public String getLog_activity() {
        return log_activity;
    }

    /**
     * US_10 order_address_details tablosunda ' shipping_address ' ile ' billing_address' i aynı olmayan kullanicilarin sayisini dogrulayiniz.
     */
    private String order_address_detailsTable = "Select count(*),shipping_address,billing_address,shipping_name from order_address_details Where shipping_address <> billing_address ;";

    public String getOrder_address_detailsTable() {
        return order_address_detailsTable;
    }

    /**
     * US_11 wallet_balances tablosunda type='Referral' ve id si 10 ile 20 araliginda olan dataların amount degerlerinin toplamini hesaplayiniz
     */
    private String wallet_balances_sumAmount = "Select sum(amount) from  wallet_balances Where type='Referral' and id between 10 and 20;";

    public String getWallet_balances_sumAmount() {
        return wallet_balances_sumAmount;
    }

    /**
     * #US13 seller_products tablosundaki ürünlerden hiçbir kuponla ilişkilendirilmemiş olanların ilk 3ünü listeleyiniz:
     */

    private String seller_products_notIN_coupon_products = "SELECT * FROM seller_products WHERE id NOT IN (SELECT DISTINCT product_id FROM coupon_products) Limit 3;";

    public String getSeller_products_notIN_coupon_products() {
        return seller_products_notIN_coupon_products;
    }

    /**
     * US_12 #US_12 attendances tablosunda benzersiz olan 'note' ları günlere gore ayirip listeleyiniz.
     */
    private String attendances_unique_notes = "select Distinct note from u168183796_qabuysell.attendances group by day;";

    public String getAttendances_unique_notes() {
        return attendances_unique_notes;
    }

    /**
     * #US_14 refund_reasons tablosunda 'reason' degeri Null olan veri olup olmadigini dogrulayiniz.
     */
    private String refund_reasons_table_ = "select * from refund_reasons Where reason IS NULL;";

    public String getRefund_reasons_table_() {
        return refund_reasons_table_;
    }

    /**
     * US_15 customer_coupon_stores tablosunda bulunan ilk 3 verinin bilgilerini users tablosundan getirerek listeleyiniz.
     */
    private String customer_coupon_stores_table_ = "SELECT * FROM u168183796_qabuysell.customer_coupon_stores AS u INNER JOIN u168183796_qabuysell.users AS p ON u.customer_id = p.id Limit 3;";

    public String getCustomer_coupon_stores_table_() {
        return customer_coupon_stores_table_;
    }

    /**
     * # US_16 order_address_details tablosunda shipping_address = 'Switzerland' olan id leri orders tablosuna göre listeleyin.
     */
    private String order_address_details_table_ = "SELECT * FROM orders WHERE id IN( SELECT order_id FROM order_address_details WHERE shipping_address = ?);";

    public String getOrder_address_details_table_() {
        return order_address_details_table_;
    }

    /**
     * US_17 attendances tablosunda 2022 yılından önce oluşturulmuş attendanceslardan user tablosunda id=5 olan verinin  email adresini  dogrulayınız
     */
    private String attendances_table_before_2022_id_5 = "SELECT email FROM u168183796_qabuysell.users WHERE id IN( SELECT id FROM u168183796_qabuysell.attendances WHERE  year<2022 And id= 5);";

    public String getAttendances_table_before_2022_id_5() {
        return attendances_table_before_2022_id_5;
    }

    /**
     * Us_18 bank_accounts tablosuna toplu olarak 5 veri girip eklendiğini dogrulayiniz. bank_accounts (id,bank_name,branch_name, account_name,account_number,opening_balance,description,status)
     */
    private String bankAccounts_table_insert_data = "INSERT INTO bank_accounts (id,bank_name,branch_name, account_name,account_number,opening_balance,description,status) VALUES(?,?, ?, ?, ?,?,?,?);";


    public String getBankAccounts_table_insert_data() {
        return bankAccounts_table_insert_data;
    }

    //Us19
    public String getBank_accounts_updateNegative() {
        return bank_accounts_updateNegative;
    }

    /**
     * Us_19 bank_accounts tablosunda bank_name=? olan verinin opening_balance degerinin negatif değer ile update edilmedigini dogrulayınız.
     */
    private String bank_accounts_updateNegative = "Update bank_accounts set opening_balance =? where bank_name=?;";
    private String bank_accounts_bank_name = "Select bank_name from bank_accounts;";

    public String getBank_accounts_bank_name() {
        return bank_accounts_bank_name;
    }

    /**
     * US_20 device_tokens tablosuna aynı anda 10 veri girip tabloya eklendiğini dogrulayınız.
     */
    private String device_tokens_insert_data = "INSERT INTO u168183796_qabuysell.device_tokens (id,user_id,device_token,created_at) VALUES(?,?,?,?)";


    public String getDevice_tokens_insert_data() {
        return device_tokens_insert_data;
    }

    /**
     * US_21 guest_order_details tablosunda order_id ye göre verilen sipariş adedini hesaplayınız.Sipariş numarası (order_id=?) olan verinin shipping_name bilgisini update ediniz.
     */
    private String guest_order_details_order_id_count = " SELECT COUNT(order_id) FROM u168183796_qabuysell.guest_order_details;";
    private String guest_order_details_order_id_Update_shipping_name = " Update u168183796_qabuysell.guest_order_details Set shipping_name=? Where order_id=? ;";

    public String getGuest_order_details_order_id_List() {
        return guest_order_details_order_id_List;
    }

    private String guest_order_details_order_id_List = "Select order_id,shipping_name,shipping_email From u168183796_qabuysell.guest_order_details";

    public String getGuest_order_details_order_id_count() {
        return guest_order_details_order_id_count;
    }

    public String getGuest_order_details_order_id_Update_shipping_name() {
        return guest_order_details_order_id_Update_shipping_name;
    }

    /**
     * US_22 digital_gift_cards tablosuna 1 adet veri girişi yapıp eklenen veriyi digital_gift_cards tablosunda id numarası girerek siliniz.
     */
    private String digital_gift_cards_insert = "INSERT INTO digital_gift_cards (id,gift_name,descriptionOne, thumbnail_image_one,thumbnail_image_two,created_at) VALUES (?,?, ?, ?, ?,?);";
    private String digital_gift_cards_delete = "Delete from digital_gift_cards Where id=?;";

    public String geteMailTemplateTypes() {
        return eMailTemplateTypes;
    }

    public String getDigital_gift_cards_insert() {
        return digital_gift_cards_insert;
    }

    /**
     * #US_23 email_template_types tablosunda module degeri null olmayan verileri gruplandırarak type adedini sorgulayınız.
     */
    private String eMailTemplateTypes = "SELECT COUNT(type) type,module FROM u168183796_qabuysell.email_template_types GROUP BY module HAVING module Is Not null ;";


    public String getDigital_gift_cards_delete() {
        return digital_gift_cards_delete;
    }

    public String getOrders_table_desc_order_number() {
        return orders_table_desc_order_number;
    }

    /**
     * US_24
     */
    private String orders_table_desc_order_number = "select * from u168183796_qabuysell.orders Where customer_email NOT LIKE ('%customer%') and sub_total <2000 Order BY order_number Desc;";

    /**
     * US_25
     */
    public String getOrder_payments() {
        return order_payments;
    }

    private String order_payments = "SELECT *, MAX(amount) max_amount FROM u168183796_qabuysell.order_payments WHERE txn_id Not Like '%none%' GROUP BY txn_id HAVING max_amount > 9000 ORDER BY max_amount;";
    /**
     * US_26
     */
    private String transactions_amount_of_methods = "Select id,title, sum(amount) sum_amount,payment_method from u168183796_qabuysell.transactions group by payment_method having sum_amount>7000 Order by payment_method desc;";


    public String getTransactions_amount_of_methods() {
        return transactions_amount_of_methods;
    }

    /**#US_27 transactions tablosunda payment_method='Stripe' ve payment_method= 'Cash On Delivery' olan verilerden description'ları benzersiz olanları listeleyiniz.
     */
    private String transactions_distinct_payment_method="SELECT description FROM  transactions WHERE payment_method='Stripe' UNION SELECT  description FROM  transactions WHERE payment_method= 'Cash On Delivery';";

    public String getTransactions_distinct_payment_method() {
        return transactions_distinct_payment_method;
    }
    /**# US_28 support_tickets tablosunda reference_no bilgilerinde '-' içeren ve içermeyen dataların benzersiz user_id'lerini listeleyiniz.
            */
    private String support_tickets_distince_id="SELECT user_id FROM  u168183796_qabuysell.support_tickets Where reference_no Not Like '%-%' UNION SELECT user_id FROM  u168183796_qabuysell.support_tickets Where reference_no Like '%-%';";
    public String getSupport_tickets_distince_id() {
        return support_tickets_distince_id;
    }
    /** Us_29 orders tablosunda ödemesi yapılmış siparişlerin (is_paid =1) ortalama grand_total degerini hesaplayıp dogrulayınız.
     */
    public String orders_is_paid="Select avg(grand_total)  from u168183796_qabuysell.orders Where is_paid= 1;";

    public String getOrders_is_paid() {
        return orders_is_paid;
    }

    public String getGetOrders_is_buy_now() {
        return getOrders_is_buy_now;
    }

    /** carts tablosunda 2024-03-30 tarinden önce  is_buy_now=1 olan ürünlerin toplam bedelini hesaplayınız
*/
private String getOrders_is_buy_now="Select sum(total_price) from u168183796_qabuysell.carts Where is_buy_now=1 And created_at<'2024-03-30';";
     }