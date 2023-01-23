abstract class BaseApiService {

  final String baseUrl = "{api_url";

  Future<dynamic> getResponse(String url);

}