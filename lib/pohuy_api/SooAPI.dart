import 'package:http/http.dart' as http;
import 'dart:convert';

class SooProjectAPI {
  final String url;

  SooProjectAPI(this.url);

  Future<String> authenticate(String phone, String password) async {
    final body = {
      'phone': phone,
      'password': password
    };
    var response = await http.post(Uri.parse("$url/auth/login"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(body));

    var rJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return rJson['access_token'];
    }
    throw rJson['detail']['message'];
  }
}
