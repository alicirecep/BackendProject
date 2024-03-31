package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import utilities.API_Utilities.API_Methods;


import java.util.HashMap;

import static org.junit.Assert.*;

public class API_CustomerStepdefinitions {

    JsonPath jsonPath;
    HashMap<String, Object> requestBodyMap;

    //************************************* api/customerGetUser ***************************************************
    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user saves the response returned from the api customerGetUser endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_customer_get_user_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies that the data in the returned response body matches the information of the logged in user in the system.")
    public void the_api_user_verifies_that_the_data_in_the_returned_response_body_matches_the_information_of_the_logged_in_user_in_the_system() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals("aleynadilan", jsonPath.getString("user.first_name"));
        assertEquals("ciftcier", jsonPath.getString("user.last_name"));
        assertEquals("dilannciftcier@buysellcycle.com", jsonPath.getString("user.email"));
    }

    @Given("The api user saves the response returned from the api customerGetUser endpoint and confirms that the status code is '401' and the message is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_customer_get_user_endpoint_and_confirms_that_the_status_code_is_and_the_message_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //************************************* api/profile/get-customer-data ********************************************

    @Given("The api user saves the response returned from the api profile get customer data endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_profile_get_customer_data_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the data in the response body returned from the api profile get customer data endpoint.")
    public void the_api_user_verifies_the_data_in_the_response_body_returned_from_the_api_profile_get_customer_data_endpoint() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(0, jsonPath.getInt("wallet_running_balance"));
        assertEquals(0, jsonPath.getInt("wallet_pending_balance"));
        assertEquals(0, jsonPath.getInt("total_coupon"));
        assertEquals(0, jsonPath.getInt("total_wishlist"));
        assertEquals(0, jsonPath.getInt("total_cancel_order"));
    }


    @Given("The api user saves the response returned from the api profile get customer data endpoint and confirms that the status code is '401' and the message is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_profile_get_customer_data_endpoint_and_confirms_that_the_status_code_is_and_the_message_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //****************************************** api/change-password *************************************************
    @Given("The api user prepares a POST request with correct data to send to the api change password endpoint.")
    public void the_api_user_prepares_a_post_request_with_correct_data_to_send_to_the_api_change_password_endpoint() {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", ConfigReader.getProperty("customerPassword", "api"));
        requestBodyMap.put("password", "12345678");
        requestBodyMap.put("password_confirmation", "12345678");
        System.out.println("requestBodyMap : " + requestBodyMap);
    }

    @Given("The api user sends the POST request and saves the response returned from the api change password endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_change_password_endpoint() {
        API_Methods.postResponse(requestBodyMap);
    }

    @Given("The api user prepares a POST request with an incorrect old password to send to the api change password endpoint.")
    public void the_api_user_prepares_a_post_request_with_an_incorrect_old_password_to_send_to_the_api_change_password_endpoint() {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", "123A");
        requestBodyMap.put("password", "12345678");
        requestBodyMap.put("password_confirmation", "12345678");
        System.out.println("requestBodyMap : " + requestBodyMap);
    }

    @Given("The api user prepares a POST request with mismatched password and password confirmation to send to the api change password endpoint.")
    public void the_api_user_prepares_a_post_request_with_mismatched_password_and_password_confirmation_to_send_to_the_api_change_password_endpoint() {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", ConfigReader.getProperty("customerPassword", "api"));
        requestBodyMap.put("password", "12345678");
        requestBodyMap.put("password_confirmation", "12345678A1");
        System.out.println("requestBodyMap : " + requestBodyMap);
    }
    // ***************************************************************************************************************
}
