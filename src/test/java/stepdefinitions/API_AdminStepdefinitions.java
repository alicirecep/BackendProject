package stepdefinitions;

import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import utilities.API_Utilities.API_Methods;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class API_AdminStepdefinitions {

    JsonPath jsonPath;

    //******************************************* api/get-users ******************************************************
    @Given("The api user saves the response returned from the api get users endpoint.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_users_endpoint() {
        API_Methods.getResponse();
    }

    @Given("The api user verifies the information of the data at the index {int} in the response body, including {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_of_the_data_at_the_index_in_the_response_body_including(int dataIndex, String first_name, String username, String email, String name) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(first_name,jsonPath.getString("user[" + dataIndex + "].first_name"));
        assertEquals(username,jsonPath.getString("user[" + dataIndex + "].username"));
        assertEquals(email,jsonPath.getString("user[" + dataIndex + "].email"));
        assertTrue(jsonPath.getString("user[" + dataIndex + "].name").contains(name));
    }

    @Given("The api user saves the response returned from the api get users endpoint and confirms that the status code is '401' and the message is Unauthorized.")
    public void the_api_user_saves_the_response_returned_from_the_api_get_users_endpoint_and_confirms_that_the_status_code_is_and_the_message_is_Unauthorized() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }
    // ***************************************************************************************************************
}
