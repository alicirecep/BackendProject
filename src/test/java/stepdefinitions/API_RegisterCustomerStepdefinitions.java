package stepdefinitions;

import config_Requirements.ConfigReader;
import io.cucumber.java.en.Given;
import io.restassured.builder.RequestSpecBuilder;
import org.json.JSONObject;
import utilities.API_Utilities.API_Methods;

import java.util.Arrays;

import static hooks.HooksAPI.spec;

public class API_RegisterCustomerStepdefinitions {

    public static int sayi;
    public static String fullPath;
    JSONObject requestBody;

    @Given("APi kullanicisi base urli olusturur")
    public void a_pi_kullanicisi_base_urli_olusturur() {
        spec = new RequestSpecBuilder().setBaseUri(ConfigReader.getProperty("base_url", "api")).build();
    }

    @Given("APi kullanicisi {string} path parametrelerini olusturur")
    public void a_pi_kullanicisi_path_parametrelerini_olusturur(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

            if (value.matches("\\d+")) {  // value.matches("\\d+") burada value rakam iceriyorsa dedik
                sayi = Integer.parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
        System.out.println("sayi : " + sayi);
    }

    @Given("Api kullanicisi api register endpointine gondermek icin gecerli datalardan olusan bir post request hazirlar")
    public void api_kullanicisi_api_register_endpointine_gondermek_icin_gecerli_datalardan_olusan_bir_post_request_hazirlar() {
        requestBody = new JSONObject();
        requestBody.put("first_name", "aleynadilan");
        requestBody.put("last_name", "ciftcier");
        requestBody.put("email", "dilannciftcier@buysellcycle.com");
        requestBody.put("password", "123123123");
        requestBody.put("password_confirmation", "123123123");
        requestBody.put("user_type", "customer");
        requestBody.put("referral_code", "0101010101");
        System.out.println("requestBody : " + requestBody);
    }

    @Given("Api kullanicisi post request gonderir ve api register endpointinden donen responsei kaydeder")
    public void api_kullanicisi_post_request_gonderir_ve_api_register_endpointinden_donen_responsei_kaydeder() {
        API_Methods.postResponse(requestBody.toString());
    }

    @Given("Api kullanicisi status codeun {int} oldugunu dogrular")
    public void api_kullanicisi_status_codeun_oldugunu_dogrular(int code) {
        API_Methods.statusCodeAssert(code);
    }

    @Given("Api kullanicisi response bodydeki message bilgisinin {string} oldugunu dogrular")
    public void api_kullanicisi_response_bodydeki_message_bilgisinin_oldugunu_dogrular(String message) {
        API_Methods.messageAssert(message);
    }
}
