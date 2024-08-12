Feature: As a provider, I should be able to access the detailed information of the blog with the specified id number through the API connection.

  Scenario Outline: When a GET request is sent to the /api/blog/{id} endpoint with valid authorization and correct data, the test
  should verify that the status code is 200, the response message is "Blog Details," and the response body includes accurate blog
  details such as id, lang_id, title, slug, tags, summary, content, keywords, category_id, storage, images, views, user_id, url,
  status, and timestamps.

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Details".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blog  Details" oldugunu dogrular
    * The api user verifies that the data in the response body includes "<id>", "<lang_id>", "<title>", "<slug>", "<tags>", "<summary>".
    # Api kullanicisi response bodydeki data "<id>", "<lang_id>", "<title>", "<slug>", "<tags>", "<summary>" içeriklerini doğrular.

    Examples:
      | id | id | lang_id | title                                                                             | slug               | tags | summary       |
      | 1  | 1  | 1       | Discovering the Benefits of Hiring Local Professionals through OnlineMasterMarket | onlinemastermarket |      | professionals |


  Scenario: When a GET request is sent to the endpoint /api/blog/{id} that does not contain valid authorization information and
  (id), it should be verified that the status code returned is 203 and the response_message in the response body is "Id missing".

    * The api user sets "api/blog" path parameters.
    # Api kullanicisi "api/blog" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario Outline: When sending a GET request to the /api/blog/{id} endpoint with valid authorization information and an unregistered
  (id), it should be verified that the status code returned is 203 and the response_message in the response body is "No Details for this id.".

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "No Details for this id." oldugunu dogrular

    Examples:
      | id   |
      | 2155 |


  Scenario Outline: When a GET request is sent to the /api/blog/{id} endpoint with invalid (invalid API key) authorization information,
  it should be verified that the status code returned is 401 and the response_message in the response body is "Invalid token or token missing".

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 1  |
