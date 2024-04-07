package helperDB;

import com.github.javafaker.Faker;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DeviceToken {

    private String device_token;
    private int device_id;
    private int device_userID;
    private Timestamp created_at;
    static Faker faker = new Faker();


    public String getDevice_token() {
        return device_token;
    }
    public int getDevice_id() {
        return device_id;
    }


    public int getDevice_userID() {
        return device_userID;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public DeviceToken(int device_id, int device_userID, String device_token, Timestamp created_at) {
        this.device_token = device_token;
        this.device_id = device_id;
        this.device_userID = device_userID;
        this.created_at = created_at;
    }

    public static List<DeviceToken> getDeviceTokens() {
        return List.of(
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now())),
                new DeviceToken(faker.number().numberBetween(100, 10000), faker.number().numberBetween(50, 5000), faker.lorem().word(), Timestamp.valueOf(LocalDateTime.now()))
        );
    }
    public static List<DeviceToken> generateDeviceTokens(int count) {
        List<DeviceToken> deviceTokens = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            DeviceToken deviceToken = new DeviceToken(
                    faker.number().numberBetween(100, 10000),
                    faker.number().numberBetween(50, 5000),
                    faker.lorem().word(),
                    Timestamp.valueOf(LocalDateTime.now())
            );
            deviceTokens.add(deviceToken);
        }
        return deviceTokens;
    }
}


