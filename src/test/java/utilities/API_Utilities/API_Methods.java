package utilities.API_Utilities;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;
import static stepdefinitions.API_RegisterCustomerStepdefinitions.fullPath;

public class API_Methods {

    public static Response response;

    public static Response getResponse() {
        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .when()
                .get(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response postResponse(Object requestBody) {
        response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .when()
                .body(requestBody)
                .post(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response patchResponse(Object requestBody) {
        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .when()
                .body(requestBody)
                .patch(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response deleteResponse(Object requestBody) {
        response = given()
                .spec(spec)
                .header("Accept", "application/json")
                .when()
                .body(requestBody)
                .delete(fullPath);

        response.prettyPrint();

        return response;
    }

    public static String tryCatchGet() {
        String exceptionMesaj = null;
        try {
            response = given()
                    .spec(spec)
                    .header("Accept", "application/json")
                    .when()
                    .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);

        return exceptionMesaj;
    }

    public static void statusCodeAssert(int statusCode) {
        response.then()
                .assertThat()
                .statusCode(statusCode);
    }

    public static void messageAssert(String message) {
        response.then()
                .assertThat()
                .body("message", equalTo(message));
    }
}
