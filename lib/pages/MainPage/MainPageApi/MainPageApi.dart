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

Future<UserInfo> getUserInfo (String token) async {
  var response = await http.get(Uri.parse("http://10.0.2.2:8000/user/info"),
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
  var response = await http.get(Uri.parse("http://10.0.2.2:8000/notes/$dormId/get"),
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
  var response = await http.get(Uri.parse('http://10.0.2.2:8000/floors/$dormId/get'),
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

