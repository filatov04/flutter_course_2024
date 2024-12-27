import 'package:http/http.dart' as http;
import 'dart:convert';

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