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

    @Given("The api user verifies that the data in the response body, such as {string}, {string}, {string}, matches the information of the logged in user in the system.")
    public void the_api_user_verifies_that_the_data_in_the_response_body_such_as_matches_the_information_of_the_logged_in_user_in_the_system(String first_name, String last_name, String email) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(first_name, jsonPath.getString("user.first_name"));
        assertEquals(last_name, jsonPath.getString("user.last_name"));
        assertEquals(email, jsonPath.getString("user.email"));
    }

    @Given("The api user saves the response returned from the api customerGetUser endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_customer_get_user_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage","api")));
    }
    // ***************************************************************************************************************

    //************************************* api/profile/get-customer-data ********************************************

    @Given("The api user saves the response returned from the api profile get customer data endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_profile_get_customer_data_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the content of the data {int}, {int}, {int}, {int}, {int} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int wallet_running_balance, int wallet_pending_balance, int total_coupon, int total_wishlist, int total_cancel_order) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(wallet_running_balance, jsonPath.getInt("wallet_running_balance"));
        assertEquals(wallet_pending_balance, jsonPath.getInt("wallet_pending_balance"));
        assertEquals(total_coupon, jsonPath.getInt("total_coupon"));
        assertEquals(total_wishlist, jsonPath.getInt("total_wishlist"));
        assertEquals(total_cancel_order, jsonPath.getInt("total_cancel_order"));
    }

    @Given("The api user saves the response returned from the api profile get customer data endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_profile_get_customer_data_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage","api")));
    }
    // ***************************************************************************************************************

    //****************************************** api/change-password *************************************************
    @Given("The api user prepares a POST request containing the data {string}, {string}, and {string} to send to the api changePassword endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_data_and_to_send_to_the_api_change_password_endpoint(String old_password, String password, String password_confirmation) {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", old_password);
        requestBodyMap.put("password", password);
        requestBodyMap.put("password_confirmation", password_confirmation);
        System.out.println("Request Body : " + requestBodyMap);
    }

    @Given("The api user sends the POST request and saves the response returned from the api change password endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_change_password_endpoint() {
        API_Methods.postResponse(requestBodyMap);
    }

    @Given("The api user prepares a POST request containing the incorrect {string} and correct {string} and {string} to send to the api changePassword endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_incorrect_and_correct_and_to_send_to_the_api_change_password_endpoint(String old_password, String password, String password_confirmation) {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", old_password);
        requestBodyMap.put("password", password);
        requestBodyMap.put("password_confirmation", password_confirmation);
        System.out.println("Request Body : " + requestBodyMap);
    }

    @Given("The api user prepares a POST request containing the correct {string} and {string}, but with {string} information that does not match, to send to the api changePassword endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_correct_and_but_with_information_that_does_not_match_to_send_to_the_api_change_password_endpoint(String old_password, String password, String password_confirmation) {
        requestBodyMap = new HashMap<>();
        requestBodyMap.put("old_password", old_password);
        requestBodyMap.put("password", password);
        requestBodyMap.put("password_confirmation", password_confirmation);
        System.out.println("Request Body : " + requestBodyMap);
    }
    // ***************************************************************************************************************
}
