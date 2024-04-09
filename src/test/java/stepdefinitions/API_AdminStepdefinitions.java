package stepdefinitions;

import config_Requirements.ConfigReader;
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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api get User endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_user_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));

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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));

    }

    @Given("The api user saves the response returned from the api holidayDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api faqsDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //******************************************** api/faqsAdd *******************************************************
    @Given("The api user prepares a POST request containing the {string} and {string} information to send to the api faqsAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_faqs_add_endpoint(String title, String description) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("title", title);
        requestJsonObject.put("description", description);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the POST request and saves the response returned from the api faqsAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_faqs_add_endpoint() {
        API_Methods.postResponse(requestJsonObject.toString());
    }
    // ***************************************************************************************************************

    //***************************************** api/faqsUpdate/{id} **************************************************
    @Given("The api user prepares a PATCH request containing the {string} data to send to the api faqsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_faqs_update_endpoint(String title) {
        requestMap = new HashMap<>();
        requestMap.put("title", title);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api faqsUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_faqs_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user prepares a PATCH request containing the {string} and {string} information to send to the api faqsUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_information_to_send_to_the_api_faqs_update_endpoint(String title, String description) {
        requestMap = new HashMap<>();
        requestMap.put("title", title);
        requestMap.put("description", description);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api faqsUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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
    @Given("The api user prepares a DELETE request containing the FAQ {int} to be deleted to send to the api faqsDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_faq_to_be_deleted_to_send_to_the_api_faqs_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api faqsDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_faqs_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the FAQ {int} that are not present in the system to send to the api faqsDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_faq_that_are_not_present_in_the_system_to_send_to_the_api_faqs_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api faqsDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_faqs_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }

    @Given("The api user prepares a GET request containing the Deleted {int} to send to the api faqsDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_to_send_to_the_api_faqs_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
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
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
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

    @Given("The api user prepares a GET request containing the refund reason {int} that are not present in the system to send to the api refundReasonDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_refund_reason_that_are_not_present_in_the_system_to_send_to_the_api_refund_reason_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api refundReasonDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //****************************************** api/refundReasonAdd *************************************************
    @Given("The api user prepares a POST request containing the {string} information to send to the api refundReasonAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_refund_reason_add_endpoint(String reason) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("reason", reason);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the POST request and saves the response returned from the api refundReasonAdd endpoint.")
    public void the_api_user_sends_the_post_request_and_saves_the_response_returned_from_the_api_refund_reason_add_endpoint() {
        API_Methods.postResponse(requestJsonObject.toString());
    }
    // ***************************************************************************************************************

    //************************************** api/refundReasonUpdate/{id} *********************************************
    @Given("The api user prepares a PATCH request containing the {string} data to send to the api refundReasonUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_refund_reason_update_endpoint(String reason) {
        requestMap = new HashMap<>();
        requestMap.put("reason", reason);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the PATCH request and saves the response returned from the api refundReasonUpdate endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_refund_reason_update_endpoint() {
        API_Methods.patchResponse(requestMap);
    }

    @Given("The api user saves the response returned from the api refundReasonUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api refundReasonUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }

    @Given("The api user verifies that the reason information in the response body is {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body_is(String reasonValue) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(reasonValue, jsonPath.getString("refundReasonDetails[0].reason"));
    }
    // ***************************************************************************************************************

    //***************************************** api/refundReasonDelete ***********************************************
    @Given("The api user prepares a DELETE request containing the refund reason {int} to be deleted to send to the api refundReasonDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_refund_reason_to_be_deleted_to_send_to_the_api_refund_reason_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api refundReasonDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint() {
        API_Methods.deleteResponse(requestMap);
    }

    @Given("The api user prepares a DELETE request containing the refund reason {int} that are not present in the system to send to the api refundReasonDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_refund_reason_ids_that_are_not_present_in_the_system_to_send_to_the_api_refund_reason_delete_endpoint(int id) {
        requestMap = new HashMap<>();
        requestMap.put("id", id);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user saves the response returned from the api refundReasonDelete endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user saves the response returned from the api refundReasonDelete endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_refund_reason_delete_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestMap).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }

    @Given("The api user prepares a GET request containing the Deleted {int} to send to the api refundReasonDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_to_send_to_the_api_refund_reason_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }
    // ***************************************************************************************************************

    //********************************************* api/departmentList ***********************************************
    @Given("The api user saves the response returned from the api departmentList endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_department_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies that the {string} and {string} information of the data with the index {int} in the response body is correct.")
    public void the_api_user_verifies_that_the_and_information_of_the_data_with_the_index_in_the_response_body_is_correct(String name, String details, int dataIndex) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(name, jsonPath.getString("departments[" + dataIndex + "].name"));
        assertEquals(details, jsonPath.getString("departments[" + dataIndex + "].details"));
    }

    @Given("The api user saves the response returned from the api departmentList endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_department_list_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //****************************************** api/departmentDetails ***********************************************
    @Given("The api user prepares a GET request containing the department {int} to access their details from the api departmentDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_department_to_access_their_details_from_the_api_department_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a GET request and records the response returned from the api departmentDetails endpoint.")
    public void the_api_user_sends_a_get_request_and_records_the_response_returned_from_the_api_department_details_endpoint() {
        API_Methods.getBodyResponse(requestJsonObject.toString());
    }

    @Given("The api user verifies that the content of the response body includes the data {int}, {string}, {string}, {int}, {string} and {string}.")
    public void the_api_user_verifies_that_the_content_of_the_response_body_includes_the_data_and(int id, String name, String details, int status, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("departmentDetails[0].id"));
        assertEquals(name, jsonPath.getString("departmentDetails[0].name"));
        assertEquals(details, jsonPath.getString("departmentDetails[0].details"));
        assertEquals(status, jsonPath.getInt("departmentDetails[0].status"));
        assertEquals(created_at, jsonPath.getString("departmentDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("departmentDetails[0].updated_at"));
    }

    @Given("The api user prepares a GET request containing the department {int} that are not present in the system to send to the api departmentDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_department_that_are_not_present_in_the_system_to_send_to_the_api_department_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user records the response returned from the api departmentDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_records_the_response_returned_from_the_api_department_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user records the response returned from the api departmentDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_records_the_response_returned_from_the_api_department_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGetBody(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************

    //******************************************* api/departmentAdd **************************************************
    @Given("The api user prepares a POST request containing the {string}, {string} and {int} information to send to the api departmentAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_and_information_to_send_to_the_api_department_add_endpoint(String name, String details, int status) {
        requestMap = new HashMap<>();
        requestMap.put("name", name);
        requestMap.put("details", details);
        requestMap.put("status", status);
        System.out.println("Request Body : " + requestMap);
    }

    @Given("The api user sends a POST request and records the response returned from the api departmentAdd endpoint.")
    public void the_api_user_sends_a_post_request_and_records_the_response_returned_from_the_api_department_add_endpoint() {
        API_Methods.postResponse(requestMap);
    }
    // ***************************************************************************************************************

    //**************************************** api/departmentUpdate/{id} *********************************************
    @Given("The api user prepares a PATCH request containing the {string}, {string} and {int} data to send to the api departmentUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_and_data_to_send_to_the_api_department_update_endpoint(String name, String details, int status) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("name", name);
        requestJsonObject.put("details", details);
        requestJsonObject.put("status", status);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends a PATCH request and records the response returned from the api departmentUpdate endpoint.")
    public void the_api_user_sends_a_patch_request_and_records_the_response_returned_from_the_api_department_update_endpoint() {
        API_Methods.patchResponse(requestJsonObject.toString());
    }

    @Given("The api user records the response returned from the api departmentUpdate endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_records_the_response_returned_from_the_api_department_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchPatch(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user records the response returned from the api departmentUpdate endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_records_the_response_returned_from_the_api_department_update_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchPatch(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }

    @Given("The api user verifies that the updated id information in the returned response body matches the id specified in the endpoints path parameter.")
    public void the_api_user_verifies_that_the_updated_id_information_in_the_returned_response_body_matches_the_id_specified_in_the_endpoints_path_parameter() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("updated_Id"));
    }

    @Given("The api user confirms that the name information in the response body is {string}.")
    public void the_api_user_confirms_that_the_name_information_in_the_response_body_is(String nameValue) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(nameValue, jsonPath.getString("departmentDetails[0].name"));
    }
    // ***************************************************************************************************************

    //****************************************** api/departmentDelete ************************************************
    @Given("The api user prepares a delete request containing the department {int} to be deleted and sends it to the api departmentDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_department_to_be_deleted_and_sends_it_to_the_api_department_delete_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user sends the delete request and records the response returned from the api departmentDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_records_the_response_returned_from_the_api_department_delete_endpoint() {
        API_Methods.deleteResponse(requestJsonObject.toString());
    }

    @Given("The api user prepares a delete request containing the department {int} that are not present in the system and sends it to the api departmentDelete endpoint.")
    public void the_api_user_prepares_a_delete_request_containing_the_department_that_are_not_present_in_the_system_and_sends_it_to_the_api_department_delete_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }

    @Given("The api user records the response from the api departmentDelete endpoint and verifies that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_records_the_response_from_the_api_department_delete_endpoint_and_verifies_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchDelete(requestJsonObject.toString()).equals(ConfigReader.getProperty("notFoundExceptionMessage", "api")));
    }

    @Given("The api user records the response from the api departmentDelete endpoint and verifies that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_records_the_response_from_the_api_department_delete_endpoint_and_verifies_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchDelete(requestJsonObject.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }

    @Given("The api user verifies that the Deleted id in the response body matches the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_in_the_response_body_matches_the_id_information_in_the_request_body() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(requestJsonObject.get("id"), jsonPath.getInt("Deleted_Id"));
    }

    @Given("The api user prepares a GET request containing the Deleted {int} to access the department details via the api departmentDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_deleted_to_access_the_department_details_via_the_api_department_details_endpoint(int id) {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", id);
        System.out.println("Request Body : " + requestJsonObject);
    }
    // ***************************************************************************************************************

    //***************************************** api/coupon/couponList ************************************************
    @Given("The api user saves the response returned from the api coupon couponList endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_coupon_coupon_list_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the {string}, {string}, {string} and {string} information of the item at the {int} index in the response body.")
    public void the_api_user_verifies_the_and_information_of_the_item_at_the_index_in_the_response_body(String title, String coupon_code, String start_date, String end_date, int dataIndex) {
        API_Methods.response.then()
                .assertThat()
                .body("coupons[" + dataIndex + "].title", equalTo(title),
                        "coupons[" + dataIndex + "].coupon_code", equalTo(coupon_code),
                        "coupons[" + dataIndex + "].start_date", equalTo(start_date),
                        "coupons[" + dataIndex + "].end_date", equalTo(end_date));
    }

    @Given("The api user saves the response returned from the api coupon couponList endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_coupon_coupon_list_endpoint_confirming_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ***************************************************************************************************************
}
