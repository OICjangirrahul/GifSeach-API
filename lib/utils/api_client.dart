import 'package:http/http.dart' as http;

// Server Call
class ApiClient {
  ApiClient._() {}
  static final String BASE_URL = "https://itunes.apple.com";
  static Future<http.Response> getSongs(String artistName) {
    String RELATIVE_PATH = "/search?term=${artistName}&limit=25";
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
