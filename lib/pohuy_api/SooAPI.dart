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

class ViolationSchema {
  final String documentType;
  final String violatorName;
  final String violationType;
  final String description;
  final int roomId;
  final int dormId;
  final String witness;
  final String createdAt;

  ViolationSchema({
    required this.documentType,
    required this.violatorName,
    required this.violationType,
    required this.description,
    required this.roomId,
    required this.dormId,
    required this.witness,
    required this.createdAt,
  });

  factory ViolationSchema.fromJson(Map<String, dynamic> json) {
    return ViolationSchema(
      documentType: json['document_type'],
      violatorName: json['violator_name'],
      violationType: json['violation_type'],
      description: json['description'],
      roomId: json['room_id'],
      dormId: json['dorm_id'],
      witness: json['witness'],
      createdAt: json['createdAt'],
    );
  }
}

class SooProjectAPI {
  final String url;

  SooProjectAPI(this.url);

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

  Future<List<ViolationSchema>> getViolationsByDormId(String token, int dormId, [int limit = 3]) async {
    var response = await http.get(Uri.parse('$url/violations/$dormId/get?limit=$limit'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        });
    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body);
      List<ViolationSchema> violations = decodedJson.map((json) => ViolationSchema.fromJson(json)).toList();
      return violations;
    }
    var rJson = jsonDecode(response.body);
    throw rJson['detail']['message'];
  }
}

