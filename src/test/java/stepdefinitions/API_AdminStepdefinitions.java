package stepdefinitions;

import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class API_AdminStepdefinitions {

    JSONObject requestJsonObject;
    JsonPath jsonPath;

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
    @Given("The api user prepares a GET request containing the holiday ids for which details are to be accessed, to send to the api holidayDetails endpoint.")
    public void the_api_user_prepares_a_get_request_containing_the_holiday_ids_for_which_details_are_to_be_accessed_to_send_to_the_api_holiday_details_endpoint() {
        requestJsonObject = new JSONObject();
        requestJsonObject.put("id", 18);
        System.out.println("requestJsonObject : " + requestJsonObject);
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
    }

    @Given("The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '404' and the reason phrase is Not Found.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_not_found() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 404, reason phrase: Not Found"));
    }

    @Given("The api user saves the response returned from the api holidayDetails endpoint and confirms that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_holiday_details_endpoint_and_confirms_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************
}
