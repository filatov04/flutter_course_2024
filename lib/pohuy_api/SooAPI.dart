import 'package:http/http.dart' as http;
import 'dart:convert';

class SooProjectAPI {
  final String url;

  SooProjectAPI(this.url);

  Future<String> authenticate(String login, String password) async {
    final body = {
      'login': login,
      'password': password
    };
    var response = await http.post(Uri.parse("$url/auth/login"), body: json.encode(body));
    if (response.statusCode != 200) {
      return "Bad auth"; // need fix
    }
    var rJson = jsonDecode(response.body);
    return rJson['access_token'];
  }
}
