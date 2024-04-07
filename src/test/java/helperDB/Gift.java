package helperDB;

import com.github.javafaker.Faker;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static helperDB.JDBC_Cons.faker;

public class Gift {
    public static  int giftCardId;
    private static String gift_name;
    private static String descriptionOne;
    private static String thumbnail_image_one;

    public static int getGiftCardId() {
        return giftCardId;
    }

    public static String getGift_name() {
        return gift_name;
    }

    public static String getDescriptionOne() {
        return descriptionOne;
    }

    public static String getThumbnail_image_one() {
        return thumbnail_image_one;
    }

    public static String getThumbnail_image_two() {
        return thumbnail_image_two;
    }

    public static Timestamp getCreated_at() {
        return created_at;
    }

    private static String thumbnail_image_two;
    private static Timestamp created_at;

    public Gift(int giftCardId, String gift_name, String descriptionOne, String thumbnail_image_one, String thumbnail_image_two, Timestamp created_at) {
        this.giftCardId = giftCardId;
        this.gift_name = gift_name;
        this.descriptionOne=descriptionOne;
        this.thumbnail_image_one=thumbnail_image_one;
        this.thumbnail_image_two=thumbnail_image_two;
        this.created_at=created_at;
    }

    public static List<Gift> generateGiftCards(int count) {
        List<Gift> giftCards = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            Gift giftCard = new Gift(  faker.number().numberBetween(800000, 10000000),
                    faker.company().name(),
                    faker.lorem().word(),
                    faker.internet().image(),
                    faker.internet().image(),
                    Timestamp.valueOf(LocalDateTime.now()));

            giftCards.add(giftCard);
        }
        return giftCards;
    }
}
