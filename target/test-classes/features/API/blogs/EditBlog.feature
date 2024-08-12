Feature: As a provider, I want to be able to update the information of the blog with the specified id number via API connection.

  Scenario Outline: When a PATCH body is sent to the endpoint /api/editBlog/{id} containing the correct (id) and correct data
  (title, summary, content) with valid authorization information, it must be verified that the status code returned is 200 and the
  response_message in the response body is "Blog  Updated successfully".

    * The api user sets "api/editBlog/<id>" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a patch request containing "<title>", "<summary>", "<content>" information to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek icin "<title>", "<summary>", "<content>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Updated successfully".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Blog  Updated successfully" oldugunu dogrular
    * The api user verifies that the updated_blog_id information in the response body is the same as the id path parameter
    # Api kullanicisi response body icindeki updated_blog_id bilgisinin id path parametresi ile ayni oldugunu dogrular

    Examples:
      | id | title            | summary | content |
      | 22 | New Blog Updated | Summary | Content |


  Scenario Outline: When a PATCH request is sent to the /api/editBlog/{id} endpoint with valid authorization information,
  it should be verified that the status code returned is 203 and the response_message in the response body is "No data for updated.".

    * The api user sets "api/editBlog/<id>" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a PATCH request that contains no data.
    # Api kullanicisi data icermeyen bir PATCH request hazırlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No data for updated.".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "No data for updated." oldugunu dogrular

    Examples:
      | id |
      | 22 |


  Scenario Outline: When a PATCH body is sent to /api/editBlog/{id} endpoint with valid authorization information (id) and correct data
  (title, summary, content), it should be verified that the status code returned is 203 and the response_message in the response
  body is "Id missing".

    * The api user sets "api/editBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a patch request containing "<title>", "<summary>", "<content>" information to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek icin "<title>", "<summary>", "<content>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "Id missing" oldugunu dogrular

    Examples:
      | title            | summary | content |
      | New Blog Updated | Summary | Content |


  Scenario Outline: When a PATCH body is sent to the endpoint /api/editBlog/{id} containing an unregistered (id) and correct data
  (title, summary, content) with valid authorization information, it should be verified that the status code returned is 203 and
  the response_message in the response body is "No Results found for the given ID".

    * The api user sets "api/editBlog/<id>" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a patch request containing "<title>", "<summary>", "<content>" information to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek icin "<title>", "<summary>", "<content>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".
    # Api kullanicisi response bodydeki response.response_message bilgisinin "No Results found for the given ID" oldugunu dogrular

    Examples:
      | id   | title            | summary | content |
      | 5241 | New Blog Updated | Summary | Content |


  Scenario Outline: When a PATCH body is sent to /api/editBlog/{id} endpoint with invalid (invalid API key) authorization
  information and correct (id) and correct data (title, summary, content), it should be verified that the status code returned is
  401 and the response_message in the response body is "Invalid token or token missing".

    * The api user sets "api/editBlog/<id>" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a patch request containing "<title>", "<summary>", "<content>" information to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek icin "<title>", "<summary>", "<content>" bilgilerini iceren bir patch request hazirlar
    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id | title            | summary | content |
      | 22 | New Blog Updated | Summary | Content |



  Scenario Outline: The API should verify that the blog record that is requested to be updated via the API has been updated.

    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blog/<id>" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that summary is "Summary"
    # Api kullanicisi summary bilgisinin "Summary" oldugunu dogrular

    Examples:
      | id |
      | 22 |
