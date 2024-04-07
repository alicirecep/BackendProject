package stepdefinitions;

import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import java.util.HashMap;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;
import static stepdefinitions.API_RegisterCustomerStepdefinitions.id;

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

    //******************************************* api/get-user *******************************************************
    @Given("The api user prepares a GET request containing the customer {int} for which details are to be accessed, to send to the api get User endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_customer_for_which_details_are_to_be_accessed_to_send_to_the_api_get_user_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a GET request and saves the response returned from the api get User endpoint.")
    public void the_api_user_sends_a_get_request_and_saves_the_response_returned_from_the_api_get_user_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies the content of the data {int}, {string}, {string}, {int}, {string}, {int}, {int}, {string}, {int}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String first_name, String last_name, int role_id, String email, int is_verified, int is_active, String lang_code, int currency_id, String currency_code, String name) {
        API_Methods.response
                .then()
                .assertThat()
                .body("user.id", equalTo(id),
                        "user.first_name", equalTo(first_name),
                        "user.last_name", equalTo(last_name),
                        "user.role_id", equalTo(role_id),
                        "user.email", equalTo(email),
                        "user.is_verified", equalTo(is_verified),
                        "user.is_active", equalTo(is_active),
                        "user.lang_code", equalTo(lang_code),
                        "user.currency_id", equalTo(currency_id),
                        "user.currency_code", equalTo(currency_code),
                        "user.name", equalTo(name));
    }

    @Given("The api user prepares a GET request containing the incorrect customer {int} to send to the api get User endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_incorrect_customer_to_send_to_the_api_get_user_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user saves the response returned from the api get User endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_user_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api get User endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_user_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 401, reason phrase: Unauthorized"));

    }
    // ***************************************************************************************************************

    //****************************************** api/holidayList *****************************************************
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
    @Given("The api user prepares a GET request containing the holiday {int} for which details are to be accessed, to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_holiday_for_which_details_are_to_be_accessed_to_send_to_the_api_holiday_details_endpoint(int id) {
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

        assertEquals(id, jsonPath.getInt("holidayDetails[0].id"));
        assertEquals(year, jsonPath.getString("holidayDetails[0].year"));
        assertEquals(name, jsonPath.getString("holidayDetails[0].name"));
        assertEquals(type, jsonPath.getInt("holidayDetails[0].type"));
        assertEquals(date, jsonPath.getString("holidayDetails[0].date"));
        assertEquals(created_at, jsonPath.getString("holidayDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("holidayDetails[0].updated_at"));
    }

    @Given("The api user prepares a GET request containing the holiday {int} that are not present in the system to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_holiday_that_are_not_present_in_the_system_to_send_to_the_api_holiday_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
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
    @Given("The api user prepares a POST request containing the {string}, {string}, and {string} data to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_data_to_send_to_the_api_holiday_add_endpoint(String year, String name, String date) {
        requestMap = new HashMap<>();
        requestMap.put("year", year);
        requestMap.put("name", name);
        requestMap.put("date", date);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the POST request and saves the response returned from the api holidayAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_holiday_add_endpoint() {
        API_Methods.postResponse(requestMap);
    }

    @Given("The api user prepares a POST request containing the registered {string}, {string}, and {string} data to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_registered_and_data_to_send_to_the_api_holiday_add_endpoint(String year, String name, String date) {
        requestMap = new HashMap<>();
        requestMap.put("year", year);
        requestMap.put("name", name);
        requestMap.put("date", date);
        System.out.println("Request Body : " + requestMap);
    }
    // ***************************************************************************************************************

    //******************************************** api/holidayUpdate/{id} ****************************************************
    @Given("The api user prepares a PATCH request containing the {string}, {string}, and {string} data to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_data_to_send_to_the_api_holiday_update_endpoint(String year, String name, String date) {
        requestMap = new HashMap<>();
        requestMap.put("year", year);
        requestMap.put("name", name);
        requestMap.put("date", date);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api holidayUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_holiday_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user prepares a PATCH request containing the {string}, {string}, and {string} data that matches the previous records to send to the api holidayUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_data_that_matches_the_previous_records_to_send_to_the_api_holiday_update_endpoint(String year, String name, String date) {
        requestMap = new HashMap<>();
        requestMap.put("year", year);
        requestMap.put("name", name);
        requestMap.put("date", date);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api holidayUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user verifies that the name information in the response body is {string}.")
    public void the_api_user_verifies_that_the_name_information_in_the_response_body_is(String nameValue) {
        API_Methods.response
                .then()
                .assertThat()
                .body("holidayDetails[0].name", equalTo(nameValue));
    }
    // ***************************************************************************************************************

    //****************************************** api/holidayDelete ***************************************************
    @Given("The api user prepares a DELETE request containing the holiday {int} to be deleted to send to the api holidayDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_holiday_to_be_deleted_to_send_to_the_api_holiday_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api holidayDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_holiday_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the holiday {int} that are not present in the system to send to the api holidayDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_holiday_that_are_not_present_in_the_system_to_send_to_the_api_holiday_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api holidayDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 404, reason phrase: Not Found"));

    }

    @Given("The api user saves the response returned from the api holidayDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        responseMap = API_Methods.response.as(HashMap.class);

        double responseValue = (double) responseMap.get("Deleted_Id");
        int deletedId = (int) responseValue;

        assertEquals(requestMap.get("id"), deletedId);
    }

    @Given("The api user prepares a GET request containing the Deleted {int} to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_to_send_to_the_api_holiday_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
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
    @Given("The api user prepares a GET request containing the FAQ {int} for which details are to be accessed, to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_faq_for_which_details_are_to_be_accessed_to_send_to_the_api_faqs_details_endpoint(int id) {
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

        assertEquals(id, jsonPath.getInt("FaqsDetails[0].id"));
        assertNull(jsonPath.get("FaqsDetails[0].user_id"));
        assertTrue(jsonPath.getString("FaqsDetails[0].title").contains(title));
        assertTrue(jsonPath.getString("FaqsDetails[0].description").contains(description));
        assertEquals(status, jsonPath.getInt("FaqsDetails[0].status"));
        assertEquals(created_at, jsonPath.getString("FaqsDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("FaqsDetails[0].updated_at"));
    }

    @Given("The api user prepares a GET request containing the FAQ {int} that are not present in the system to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_faq_that_are_not_present_in_the_system_to_send_to_the_api_faqs_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
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
        requestJsonObject.put("title", "How does the site work?");
        requestJsonObject.put("description", "Select your items, add them to your cart, provide your address and choose the delivery time, then complete the order. There you go, your shopping is done!");
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the POST request and saves the response returned from the api faqsAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_faqs_add_endpoint() {
        API_Methods.postResponse(requestJsonObject.toString());
    }
    // ***************************************************************************************************************

    //***************************************** api/faqsUpdate/{id} **************************************************
    @Given("The api user prepares a PATCH request containing the title information to send to the api faqsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_title_information_to_send_to_the_api_faqs_update_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("title", "How do I know when my order is here?");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api faqsUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_faqs_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user prepares a PATCH request containing the title and description information to send to the api faqsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_title_and_description_information_to_send_to_the_api_faqs_update_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("title", "How do I know when my order is here?");
        requestMap.put("description", "A representative will call you as soon as they are at your house to let you know about your delivery.");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.")
    public void the_api_user_verifies_that_the_updated_id_information_in_the_response_body_matches_the_id_path_parameter_specified_in_the_endpoint() {
        responseMap = API_Methods.response.as(HashMap.class);

        double responseValue = (double) responseMap.get("updated_Id");
        int updatedId = (int) responseValue;

        assertEquals(id, updatedId);
    }

    @Given("The api user verifies that the title information in the response body is {string}.")
    public void the_api_user_verifies_that_the_title_information_in_the_response_body_is(String titleValue) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(titleValue, jsonPath.getString("FaqsDetails[0].title"));
    }
    // ***************************************************************************************************************

    //******************************************** api/faqsDelete ****************************************************
    @Given("The api user prepares a DELETE request containing the FAQ ids to be deleted to send to the api faqsDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_faq_ids_to_be_deleted_to_send_to_the_api_faqs_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", 22);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api faqsDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_faqs_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the FAQ ids that are not present in the system to send to the api faqsDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_faq_ids_that_are_not_present_in_the_system_to_send_to_the_api_faqs_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", 256);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user prepares a GET request containing the Deleted id to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_id_to_send_to_the_api_faqs_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 22);
        System.out.println("Request Body : " + requestJsonObject);
    }
    // ***************************************************************************************************************

    //**************************************** api/refundReasonList **************************************************
    @Given("The api user saves the response returned from the api refundReasonList endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user validates the {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(String reason, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(reason, jsonPath.getString("refundReason[" + dataIndex + "].reason"));
    }

    @Given("The api user saves the response returned from the api refundReasonList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_list_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //************************************** api/refundReasonDetails *************************************************
    @Given("The api user prepares a GET request containing the refund reason {int} for which details are to be accessed, to send to the api refundReasonDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_refund_reason_for_which_details_are_to_be_accessed_to_send_to_the_api_refund_reason_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a GET request and saves the response returned from the api refundReasonDetails endpoint.")
    public void the_api_user_sends_a_get_request_and_saves_the_response_returned_from_the_api_refund_reason_details_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies the content of the data {int}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String reason, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("refundReasonDetails[0].id"));
        assertEquals(reason, jsonPath.getString("refundReasonDetails[0].reason"));
        assertEquals(created_at, jsonPath.getString("refundReasonDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("refundReasonDetails[0].updated_at"));
    }

    @Given("The api user prepares a GET request containing the refund reason ids that are not present in the system to send to the api refundReasonDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_refund_reason_ids_that_are_not_present_in_the_system_to_send_to_the_api_refund_reason_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 256);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************

    //****************************************** api/refundReasonAdd *************************************************
    @Given("The api user prepares a POST request containing the necessary information to send to the api refundReasonAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_necessary_information_to_send_to_the_api_refund_reason_add_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("reason", "product mismatch");
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the POST request and saves the response returned from the api refundReasonAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_refund_reason_add_endpoint() {
        API_Methods.postResponse(requestJsonObject.toString());
    }
    // ***************************************************************************************************************

    //************************************** api/refundReasonUpdate/{id} *********************************************
    @Given("The api user prepares a PATCH request containing the necessary data to send to the api refundReasonUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_necessary_data_to_send_to_the_api_refund_reason_update_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("reason", "Product arrived lately");
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api refundReasonUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_refund_reason_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user saves the response returned from the api refundReasonUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api refundReasonUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user verifies that the reason information in the response body is {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body_is(String reasonValue) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(reasonValue, jsonPath.getString("refundReasonDetails[0].reason"));
    }
    // ***************************************************************************************************************

    //***************************************** api/refundReasonDelete ***********************************************
    @Given("The api user prepares a DELETE request containing the refund reason ids to be deleted to send to the api refundReasonDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_refund_reason_ids_to_be_deleted_to_send_to_the_api_refund_reason_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", 18);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api refundReasonDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the refund reason ids that are not present in the system to send to the api refundReasonDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_refund_reason_ids_that_are_not_present_in_the_system_to_send_to_the_api_refund_reason_delete_endpoint() {
        requestMap = new HashMap<>();
        requestMap.put("id", 356);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api refundReasonDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api refundReasonDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("The api user prepares a GET request containing the Deleted id to send to the api refundReasonDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_id_to_send_to_the_api_refund_reason_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 18);
        System.out.println("Request Body : " + requestJsonObject);
    }
    // ***************************************************************************************************************
}
