abstract class BaseApiServices{

  Future<dynamic> getRequest(String url);

  Future<dynamic> postRequest(String url, dynamic data);

}