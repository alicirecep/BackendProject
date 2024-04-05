package helperDB;

import com.github.javafaker.Faker;
import lombok.Getter;
import lombok.Setter;

public class DB_Cons {
    static Faker faker=new Faker();


    private static int id;

    private static String city;
    private static int query_type;
    private static String username;
    private static String email;
    private static String message;

    public DB_Cons(int id) {
        this.id = id;
    }

    public DB_Cons(String city) {
        this.city = city;
    }

    public DB_Cons() {
        this.id = faker.number().numberBetween(100000, 1000000);
        this.city = faker.address().cityName();
        this.query_type = faker.number().randomDigitNotZero();
        this.username=faker.name().firstName();
        this.email=faker.internet().emailAddress();
        this.message=faker.lorem().word();
    }

    // Getter metotlar
    public int getId() {
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
