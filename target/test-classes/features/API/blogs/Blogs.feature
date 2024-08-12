Feature: As a provider I want to be able to access blogs via API connection.

  Scenario Outline: When a GET request is sent to the /api/blogs endpoint with valid authorization, the test should verify
  that the status code is 200, the response message is "Blogs Listed Successfully," and the blog information returned
  for id(x) includes the correct details such as.

    * The api user sets "api/blogs" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blogs Listed Successfully".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blogs Listed Successfully" oldugunu dogrular
    * The api user verifies the information in the response body for the entry with the specified <dataIndex> index, including "<lang_id>", "<title>", "<slug>", "<tags>", "<summary>".
    # Api kullanıcısı response body icindeki <dataIndex> indexe sahip olanin "<lang_id>", "<title>", "<slug>", "<tags>", "<summary>" bilgilerini doğrular.

    Examples:
      | dataIndex | lang_id | title                                                                             | slug               | tags | summary  |
      | 0         | 1       | Discovering the Benefits of Hiring Local Professionals through OnlineMasterMarket | onlinemastermarket |      | services |


  Scenario: When a GET request is sent to /api/blogs endpoint with invalid (invalid API key) authorization information, it should be
  verified that the status code returned is 401 and the response_message in the response body is "Invalid token or token missing".

    * The api user sets "api/blogs" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
