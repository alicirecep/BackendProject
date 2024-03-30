package stepdefinitions;

import config_Requirements.ConfigReader;
import io.cucumber.java.en.Given;
import io.restassured.builder.RequestSpecBuilder;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import java.util.Arrays;

import static hooks.HooksAPI.spec;

public class API_RegisterCustomerStepdefinitions {

    public static int sayi;
    public static String fullPath;
    JSONObject requestBody;

    @Given("The api user creates the base url.")
    public void the_api_user_creates_the_base_url() {
        spec = new RequestSpecBuilder().setBaseUri(ConfigReader.getProperty("base_url", "api")).build();
    }

    @Given("The api user sets {string} path parameters")
    public void the_api_user_sets_path_parameters(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

            if (value.matches("\\d+")) {  // value.matches("\\d+") burada value rakam iceriyorsa dedik
                sayi = Integer.parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
        System.out.println("sayi : " + sayi);
    }

    @Given("The api user prepares a POST request consisting of valid data to send to the api register endpoint.")
    public void the_api_user_prepares_a_post_request_consisting_of_valid_data_to_send_to_the_api_register_endpoint() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password", "123123123");
        requestBody.put("password_confirmation", "123123123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("requestBody : " + requestBody);
    }

    @Given("The api user sends a POST request and saves the response from the api register endpoint.")
    public void the_api_user_sends_a_post_request_and_saves_the_response_from_the_api_register_endpoint() {
        API_Methods.postResponse(requestBody.toString());
    }

    @Given("The api user verifies that the status code is {int}")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("The api user verifies that the message information in the response body is {string}")
    public void the_api_user_verifies_that_the_message_information_in_the_response_body_is(String message) {
        API_Methods.messageAssert(message);
    }

}
