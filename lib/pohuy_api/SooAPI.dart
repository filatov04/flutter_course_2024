import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo {
  final String firstName;
  final String secondName;
  final String? thirdName;
  final String phone;
  final String? tg;
  final String role;
  final int dormId;

  UserInfo({
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.phone,
    required this.tg,
    required this.role,
    required this.dormId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      firstName: json['first_name'],
      secondName: json['second_name'],
      thirdName: json['third_name'],
      phone: json['phone'],
      tg: json['tg'],
      role: json['role'],
      dormId: json['dorm_id'],
    );
  }
}

class NoteSchema {
  final int noteId;
  final String room;
  final String description;
  final String created_at;

  NoteSchema({
    required this.noteId,
    required this.room,
    required this.description,
    required this.created_at,
  });

  factory NoteSchema.fromJson(Map<String, dynamic> json) {
    return NoteSchema(
      noteId: json['note_id'],
      room: json['room_id'],
      description: json['description'],
      created_at: json['created_at'],
    );
  }
}

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

  Future<UserInfo> getUserInfo (String token) async {
    var response = await http.get(Uri.parse("$url/user/info"),
        headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    var rJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserInfo.fromJson(rJson);
    }
    throw rJson['detail']['message'];
  }

  Future<String> getNotes(String token, int dormId) async {
    var response = await http.get(Uri.parse("$url/notes/$dormId/get"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        });
    var rJson = jsonDecode(response.body);
    print(rJson);
    return "huy";
  }
}
