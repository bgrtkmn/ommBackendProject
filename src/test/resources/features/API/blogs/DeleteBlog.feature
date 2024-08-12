Feature: As a provider, I want to be able to delete blog information with the specified id number via API connection.

  Scenario Outline: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with valid authorization information and the
  correct (id), it should be verified that the status code returned is 200 and the response_message in the response body is
  "Blog deleted successfully".

    * The api user sets "api/deleteBlog/<id>" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog deleted successfully".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blog deleted successfully" oldugunu dogrular
    * The api user verifies that the deleted_blog_id information in the response body is the same as the id path parameter
    # Api kullanicisi response body icindeki deleted_blog_id bilgisinin id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id |
      | 22 |


  Scenario: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with valid authorization information but without (id),
  it should be verified that the status code returned is 203 and the response_message in the response body is "Id missing".

    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario Outline: When a DELETE request with valid authorization information and an unregistered (id) is sent to the
  /api/deleteBlog/{id} endpoint, the status code returned is 203 and the response_message in the response body is
  "Blog not found. Invalid ID." should be verified.

    * The api user sets "api/deleteBlog/<id>" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog not found. Invalid ID.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blog not found. Invalid ID." oldugunu dogrular

    Examples:
      | id   |
      | 2541 |


  Scenario Outline: When a DELETE request is sent to the /api/deleteBlog/{id} endpoint with invalid (invalid API key) authorization
  information, it should be verified that the status code returned is 401 and the response_message in the response body is
  "Invalid token or token missing".

    * The api user sets "api/deleteBlog/<id>" path parameters.
    # Api kullanicisi "api/deleteBlog/{id}" path parametrelerini olusturur
    * The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 22 |


  Scenario Outline: The deletion of the blog record requested to be deleted from the API must be verified from the API.

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "No Details for this id." oldugunu dogrular

    Examples:
      | id |
      | 22 |

