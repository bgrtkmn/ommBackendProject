package stepdefinitions;

import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.junit.Assert;
import pojos.AddPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.Authentication;

import java.util.HashMap;

import static io.restassured.RestAssured.given;

public class API_Stepdefinitions {

    Response response;

    JsonPath jsonPath;
    String exceptionMesaj;

    HashMap<String, Object> reqBody;

    AddPojo addPojo;

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .header("token", Authentication.generateToken())
                .header("Accept", "application/json")
                .when()
                .get(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then().assertThat().statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then().assertThat().body(key, Matchers.equalTo(value));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string}, {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including(int dataIndex, String lang_id, String title, String slug, String tags, String summary) {
        jsonPath = response.jsonPath();

        Assert.assertEquals(lang_id, jsonPath.getString("data.blogs[" + dataIndex + "].lang_id"));
        Assert.assertEquals(title, jsonPath.getString("data.blogs[" + dataIndex + "].title"));
        Assert.assertTrue(jsonPath.getString("data.blogs[" + dataIndex + "].slug").contains(slug));
        Assert.assertEquals(tags, jsonPath.getString("data.blogs[" + dataIndex + "].tags"));
        Assert.assertTrue(jsonPath.getString("data.blogs[" + dataIndex + "].summary").contains(summary));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized() {
        try {
            response = given()
                    .spec(HooksAPI.spec)
                    .header("token", ConfigReader.getProperty("invalidApiKey", "api"))
                    .header("Accept", "application/json")
                    .when()
                    .get(API_Methods.fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Mesaj : " + exceptionMesaj);

        Assert.assertEquals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api"), exceptionMesaj);
    }

    @Given("The api user prepares a post request containing {string}, {int}, {string}, {string} information to send to the api addBlog endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_add_blog_endpoint(String title, int category_id, String summary, String content) {
        reqBody = new HashMap<>();
        reqBody.put("title", title);
        reqBody.put("category_id", category_id);
        reqBody.put("summary", summary);
        reqBody.put("content", content);
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .header("token", ConfigReader.getProperty("invalidApiKey","api"))
                .header("Accept", "application/json")
                .contentType(ContentType.JSON)
                .when()
                .body(reqBody)
                .post(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a post request containing {string}, {int}, {string} information to send to the api addBlog endpoint.")
    public void the_api_user_prepares_a_post_request_containing_information_to_send_to_the_api_add_blog_endpoint(String title, int category_id, String summary) {
        addPojo = new AddPojo(title, category_id, summary);
    }

    @Given("The api user prepares a POST request that contains no data.")
    public void the_api_user_prepares_a_post_request_that_contains_no_data() {
        addPojo = new AddPojo();
    }
}
