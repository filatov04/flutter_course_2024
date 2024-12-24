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
  final String createdAt;

  NoteSchema({
    required this.noteId,
    required this.room,
    required this.description,
    required this.createdAt,
  });

  factory NoteSchema.fromJson(Map<String, dynamic> json) {
    return NoteSchema(
      noteId: json['note_id'],
      room: json['room'],
      description: json['description'],
      createdAt: json['created_at'],
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

class FloorSchema {
  final int floorId;
  final int floorNumber;
  final int dormId;
  final String ownerFirstName;
  final String ownerSecondName;
  final String? ownerThirdName;
  final String? ownerTg;
  final String ownerPhone;

  FloorSchema({
    required this.floorId,
    required this.floorNumber,
    required this.dormId,
    required this.ownerFirstName,
    required this.ownerSecondName,
    required this.ownerThirdName,
    required this.ownerTg,
    required this.ownerPhone,
  });

  factory FloorSchema.fromJson(Map<String, dynamic> json){
    return FloorSchema (
      floorId: json['floor_id'],
      floorNumber: json['floor_number'],
      dormId: json['dorm_id'],
      ownerFirstName: json['owner_first_name'],
      ownerSecondName: json['owner_second_name'],
      ownerThirdName: json['owner_third_name'],
      ownerTg: json['owner_tg'],
      ownerPhone: json['owner_phone'],
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

  Future<List<NoteSchema>> getNotes(String token, int dormId) async {
    var response = await http.get(Uri.parse("$url/notes/$dormId/get"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body);
      List<NoteSchema> notes = decodedJson.map((json) => NoteSchema.fromJson(json)).toList();
      return notes;
    }
    var rJson = jsonDecode(response.body);
    throw rJson['detail']['message'];
  }

  Future <List<FloorSchema>> getFloors(String token, int dormId) async {
    var response = await http.get(Uri.parse('$url/floors/$dormId/get'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });

    if (response.statusCode == 200) {
      List<dynamic> decodedJson = jsonDecode(response.body);
      List<FloorSchema> floors = decodedJson.map((json) => FloorSchema.fromJson(json)).toList();
      return floors;
    }
    var rJson = jsonDecode(response.body);
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
