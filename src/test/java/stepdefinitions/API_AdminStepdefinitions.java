package stepdefinitions;

import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;

import static org.junit.Assert.*;

public class API_AdminStepdefinitions {

    JSONObject requestJsonObject;
    HashMap<String, Object> requestMap;
    JsonPath jsonPath;
    HashMap<String, Object> responseMap;

    //******************************************* api/get-users ******************************************************
    @Given("The api user saves the response returned from the api get users endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_users_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the information of the data at the index {int} in the response body, including {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_of_the_data_at_the_index_in_the_response_body_including(int dataIndex, String first_name, String username, String email, String name) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(first_name, jsonPath.getString("user[" + dataIndex + "].first_name"));
        assertEquals(username, jsonPath.getString("user[" + dataIndex + "].username"));
        assertEquals(email, jsonPath.getString("user[" + dataIndex + "].email"));
        assertTrue(jsonPath.getString("user[" + dataIndex + "].name").contains(name));
    }

    @Given("The api user saves the response returned from the api get users endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_users_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_Unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //****************************************** api/holidayList ****************************************************
    @Given("The api user saves the response returned from the api holidayList endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the information of the data at index {int} in the response body, including {string} and {string}.")
    public void the_api_user_verifies_the_information_of_the_data_at_index_in_the_response_body_including_and(int dataIndex, String year, String name) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(year, jsonPath.getString("holiday[" + dataIndex + "].year"));
        assertEquals(name, jsonPath.getString("holiday[" + dataIndex + "].name"));
    }

    @Given("The api user saves the response returned from the api holidayList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_list_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //****************************************** api/holidayDetails **************************************************
    @Given("The api user prepares a GET request containing the holiday {string} for which details are to be accessed, to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_holiday_for_which_details_are_to_be_accessed_to_send_to_the_api_holiday_details_endpoint(String id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a GET request and saves the response returned from the api holidayDetails endpoint.")
    public void the_api_user_sends_a_get_request_and_saves_the_response_returned_from_the_api_holiday_details_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String year, String name, int type, String date, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("holiday details[0].id"));
        assertEquals(year, jsonPath.getString("holiday details[0].year"));
        assertEquals(name, jsonPath.getString("holiday details[0].name"));
        assertEquals(type, jsonPath.getInt("holiday details[0].type"));
        assertEquals(date, jsonPath.getString("holiday details[0].date"));
        assertEquals(created_at, jsonPath.getString("holiday details[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("holiday details[0].updated_at"));

    }

    @Given("The api user prepares a GET request containing the holiday ids that are not present in the system to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_holiday_ids_that_are_not_present_in_the_system_to_send_to_the_api_holiday_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 255);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //******************************************** api/holidayAdd ****************************************************
    @Given("The api user prepares a POST request containing the necessary holiday data to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_necessary_holiday_data_to_send_to_the_api_holiday_add_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("year", "2024");
        requestMap.put("name", "29 Ekim Cumhuriyet Bayramı");
        requestMap.put("date", "2024-10-29");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the POST request and saves the response returned from the api holidayAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_holiday_add_endpoint() {
        API_Methods.postResponse(requestMap);
    }

    @Given("The api user prepares a POST request containing the registered holiday data to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_registered_holiday_data_to_send_to_the_api_holiday_add_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("year", "2024");
        requestMap.put("name", "29 Ekim Cumhuriyet Bayramı");
        requestMap.put("date", "2024-10-29");
        System.out.println("Request Body : " + requestMap);
    }
    // ***************************************************************************************************************

    //******************************************** api/holidayUpdate/{id} ****************************************************
    @Given("The api user prepares a PATCH request containing the updated holiday data to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_updated_holiday_data_to_send_to_the_api_holiday_update_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("year", "2025");
        requestMap.put("name", "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı");
        requestMap.put("date", "2025-04-23");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_holiday_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user prepares a PATCH request containing the holiday data that matches the previous records to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_holiday_data_that_matches_the_previous_records_to_send_to_the_api_holiday_update_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("year", "2025");
        requestMap.put("name", "23 Nisan Ulusal Egemenlik ve Çocuk Bayramı");
        requestMap.put("date", "2025-04-23");
        System.out.println("Request Body : " + requestMap);
    }
    // ***************************************************************************************************************

    //****************************************** api/holidayDelete ***************************************************
    @Given("The api user prepares a DELETE request containing the holiday ids to be deleted to send to the api holidayDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_holiday_ids_to_be_deleted_to_send_to_the_api_holiday_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", "37");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api holidayDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_holiday_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the holiday ids that are not present in the system to send to the api holidayDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_holiday_ids_that_are_not_present_in_the_system_to_send_to_the_api_holiday_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", "125");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api holidayDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        responseMap = API_Methods.response.as(HashMap.class);

        double responseValue = (double) responseMap.get("Deleted Id");
        int intValue = (int) responseValue;
        String deletedId = String.valueOf(intValue);

        assertEquals(requestMap.get("id"), deletedId);
    }

    @Given("The api user prepares a GET request containing the Deleted id to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_id_to_send_to_the_api_holiday_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 37);
        System.out.println("Request Body : " + requestJsonObject);
    }
    // ***************************************************************************************************************

    //********************************************* api/faqsList *****************************************************
    @Given("The api user saves the response returned from the api faqsList endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the {string} information of the data at index {int} in the response body.")
    public void the_api_user_verifies_the_information_of_the_data_at_index_in_the_response_body(String title, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();

        assertTrue(jsonPath.getString("Faqs[" + dataIndex + "].title").contains(title));
    }

    @Given("The api user saves the response returned from the api faqsList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_list_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //******************************************* api/faqsDetails ****************************************************
    @Given("The api user prepares a GET request containing the FAQ {string} for which details are to be accessed, to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_faq_for_which_details_are_to_be_accessed_to_send_to_the_api_faqs_details_endpoint(String id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a GET request and saves the response returned from the api faqsDetails endpoint.")
    public void the_api_user_sends_a_get_request_and_saves_the_response_returned_from_the_api_faqs_details_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String title, String description, int status, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("Faqs details[0].id"));
        assertNull(jsonPath.get("Faqs details[0].user_id"));
        assertEquals(title, jsonPath.getString("Faqs details[0].title"));
        assertTrue(jsonPath.getString("Faqs details[0].description").contains(description));
        assertEquals(status, jsonPath.getInt("Faqs details[0].status"));
        assertEquals(created_at, jsonPath.getString("Faqs details[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("Faqs details[0].updated_at"));
    }

    @Given("The api user prepares a GET request containing the FAQ ids that are not present in the system to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_faq_ids_that_are_not_present_in_the_system_to_send_to_the_api_faqs_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 256);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //******************************************* api/faqsDetails ****************************************************
    @Given("The api user prepares a POST request containing the necessary information to send to the api faqsAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_necessary_information_to_send_to_the_api_faqs_add_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("title","How does the site work?");
        requestJsonObject.put("description","Select your items, add them to your cart, provide your address and choose the delivery time, then complete the order. There you go, your shopping is done!");
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the POST request and saves the response returned from the api faqsAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_faqs_add_endpoint() {
        API_Methods.postResponse(requestJsonObject.toString());
    }
    // ***************************************************************************************************************
}
