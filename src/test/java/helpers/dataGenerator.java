package helpers;

import com.github.javafaker.Faker;
import java.util.Random;

public class dataGenerator {

    private static final Faker faker = new Faker();
    private static final Random random = new Random();

    public static String getRandomCampaignName() {
        return faker.company().name();
    }

    public static String getRandomCampaignStatus() {
        String[] statuses = {"active", "inactive", "paused"};
        return statuses[random.nextInt(statuses.length)];
    }

    public static String getRandomZipCode() {
        return faker.address().zipCode();
    }

    public static int getRandomBuyerId() {
        return faker.number().numberBetween(1, 10000);
    }

}
