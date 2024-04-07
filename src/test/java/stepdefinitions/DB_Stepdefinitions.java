package stepdefinitions;

import config_Requirements.ConfigReader;
import helperDB.*;
import io.cucumber.java.en.Given;
import manage.Manage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.*;
import static helperDB.BankAccount.generateBankAccount;
import static helperDB.BankAccount.setOpening_balance;
import static helperDB.DeviceToken.generateDeviceTokens;
import static helperDB.Gift.generateGiftCards;
import static helperDB.Gift.giftCardId;
import static helperDB.JDBC_Cons.*;
import static helperDB.JDBC_Cons.count;
import static helperDB.JDBC_Structure_Methods.*;
import static helperDB.JDBC_Structure_Methods.preparedStatement;
import static org.junit.Assert.*;
import static utilities.DB_Utilities.JDBCMethods.bulk_device_token;
import static utilities.DB_Utilities.JDBCMethods.getQueryResultList;

public class DB_Stepdefinitions {
    Manage manage = new Manage();
    JDBC_Cons db = new JDBC_Cons();
    ResultSet rs;
    //prepared statement timestamp instant döndürür.
    Instant instant = Instant.now();

    @Given("Database connection is established.")
    public void database_connection_is_established() {
        createConnection();
    }

    /**
     * US_01 Categories tablosunda 'slug = fashion' olan bir categorie'nin name değerini dogrulayınız.
     */
    @Given("Verify the name value of a categorie Query is prepared and executed.")
    public void Verify_the_name_value_of_a_categoriequery_is_prepared_and_executed() {
        query = manage.getVerify_the_name_value_of_a_categorie();
        try {
            rs = getStatement().executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * US_02 cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz.
     * cities tablosu uzerinden verinin eklendigini dogrulayiniz.
     */
    @Given("Insert data to the cities table")
    public void insert_data_to_the_cities_table() throws SQLException {
        query = manage.getDataOfCity();
        preparedStatement = getPraperedStatement(query);
        // PreparedStatement nesneniz varsa
        preparedStatement.setInt(1, getId());
        //cityName
        preparedStatement.setString(2, db.getCity());
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
    public void verify_the_information_results_are_obtained(String categoryName) throws SQLException {
        rs.next();
        categoryName = rs.getString(categoryName);
        String expectedName = ConfigReader.getProperty("categoryName", "db");
        assertEquals(categoryName, expectedName);

    }

    /**
     * US_03 cities tablosunda (id=?,name=?) degerlerini iceren veriyi siliniz. Silindigini dogrulayiniz.
     */
    @Given("Delete city to the cities table")
    public void delete_city_to_the_cities_table() throws SQLException {
        query = manage.getDeleteDataOfCity();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setInt(1, getId());
        preparedStatement.setString(2, db.getCity());
    }

    /**
     * US_04_05 contacts tablosunda (id,name,email,query_type,message) bilgileri iceren bir veri eklenir.
     */
    @Given("Insert data to the contacts table")
    public void insert_data_to_the_contacts_table() throws SQLException {

        query = manage.getInsertDataOfContactsTable();
        preparedStatement = getPraperedStatement(query);
        // id=faker.number().numberBetween(900,9000);
        preparedStatement.setInt(1, getId());
        preparedStatement.setString(2, db.getUsername());
        preparedStatement.setString(3, db.getEmail());
        preparedStatement.setInt(4, db.getQuery_type());

        query = manage.getInsertDataOfContactsTable();
        preparedStatement = getPraperedStatement(query);
        // id=faker.number().numberBetween(900,9000);
        preparedStatement.setInt(1, db.getId());
        preparedStatement.setString(2, db.getUsername());
        preparedStatement.setString(3, db.getEmail());
        preparedStatement.setInt(4, db.getQuery_type());

        preparedStatement.setString(5, db.getMessage());
    }

    /**
     * US_04 message bilgisini update ediniz.
     */
    @Given("Update message data to the contacts table")
    public void update_message_data_to_the_contacts_table() throws SQLException {
        query = manage.getUpdateDataOfContactsTable();
        preparedStatement = getPraperedStatement(query);
        //message
        preparedStatement.setString(1, db.getMessage());
        //id
        preparedStatement.setInt(2, getId());
    }

    /**
     * US_05 contacts tablosunda email bilgisi girerek siliniz
     */

    @Given("Delete data to the contacts table")
    public void delete_data_to_the_contacts_table() throws SQLException {

        query = manage.getDeleteDataOfContactsTable();
        preparedStatement = getPraperedStatement(query);
        //contacts table email
        preparedStatement.setString(1, db.getEmail());

    }

    /**
     * US_06coupon_products tablosunu coupon_id'ye göre gruplayarak her kupon için kaç ürün olduğunu bulunuz.
     */
    @Given("Query is prepared and executed in the database for coupon_products table by coupon_id groups")
    public void query_is_prepared_and_executed_in_the_database_for_coupon_products_table_by_coupon_id_groups() throws SQLException {
        query = manage.getCouponProducts();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify the data coupon_id groups information Result is obtained.")
    public void verify_the_data_coupon_id_groups_information_Result_is_obtained() throws SQLException {
        List<String> couponID = new ArrayList<String>();
        while (rs.next()) {
            couponID.add(rs.getString("coupon_id") + "     -----    " + rs.getString("product_count"));
        }
        System.err.println(("couponID" + "      " + "product_count"));
        for (int i = 0; i < couponID.size(); i++) {
            System.err.println((couponID.get(i) + "                  "));
        }

    }

    /**
     * US08
     */
    @Given("Query is prepared and executed in the database for the delivery_processes table are in reverse order")
    public void query_is_prepared_and_executed_in_the_database_for_the_delivery_processes_table_are_in_reverse_order() throws SQLException {
        query = manage.getDelivery_processes();
        rs = getStatement().executeQuery(query);
    }

    /**
     * US08 Verify (Shipped,Recieved,Processing,Pending,Delivered)
     */
    @Given("Verify that the first {int} data names")
    public void verify_that_the_first_data_names(Integer limit) throws SQLException {
        List<String> processesName = new ArrayList<String>();
        List<String> expectedName = new ArrayList<>(Arrays.asList("Shipped", "Recieved", "Processing", "Pending", "Delivered"));
        while (rs.next()) {
            processesName.add(rs.getString("name"));
        }


        for (int i = 0; i < processesName.size(); i++) {
            assertEquals(expectedName.get(i), processesName.get(i));

        }
    }

    @Given("Query is prepared and executed in the database for the log_activity table")
    public void query_is_prepared_and_executed_in_the_database_for_the_log_activity_table() throws SQLException {
        query = manage.getLog_activity();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify the count of subject")
    public void verify_the_count_of_subject() throws SQLException {
        rs.next();
        int count = rs.getInt(1);
        int exp_count = 0;
        assertEquals(exp_count, count);
    }

    /**
     * US_10 order_address_details tablosunda ' shipping_address ' ile ' billing_address' i aynı olmayan kullanicilarin sayisini dogrulayiniz.
     */
    @Given("Query is prepared and executed in the database for the order_address_details table")
    public void Query_is_prepared_and_executed_in_the_database_for_the_order_address_details_table() throws SQLException {

        query = manage.getOrder_address_detailsTable();
        rs = getStatement().executeQuery(query);

    }

    @Given("Verify the adresses details aren't the same")
    public void verify_the_adresses_details_aren_t_the_same() throws SQLException {
        rs.next();

        int count = rs.getInt(1);
        System.out.println(count);
        assertEquals(2, count);
    }

    @Given("Query is prepared and executed in the database for the wallet_balances table")
    public void Query_is_prepared_and_executed_in_the_database_for_the_wallet_balances_table() throws SQLException {
        query = manage.getWallet_balances_sumAmount();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify the calculate sum of the amount values of the data")
    public void verify_the_calculate_sum_of_the_amount_values_of_the_data() throws SQLException {
        rs.next();
        int sumAmount = rs.getInt(1);
        assertEquals(10, sumAmount);

    }

    @Given("Query is prepared and executed in the database for the attendances table")
    public void query_is_prepared_and_executed_in_the_database_for_the_attendances_table() throws SQLException {
        query = manage.getAttendances_unique_notes();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify List the unique {string} values of the data")
    public void verify_list_the_unique_values_of_the_data(String string) throws SQLException {
        List<String> uniqueNotes = new ArrayList<String>();
        List<String> uniqueValues = new ArrayList<String>(Arrays.asList("Holiday for Eid Ul Azha", "Holiday for Second", "Holiday for christmas"));

        while (rs.next()) {
            uniqueNotes.add(rs.getString("note"));
        }
        for (int i = 0; i < uniqueNotes.size(); i++) {
            assertEquals(uniqueValues.get(i), uniqueNotes.get(i));
        }
    }

    @Given("product query not associated with a coupon is prepared")
    public void product_query_not_associated_with_a_coupon_is_prepared() throws SQLException {
        query = manage.getSeller_products_notIN_coupon_products();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify List the top {int} products")
    public void verify_list_the_top_products(Integer int1) throws SQLException {
        List<Integer> products = new ArrayList<Integer>();
        List<Integer> Values = new ArrayList<Integer>(Arrays.asList(342, 343, 344));

        while (rs.next()) {
            products.add(rs.getInt("id"));
        }
        for (int i = 0; i < products.size(); i++) {
            assertEquals(Values.get(i), products.get(i));
        }
    }

    @Given("In the refund_reasons table, a query is prepared that retrieves data whose {string} value is Null.")
    public void ın_the_refund_reasons_table_a_query_is_prepared_that_retrieves_data_whose_value_is_null(String string) throws SQLException {
        query = manage.getRefund_reasons_table_();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify whether there is data with a {string} value of Null")
    public void verify_whether_there_is_data_with_a_value_of_null(String string) throws SQLException {
        List<String> reasonNull = new ArrayList<String>();
        try {
            while (rs.next()) {
                reasonNull.add(rs.getString("reason"));
            }
            if (!reasonNull.isEmpty()) {
                for (int i = 0; i < reasonNull.size(); i++) {
                    assertTrue(reasonNull.get(i).contains("NULL"));
                }
            } else {
                assertFalse("ResultSet is empty", rs.next());
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Given("Prepare the query that brings the information of the first {int} data in the customer_coupon_stores table")
    public void prepare_the_query_that_brings_the_information_of_the_first_data_in_the_customer_coupon_stores_table(Integer int1) throws SQLException {
        query = manage.getCustomer_coupon_stores_table_();
        rs = getStatement().executeQuery(query);
    }

    @Given("Verify the information of the first {int} data in the table")
    public void verify_the_information_of_the_first_data_in_the_table(Integer int1) throws SQLException {
        rs.next();
        assertTrue(getQueryResultList(query).get(1).contains("Oske"));
    }

    //US_16
    @Given("In the order_address_details table, prepare a query that retrieves ids with shipping_address = {string}")
    public void ın_the_order_address_details_table_prepare_a_query_that_retrieves_ids_with_shipping_address(String shipping_adress) throws SQLException {
        query = manage.getOrder_address_details_table_();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setString(1, db.setShipping_address(shipping_adress));

    }

    @Given("Verify the shipping_address information of {int} data in the table")
    public void verify_the_shipping_address_information_of_data_in_the_table(int shipping) throws SQLException {
        rs = preparedStatement.executeQuery();
        int rowCount = 0;
        // Sonuçları say
        while (rs.next()) {
            rowCount++;
        }
        // Beklenen sayı ile gerçek sayıyı karşılaştır
        assertEquals(shipping, rowCount);
    }

    // US_17 attendances tablosunda 2022 yılından önce oluşturulmuş attendanceslardan user tablosunda id=5 olan verinin  email adresini  dogrulayınız

    @Given("Prepare a query that retrieves the data with id {int} in the user table created before {int} in the attendances table")
    public void prepare_a_query_that_retrieves_the_data_with_id_in_the_user_table_created_before_in_the_attendances_table(Integer year, Integer id) throws SQLException {
        query = manage.getAttendances_table_before_2022_id_5();

        rs = getStatement().executeQuery(query);
    }

    @Given("Verify the e-mail address of the data with id {int}")
    public void verify_the_e_mail_address_of_the_data_with_id(Integer id) throws SQLException {
        rs.next();
        String email = rs.getString("email");
        ///'ra_email@gmail.com'
        assertEquals("ra_email@gmail.com", email);
    }

    /**
     * US_18 bank_accounts tablosuna toplu olarak 5 veri girip eklendiğini dogrulayiniz. bank_accounts (id,bank_name,branch_name, account_name,account_number,opening_balance,description,status)
     */

    @Given("Prepare a query that adds {int} data to the bank_accounts table in bulk.")
    public void prepare_a_query_that_adds_data_to_the_bank_accounts_table_in_bulk(Integer count) throws SQLException {
        query = manage.getBankAccounts_table_insert_data();
        preparedStatement = getPraperedStatement(query);
        //Bulk olarak 5 veri girilecek 1. veriyi hazırlayalım
        //bank_accounts (id ,bank_name, branch_name, account_name,account_number, opening_balance, description, status)
        List<BankAccount> accounts = generateBankAccount(count);
        int flag = 0;

        for (BankAccount bankAccount : accounts) {

            preparedStatement.setInt(1, accounts.get(flag).getBank_accounts_id());
            preparedStatement.setString(2, accounts.get(flag).getBank_name());
            preparedStatement.setString(3, accounts.get(flag).getBranch_name());
            preparedStatement.setString(4, accounts.get(flag).getAccount_name());
            preparedStatement.setString(5, accounts.get(flag).getAccount_number());
            preparedStatement.setDouble(6, accounts.get(flag).getOpening_balance());
            preparedStatement.setString(7, accounts.get(flag).getDescription());
            preparedStatement.setInt(8, accounts.get(flag).getStatus());

            preparedStatement.addBatch();
            flag++;
            if (flag == accounts.size()) {
                result = preparedStatement.executeBatch();
            }
        }
        /**  addBatch() yöntemi ile her hazırlanan sorgu bu sorgu yığınına eklenir.
         *  Ardından executeBatch() yöntemi kullanılarak tüm sorguları çalıştırılır.
         */
    }

    @Given("{int} Enter the data in bulk. Check that it is added to the table.")
    public void enter_the_data_in_bulk_check_that_it_is_added_to_the_table(int rowCount) throws SQLException {
        /** executeBatch() yöntemi, her sorgunun etkilenen satır sayısını içeren bir int dizisi döndürür.*/

        System.out.println("Inserted " + result.length + " records successfully.");
        System.out.println(Arrays.toString(result));
        assertEquals(rowCount, result.length);
    }

    @Given("Bank names in the table are saved")
    public void bank_names_in_the_table_are_saved() throws SQLException {
        query = manage.getBank_accounts_bank_name();
        rs = getStatement().executeQuery(query);
        while (rs.next()) {
            bank_names.add(rs.getString("bank_name"));
        }

    }

    @Given("Prepare a query that verifies that the bank_accounts table is not updated with a negative value")
    public void prepare_a_query_that_verifies_that_the_bank_accounts_table_is_not_updated_with_a_negative_value() throws SQLException {
        query = manage.getBank_accounts_updateNegative();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setDouble(1, setOpening_balance(-3000.00));
        preparedStatement.setString(2, bank_names.get(6));
        System.out.println(bank_names.get(6));
        System.out.println(setOpening_balance(-3000.00));

    }

    @Given("Verify bank_accounts table is not updated with a negative value")
    public void verify_bank_accounts_table_is_not_updated_with_a_negative_value() throws SQLException {
        int row = preparedStatement.executeUpdate();
        assertTrue(row == 0);
    }

    /**
     * US_20 device_tokens tablosuna aynı anda 10 veri girip tabloya eklendiğini dogrulayınız.
     */
    @Given("Prepare a query that adds {int} data to the device_tokens table in bulk.")
    public void prepare_a_query_that_adds_data_to_the_device_tokens_table_in_bulk(Integer count) throws SQLException {
        query = manage.getDevice_tokens_insert_data();
        preparedStatement = getPraperedStatement(query);
        //(id,user_id,device_token,created_at)
        List<DeviceToken> device = generateDeviceTokens(count);
        int flag = 0;
        System.out.println(device);
        for (DeviceToken deviceToken : device) {

            preparedStatement.setInt(1, device.get(flag).getDevice_id());
            preparedStatement.setInt(2, device.get(flag).getDevice_userID());
            preparedStatement.setString(3, device.get(flag).getDevice_token());
            preparedStatement.setTimestamp(4, device.get(flag).getCreated_at());
            preparedStatement.addBatch();
            flag++;
            if (flag == device.size()) {
                result = preparedStatement.executeBatch();
            }
        }
    }

    /**
     * US_21 guest_order_details tablosunda order_id ye göre verilen sipariş adedini hesaplayınız.Sipariş numarası (order_id=?) olan verinin shipping_name bilgisini update ediniz.
     */
    @Given("Query is prepared to calculate the number of orders placed according to the order_id in the guest_order_details table")
    public void query_is_prepared_to_calculate_the_number_of_orders_placed_according_to_the_order_id_in_the_guest_order_details_table() throws SQLException {
        query = manage.getGuest_order_details_order_id_count();
        rs = getStatement().executeQuery(query);
        rs.next();
        //order_id listesindeki order_id sayısı
        count = rs.getInt("COUNT(order_id)");
        System.out.println(count);

    }

    @Given("Updates the shipping_name of the data with the order number order_id {int}")
    public void updates_the_shipping_name_of_the_data_with_the_order_number_order_id(int id) throws SQLException {
        query = manage.getGuest_order_details_order_id_List();
        rs = getStatement().executeQuery(query);
        //order_iid listesi için resultset başlatılır
        while (rs.next()) {
            int order_id = rs.getInt("order_id");
            guest_order_details_order_id_List.add(order_id);
        }
        String shippingName = db.getGuest_order_details_order_shipping_name();
        System.out.println(shippingName);

        query = manage.getGuest_order_details_order_id_Update_shipping_name();
        preparedStatement = getPraperedStatement(query);
        if (guest_order_details_order_id_List.contains(id)) {
            preparedStatement.setString(1, db.getGuest_order_details_order_shipping_name());
            preparedStatement.setInt(2, id);
            count = preparedStatement.executeUpdate();
            assertTrue(count == 1);
        } else {
            try {

                assertFalse(guest_order_details_order_id_List.contains(id));
                System.err.print("id bulunamadı");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }


        }


        System.out.println(guest_order_details_order_id_List);
    }

    /**
     * #US_22 digital_gift_cards tablosuna 1 adet veri girişi yapıp eklenen veriyi digital_gift_cards tablosunda id numarası girerek siliniz.
     * (id,gift_name,descriptionOne, thumbnail_image_one,thumbnail_image_two,created_at)
     */
    @Given("Prepare query for  data entry to digital_gift_cards table")
    public void prepare_query_for_data_entry_to_digital_gift_cards_table() throws SQLException {
        query = manage.getDigital_gift_cards_insert();
        preparedStatement = getPraperedStatement(query);
        int flag = 0;
        List<Gift> giftCardList = generateGiftCards(1);


        for (Gift giftCard : giftCardList) {

            preparedStatement.setInt(1, giftCardList.get(flag).getGiftCardId());
            preparedStatement.setString(2, giftCardList.get(flag).getGift_name());
            preparedStatement.setString(3, giftCardList.get(flag).getDescriptionOne());
            preparedStatement.setString(4, giftCardList.get(flag).getThumbnail_image_one());
            preparedStatement.setString(5, giftCardList.get(flag).getThumbnail_image_two());
            preparedStatement.setTimestamp(6, giftCardList.get(flag).getCreated_at());
            preparedStatement.addBatch();
            result = preparedStatement.executeBatch();

        }


    }

    @Given("Prepare query for  data delete to digital_gift_cards table")
    public void prepare_query_for_data_delete_to_digital_gift_cards_table() throws SQLException {
        query = manage.getDigital_gift_cards_delete();
        preparedStatement = getPraperedStatement(query);
        preparedStatement.setInt(1, giftCardId);
    }

    @Given("In the email_template_types table, query querying the number of types by grouping the data whose module value is not null is prepared.")
    public void ın_the_email_template_types_table_query_querying_the_number_of_types_by_grouping_the_data_whose_module_value_is_not_null_is_prepared() throws SQLException {
        query = manage.geteMailTemplateTypes();
        rs = getStatement().executeQuery(query);


        int count = rs.getInt(1);
        System.out.println(count);
        //assertEquals(2,count);

    }

    @Given("The results of the type number are checked")
    public void the_results_of_the_type_number_are_checked() throws SQLException {
        rs.next();
        int type = rs.getInt("type");
        assertEquals(6, type);
    }

    /**
     * US24
     */
    @Given("In the orders table, the desired Query is prepared as order_number in reverse order.")
    public void ın_the_orders_table_the_desired_query_is_prepared_as_order_number_in_reverse_order() throws SQLException {
        query = manage.getOrders_table_desc_order_number();
        rs = getStatement().executeQuery(query);
    }

    @Given("{int} rows are verified to return")
    public void rows_are_verified_to_return(Integer row) throws SQLException {
        List<String> order_number = new ArrayList<String>();

        while (rs.next()) {
            String order = rs.getString("order_number");
            order_number.add(order);
        }
        Integer size = order_number.size();
        assertEquals(row, size);
    }

    /**
     * #US_25 order_payments tablosunda txn_id='none' olmayan verileri txn_id'lerine göre
     * max_amount değerleri 9000 den yüksek olan verileri gruplandırıp max_amount degerlerine göre sıralayın
     */
    @Given("Write the desired query in the order_payments table")
    public void write_the_desired_query_in_the_order_payments_table() throws SQLException {
        query = manage.getOrder_payments();
        rs = getStatement().executeQuery(query);

    }

    @Given("List of Max values is validated")
    public void list_of_max_values_is_validated() throws SQLException {
        List<Double> maxAmount = new ArrayList<Double>();
        List<Double> expectedAmount = new ArrayList<Double>(Arrays.asList(19840.00, 23800.00, 23800.00, 27760.00));

        while (rs.next()) {
            Double amount = rs.getDouble("max_amount");
            maxAmount.add(amount);
        }
        for (int i = 0; i < maxAmount.size(); i++) {
            assertEquals(expectedAmount.get(i), maxAmount.get(i));
        }
    }

    @Given("Prepare the desired Query in the transactions table")
    public void prepare_the_desired_query_in_the_transactions_table() throws SQLException {
        query = manage.getTransactions_amount_of_methods();
        rs = getStatement().executeQuery(query);
        //9164	Stripe
        //19039967.55	Cash On Delivery
    }

    @Given("Verifies the reverse sort list by payment_method for those with a total amount over {int}")
    public void verifies_the_reverse_sort_list_by_payment_method_for_those_with_a_total_amount_over(Integer int1) throws SQLException {
        LinkedHashMap<Object, String> reverseSortList = new LinkedHashMap<Object, String>();
        LinkedHashMap<Object, String> SumAmountreverseSortList = new LinkedHashMap<Object, String>();
        reverseSortList.put(9164.00, "Stripe");
        reverseSortList.put(19039967.55, "Cash On Delivery");

        while (rs.next()) {
            Double amount = rs.getDouble("sum_amount");
            String payment_method = rs.getString("payment_method");
            SumAmountreverseSortList.put(amount, payment_method);
        }
        for (int i = 0; i < SumAmountreverseSortList.size(); i++) {
            assertEquals(reverseSortList.get(i), SumAmountreverseSortList.get(i));
        }

    }

    /**
     * US_27 transactions tablosunda payment_method='Stripe' ve payment_method= 'Cash On Delivery'
     * olan verilerden description'ları benzersiz olanları listeleyiniz.
     */
    @Given("Prepare a query that returns data with unique descriptions in the transactions table")
    public void prepare_a_query_that_returns_data_with_unique_descriptions_in_the_transactions_table() throws SQLException {
        query = manage.getTransactions_distinct_payment_method();
        rs = getStatement().executeQuery(query);
        List<String> distinctPaymentMethod = new ArrayList<String>();
        List<String> exp_distinctPaymentMethod = new ArrayList<String>(Arrays.asList("Wallet Recharge by customer", "Product Sale", "ProductWise Tax Inhouse"));
        while (rs.next()) {
            String payment_method = rs.getString("description");
            distinctPaymentMethod.add(payment_method);
        }
        for (int i = 0; i < distinctPaymentMethod.size(); i++) {
            assertEquals(exp_distinctPaymentMethod.get(i), distinctPaymentMethod.get(i));
        }

    }

    @Given("Query is prepared listing the unique user_ids of the data")
    public void query_is_prepared_listing_the_unique_user_ids_of_the_data() throws SQLException {
        query = manage.getSupport_tickets_distince_id();
        rs = getStatement().executeQuery(query);
        List<Integer> Support_tickets_distince = new ArrayList<Integer>();
        while (rs.next()) {
            int user_id = rs.getInt("user_id");
            Support_tickets_distince.add(user_id);
        }
        for (int i = 0; i < Support_tickets_distince.size(); i++) {
            assertEquals(18, Support_tickets_distince.size());
        }
    }

    /**
     * Us_29 orders tablosunda ödemesi yapılmış siparişlerin (is_paid =1) ortalama grand_total degerini hesaplayıp dogrulayınız.
     */
    @Given("Query is prepared Calculate and verify the average grand_total value of paid orders")
    public void query_is_prepared_calculate_and_verify_the_average_grand_total_value_of_paid_orders() throws SQLException {
        query = manage.getOrders_is_paid();
        rs = getStatement().executeQuery(query);
        //  avg (grand_total)  '179713.22943925235'
        rs.next();
        int avgGrandTotal = (int) rs.getDouble("avg(grand_total)");
        assertEquals(179713, (avgGrandTotal));
    }

    //US_30    carts tablosunda 2024-03-30 tarinden önce  is_buy_now=1 olan ürünlerin toplam bedelini hesaplayınız
    @Given("Query is prepared Calculate and verify the total cost of products")
    public void query_is_prepared_calculate_and_verify_the_total_cost_of_products() throws SQLException {
        query = manage.getGetOrders_is_buy_now();
        rs = getStatement().executeQuery(query);
        rs.next();
        int sumTotalPrice = rs.getInt("sum(total_price)");
        assertEquals(9649, sumTotalPrice);
    }


    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        closeConnection();
    }
}
