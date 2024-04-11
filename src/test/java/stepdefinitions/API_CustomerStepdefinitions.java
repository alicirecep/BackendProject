package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import pojos.CustomerAddAdressPojo;
import utilities.API_Utilities.API_Methods;


import java.util.HashMap;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;

public class API_CustomerStepdefinitions {

    JsonPath jsonPath;
    HashMap<String, Object> requestBodyMap;
    JSONObject requestJsonObject;
    CustomerAddAdressPojo requestAddAdressPojo;

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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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

    //************************************* api/profile/address-list *************************************************
    @Given("The api user saves the response returned from the api profile address list endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_profile_address_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string} information of the item at the {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_of_the_item_at_the_index_in_the_response_body(int customer_id, String name, String email, String phone, String address, String city, String state, String country, String postal_code, int is_shipping_default, int is_billing_default, String created_at, String updated_at, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(customer_id, jsonPath.getInt("addresses[" + dataIndex + "].customer_id"));
        assertEquals(name, jsonPath.getString("addresses[" + dataIndex + "].name"));
        assertEquals(email, jsonPath.getString("addresses[" + dataIndex + "].email"));
        assertEquals(phone, jsonPath.getString("addresses[" + dataIndex + "].phone"));
        assertEquals(address, jsonPath.getString("addresses[" + dataIndex + "].address"));
        assertEquals(city, jsonPath.getString("addresses[" + dataIndex + "].city"));
        assertEquals(state, jsonPath.getString("addresses[" + dataIndex + "].state"));
        assertEquals(country, jsonPath.getString("addresses[" + dataIndex + "].country"));
        assertEquals(postal_code, jsonPath.getString("addresses[" + dataIndex + "].postal_code"));
        assertEquals(is_shipping_default, jsonPath.getInt("addresses[" + dataIndex + "].is_shipping_default"));
        assertEquals(is_billing_default, jsonPath.getInt("addresses[" + dataIndex + "].is_billing_default"));
        assertEquals(created_at, jsonPath.getString("addresses[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("addresses[" + dataIndex + "].updated_at"));
    }

    @Given("The api user records the response from the api profile address list endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_records_the_response_from_the_api_profile_address_list_endpoint_confirming_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //********************************* api/profile/customerDetailsAddress *******************************************
    @Given("The api user prepares a GET request containing the address {int} to be accessed for the api profile customerDetailsAddress endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_address_to_be_accessed_for_the_api_profile_customer_details_address_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the GET request and records the response returned from the api profile customerDetailsAddress endpoint.")
    public void the_api_user_sends_the_get_request_and_records_the_response_returned_from_the_api_profile_customer_details_address_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies the content of the response body, including the data with the fields {int}, {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {int}, {int}, {string} and {string}.")
    public void the_api_user_verifies_the_content_of_the_response_body_including_the_data_with_the_fields_and(int id, int customer_id, String name, String email, String phone, String address, String city, String state, String country, String postal_code, int is_shipping_default, int is_billing_default, String created_at, String updated_at) {
        API_Methods.response.then()
                .assertThat()
                .body("addresses[0].id", equalTo(id),
                        "addresses[0].customer_id", equalTo(customer_id),
                        "addresses[0].name", equalTo(name),
                        "addresses[0].email", equalTo(email),
                        "addresses[0].phone", equalTo(phone),
                        "addresses[0].address", equalTo(address),
                        "addresses[0].city", equalTo(city),
                        "addresses[0].state", equalTo(state),
                        "addresses[0].country", equalTo(country),
                        "addresses[0].postal_code", equalTo(postal_code),
                        "addresses[0].is_shipping_default", equalTo(is_shipping_default),
                        "addresses[0].is_billing_default", equalTo(is_billing_default),
                        "addresses[0].created_at", equalTo(created_at),
                        "addresses[0].updated_at", equalTo(updated_at));
    }

    @Given("The api user prepares a GET request containing the non-existing address {int} to send to the api profile customerDetailsAddress endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_non_existing_address_to_send_to_the_api_profile_customer_details_address_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user records the response from the api profile customerDetailsAddress endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_records_the_response_from_the_api_profile_customer_details_address_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user records the response from the api profile customerDetailsAddress endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_records_the_response_from_the_api_profile_customer_details_address_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //************************************** api/profile/address-store ***********************************************
    @Given("The api user prepares a POST request containing the {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} and {string} information to send to the api profile address store endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_profile_address_store_endpoint(String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        requestAddAdressPojo = new CustomerAddAdressPojo(name, email, address, phone, city, state, country, postal_code, address_type);
        System.out.println("Request Body : " + requestAddAdressPojo);
    }

    @Given("The api user sends a POST request and records the response from the api profile address store endpoint.")
    public void the_api_user_sends_a_post_request_and_records_the_response_from_the_api_profile_address_store_endpoint() {
        API_Methods.postResponse(requestAddAdressPojo);
    }

    @Given("The api user prepares a POST request containing invalid {string} and {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} information to send to the api profile address store endpoint.")
    public void the_api_user_prepares_a_post_request_containing_invalid_and_information_to_send_to_the_api_profile_address_store_endpoint(String email, String name, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        requestAddAdressPojo = new CustomerAddAdressPojo(name, email, address, phone, city, state, country, postal_code, address_type);
        System.out.println("Request Body : " + requestAddAdressPojo);
    }
    // ***************************************************************************************************************
}
