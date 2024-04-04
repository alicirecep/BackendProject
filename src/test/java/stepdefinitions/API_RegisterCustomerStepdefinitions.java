package stepdefinitions;

import config_Requirements.ConfigReader;
import io.cucumber.java.en.Given;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import java.util.Arrays;

import static hooks.HooksAPI.spec;
import static org.junit.Assert.*;

public class API_RegisterCustomerStepdefinitions {

    public static int id;
    public static String fullPath;
    JSONObject requestBody;
    JsonPath jsonPath;


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
                id = Integer.parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
        System.out.println("sayi : " + id);
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
        System.out.println("Request Body : " + requestBody);
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

    @Given("The api user confirms that the customer record has been created.")
    public void the_api_user_confirms_that_the_customer_record_has_been_created() { //195
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(ConfigReader.getProperty("customerEmail", "api"), jsonPath.getString("user[195].email"));
    }

    @Given("The api user verifies that the data in the response returned from the api register endpoint matches the data sent in the request body.")
    public void the_api_user_verifies_that_the_data_in_the_response_returned_from_the_api_register_endpoint_matches_the_data_sent_in_the_request_body() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(requestBody.get("first_name"), jsonPath.getString("user.first_name"));
        assertEquals(requestBody.get("last_name"), jsonPath.getString("user.last_name"));
        assertEquals(requestBody.get("email"), jsonPath.getString("user.email"));
    }

    @Given("The api user prepares a POST request to send to the api register endpoint using an invalid email.")
    public void the_api_user_prepares_a_post_request_to_send_to_the_api_register_endpoint_using_an_invalid_email() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password", "123123123");
        requestBody.put("password_confirmation", "123123123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request with a missing email to send to the api register endpoint.")
    public void the_api_user_prepares_a_post_request_with_a_missing_email_to_send_to_the_api_register_endpoint() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("password", "123123123");
        requestBody.put("password_confirmation", "123123123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request with a missing password to send to the api register endpoint.")
    public void the_api_user_prepares_a_post_request_with_a_missing_password_to_send_to_the_api_register_endpoint() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password_confirmation", "123123123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request with mismatched password and password confirmation to send to the api register endpoint.")
    public void the_api_user_prepares_a_post_request_with_mismatched_password_and_password_confirmation_to_send_to_the_api_register_endpoint() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password", "123123123");
        requestBody.put("password_confirmation", "123123123111");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("Request Body : " + requestBody);
    }

    @Given("The api user prepares a POST request with a password containing fewer than '8' characters to send to the api register endpoint.")
    public void the_api_user_prepares_a_post_request_with_a_password_containing_fewer_than_characters_to_send_to_the_api_register_endpoint() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password", "123");
        requestBody.put("password_confirmation", "123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("Request Body : " + requestBody);
    }
}
