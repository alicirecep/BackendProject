package helperDB;

import com.github.javafaker.Faker;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;

public class JDBC_Cons {
    static Faker faker=new Faker();
   public static int[] result;
    public static int count;
    public static List<Integer>guest_order_details_order_id_List=new ArrayList<Integer>();
    private static String guest_order_details_order_shipping_name;

    private static int id;
    private static int users_table_id;
    private static Integer year;
    private static String shipping_address;
    private static int userid;

    private static String city;
    private static int query_type;
    private static String username;
    private static String email;
    private static String message;

    public JDBC_Cons(int id) {
        this.id = id;
    }

    public JDBC_Cons(String city) {
        this.city = city;
    }

    public JDBC_Cons() {
        this.id = faker.number().numberBetween(100000, 1000000);
        this.city = faker.address().cityName();
        this.query_type = faker.number().randomDigitNotZero();
        this.username=faker.name().firstName();
        this.email=faker.internet().emailAddress();
        this.message=faker.lorem().word();
    }

    public static int getUserid() {
        userid = faker.random().nextInt(10,1000);
        return userid;
    }

    public String getGuest_order_details_order_shipping_name() {
        this.guest_order_details_order_shipping_name=faker.name().firstName();
        return guest_order_details_order_shipping_name;
    }

    public int setUsers_table_id(int users_table_id) {
        this.users_table_id = users_table_id;
        return users_table_id;
    }

    public String setShipping_address(String shipping_address) {
        this.shipping_address = shipping_address;
        return shipping_address;
    }

    // Getter metotlar
    public static int getId() {
        return id;
    }

    public String getCity() {
        return city;
    }
    public int getQuery_type(){
        return query_type;
    }
    public String getUsername(){
        return username;
    }
    public String getMessage(){
        return message;
    }
    public String getEmail(){
        return email;
    }

    // Setter method



}
