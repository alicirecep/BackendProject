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
    /** US_09 log_activity tablosunda ip='46.2.239.35' adresiyle method='Delete' edilen konuların kac tane oldugunu hesaplayıp dogrulayiniz.*/

    private String log_activity = "Select  count(*) subject  from log_activity where  ip='46.2.239.35' And method='Delete';";

    public String getLog_activity() {
        return log_activity;
    }
    /** US_10 order_address_details tablosunda ' shipping_address ' ile ' billing_address' i aynı olmayan kullanicilarin sayisini dogrulayiniz.*/
    private String order_address_detailsTable="Select count(*),shipping_address,billing_address,shipping_name from order_address_details Where shipping_address <> billing_address ;";
    public String getOrder_address_detailsTable() {
        return order_address_detailsTable;
    }
}
