Feature: As a provider, I want to be able to create a new blog record via API connection.

  Scenario Outline: When a POST body with valid authorization information and correct data (title, category_id, summary, content)
  is sent to /api/addBlog endpoint, it should be verified that the status code returned is 200 and the response_message in the
  response body is "Blog added successfully".

    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request containing "<title>", <category_id>, "<summary>", "<content>" information to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<summary>", "<content>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog added successfully".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blog added successfully" oldugunu dogrular

    Examples:
      | title    | category_id | summary      | content      |
      | New Blog | 1           | Blog Summary | Blog Content |


  Scenario Outline: When a POST body with valid authorization information and missing data is sent to the /api/addBlog endpoint,
  it should be verified that the status code returned is 203 and the response_message in the response body is
  "Title, summary, content and category_id is required.".

    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request containing "<title>", <category_id>, "<summary>" information to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<summary>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular

    Examples:
      | title    | category_id | summary      |
      | New Blog | 1           | Blog Summary |


  Scenario: When a POST request with valid authorization information but no data is sent to the /api/addBlog endpoint, it should be
  verified that the status code returned is 203 and the response_message in the response body is "Title, summary, content and category_id is required.".


    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a POST request that contains no data.
    # Api kullanicisi data icermeyen bir post request hazırlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular


  Scenario Outline: Invalid Token When a POST body with invalid (invalid API key) authorization information and correct data (title, category_id,
  summary, content) is sent to /api/addBlog endpoint, it should be verified that the status code returned is 401 and the
  response_message in the response body is "Invalid token or token missing"

    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request containing "<title>", <category_id>, "<summary>", "<content>" information to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek icin "<title>", <category_id>, "<summary>", "<content>" bilgilerini iceren bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

    Examples:
      | title    | category_id | summary      | content      |
      | New Blog | 1           | Blog Summary | Blog Content |

  @US
  Scenario Outline: The API must verify that the new blog record to be created through the API has been created.

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id |
      | 25 |
      | 26 |

