package stepdefinitions;

import com.github.javafaker.Faker;
import helperDB.DB_Cons;
import io.cucumber.java.en.Given;
import manage.Manage;
import utilities.DB_Utilities.JDBCMethods;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class DB_Stepdefinitions {
    Manage manage = new Manage();
    DB_Cons db=  new DB_Cons();
    String query;
    PreparedStatement preparedStatement;
    ResultSet rs;

    Instant instant = Instant.now();

    @Given("Database connection is established.")
    public void database_connection_is_established() {
        JDBCMethods.createConnection();
    }

    /**US_01 Categories tablosunda 'slug = fashion' olan bir categorie'nin name değerini dogrulayınız.*/
    @Given("Verify the name value of a categorie Query is prepared and executed.")
    public void Verify_the_name_value_of_a_categoriequery_is_prepared_and_executed() {
        query = manage.getVerify_the_name_value_of_a_categorie();
        try {
            rs = JDBCMethods.getStatement().executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**US_02 cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz.
     *  cities tablosu uzerinden verinin eklendigini dogrulayiniz.*/
    @Given("Insert data to the cities table")
    public void insert_data_to_the_cities_table() throws SQLException {
        query = manage.getDataOfCity();
        preparedStatement = JDBCMethods.getPraperedStatement(query);
        // PreparedStatement nesneniz varsa
        preparedStatement.setInt(1, db.getId());
        //cityName
        preparedStatement.setString(2,db.getCity());
        //state_id
        preparedStatement.setInt(3, 1);
        //status
        preparedStatement.setInt(4, 1);
        //created_at
        preparedStatement.setTimestamp(5, Timestamp.from(instant));

    }

    @Given("Verify the data information Result is obtained.")
    public void verify_the_data_information_result_is_obtained() {
        int rowCount = 0;
        try {
            rowCount = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        assertEquals(1, rowCount);
    }

    @Given("Verify the {string} information Results are obtained.")
    public void verify_the_information_results_are_obtained(String catagoryName) throws SQLException {
        rs.next();
        catagoryName = rs.getString(catagoryName);
        String expectedName = "Fashion";
        assertEquals(catagoryName, expectedName);

    }
    /**US_03 cities tablosunda (id=?,name=?) degerlerini iceren veriyi siliniz. Silindigini dogrulayiniz.*/
    @Given("Delete city to the cities table")
    public void delete_city_to_the_cities_table() throws SQLException {
        query= manage.getDeleteDataOfCity();
        preparedStatement=JDBCMethods.getPraperedStatement(query);
        preparedStatement.setInt(1,db.getId());
        preparedStatement.setString(2,db.getCity());
    }
    /**US_04_05 contacts tablosunda (id,name,email,query_type,message) bilgileri iceren bir veri eklenir. */
    @Given("Insert data to the contacts table")
    public void insert_data_to_the_contacts_table() throws SQLException {

        query= manage.getInsertDataOfContactsTable();
        preparedStatement=JDBCMethods.getPraperedStatement(query);
        // id=faker.number().numberBetween(900,9000);
        preparedStatement.setInt(1,db.getId());
        preparedStatement.setString(2,db.getUsername());
        preparedStatement.setString(3,db.getEmail());
        preparedStatement.setInt(4,db.getQuery_type());
        preparedStatement.setString(5, db.getMessage());
    }
    /**US_04 message bilgisini update ediniz.     */
    @Given("Update message data to the contacts table")
    public void update_message_data_to_the_contacts_table() throws SQLException {
        query= manage.getUpdateDataOfContactsTable();
        preparedStatement=JDBCMethods.getPraperedStatement(query);
        preparedStatement.setString(1,db.getMessage());
        preparedStatement.setInt(2,db.getId());
    }

    /** US_05 contacts tablosunda email bilgisi girerek siliniz */

    @Given("Delete data to the contacts table")
    public void delete_data_to_the_contacts_table() throws SQLException {
        query=manage.getDeleteDataOfContactsTable();
        preparedStatement=JDBCMethods.getPraperedStatement(query);
        preparedStatement.setString(1,db.getEmail());

    }

    /** US_06coupon_products tablosunu coupon_id'ye göre gruplayarak her kupon için kaç ürün olduğunu bulunuz.
     */
    @Given("Query is prepared and executed in the database for coupon_products table by coupon_id groups")
    public void query_is_prepared_and_executed_in_the_database_for_coupon_products_table_by_coupon_id_groups() throws SQLException {
        query=manage.getCouponProducts();
        rs=JDBCMethods.getStatement().executeQuery(query);
    }
    @Given("Verify the data coupon_id groups information Result is obtained.")
    public void verify_the_data_coupon_id_groups_information_Result_is_obtained() throws SQLException {
        List<String> couponID=new ArrayList<String>();
        while (rs.next()){
            couponID.add(rs.getString("coupon_id")+"     -----    "+rs.getString("product_count"));
        }
        System.err.println(("couponID"+ "      "+"product_count"));
        for (int i = 0; i <couponID.size() ; i++) {
            System.err.println((couponID.get(i) + "                  "));
        }

    }

    /** US08     */
    @Given("Query is prepared and executed in the database for the delivery_processes table are in reverse order")
    public void query_is_prepared_and_executed_in_the_database_for_the_delivery_processes_table_are_in_reverse_order() throws SQLException {
        query=manage.getDelivery_processes();
        rs=JDBCMethods.getStatement().executeQuery(query);
    }

    /** US08 Verify (Shipped,Recieved,Processing,Pending,Delivered) */
    @Given("Verify that the first {int} data names")
    public void verify_that_the_first_data_names(Integer limit) throws SQLException {
        List<String> processesName=new ArrayList<String>();
        List<String> expectedName=new ArrayList<>(Arrays.asList("Shipped","Recieved","Processing","Pending","Delivered"));
        while (rs.next()){
            processesName.add(rs.getString("name"));
        }

        for (int i = 0; i <processesName.size() ; i++) {
            assertEquals(expectedName.get(i),processesName.get(i));
        }
    }
    @Given("Query is prepared and executed in the database for the log_activity table")
    public void query_is_prepared_and_executed_in_the_database_for_the_log_activity_table() throws SQLException {
        query=manage.getLog_activity();
        rs=JDBCMethods.getStatement().executeQuery(query);
    }
    @Given("Verify the count of subject")
    public void verify_the_count_of_subject() throws SQLException {
        rs.next();
        int count= rs.getInt(1);
        int exp_count=0;
        assertEquals(exp_count,count);
    }
    /**US_10 order_address_details tablosunda ' shipping_address ' ile ' billing_address' i aynı olmayan kullanicilarin sayisini dogrulayiniz.*/
    @Given("Query is prepared and executed in the database for the order_address_details table")
    public void query_is_prepared_and_executed_in_the_database_for_the_order_address_details_table() throws SQLException {
        query=manage.getOrder_address_detailsTable();
        rs=JDBCMethods.getStatement().executeQuery(query);
    }
    @Given("Verify the adresses details aren't the same")
    public void verify_the_adresses_details_aren_t_the_same() throws SQLException {
        rs.next();
        int count= rs.getInt(1);
        System.out.println(count);
        //assertEquals(2,count);
    }



    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        JDBCMethods.closeConnection();
    }
}
