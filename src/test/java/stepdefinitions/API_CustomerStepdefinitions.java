package stepdefinitions;

import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import utilities.API_Utilities.API_Methods;

import static org.junit.Assert.*;

public class API_CustomerStepdefinitions {

    JsonPath jsonPath;

    @Given("APi kullanicisi {string} token ile base urli olusturur")
    public void a_pi_kullanicisi_token_ile_base_urli_olusturur(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder")
    public void api_kullanicisi_api_customer_get_user_endpointinden_donen_responsei_kaydeder() {
        API_Methods.getResponse();
    }

    @Given("Api kullanicisi api customerGetUser endpointinden donen responsei kaydeder, status codeun '401' ve error bilgisinin Unauthorized oldugunu dogrular")
    public void api_kullanicisi_api_customer_get_user_endpointinden_donen_responsei_kaydeder_status_codeun_ve_error_bilgisinin_unauthorized_oldugunu_dogrular() {
        assertTrue(API_Methods.tryCatchGet().equals("status code: 401, reason phrase: Unauthorized"));
    }

    @Given("Api kullanicisi donen response bodydeki datalarin sisteme giris yapan kullanici bilgileri ile ayni oldugu dogrular")
    public void api_kullanicisi_donen_response_bodydeki_datalarin_sisteme_giris_yapan_kullanici_bilgileri_ile_ayni_oldugu_dogrular() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals("aleynadilan", jsonPath.getString("user.first_name"));
        assertEquals("ciftcier", jsonPath.getString("user.last_name"));
        assertEquals("dilannciftcier@buysellcycle.com", jsonPath.getString("user.email"));
    }
}
