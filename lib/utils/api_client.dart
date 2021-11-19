import 'package:http/http.dart' as http;

// Server Call
class ApiClient {
  ApiClient._() {}
   static final String BASE_URL = "https://api.giphy.com";
  static Future<http.Response> getgiphy(String cityName) {
    String RELATIVE_PATH = "/v1/gifs/search?api_key=wGEv4YayVrt0jndWjDWI60WSZkeXVT2B&q=${cityName}&limit=25&offset=0&rating=g&lang=en";
    String fullURL = BASE_URL + RELATIVE_PATH;
    Future<http.Response> future = http.get(Uri.parse(fullURL));
    return future;
    /*future.then((response) {
      String responseBody = response.body;
      print("Body Type ${responseBody.runtimeType}");
      print("Response Body $responseBody ");
    }).catchError((err) => print("Error Rec During Server Call ${err}"));*/
  }
}
