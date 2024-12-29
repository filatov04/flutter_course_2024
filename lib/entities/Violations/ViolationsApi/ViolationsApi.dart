import 'package:http/http.dart' as http;
import 'dart:convert';

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
}

class ViolationWithRoomNumberSchema extends ViolationSchema {
  final int? roomNumber;

  ViolationWithRoomNumberSchema({
    required String documentType,
    required String violatorName,
    required String violationType,
    required String description,
    required int roomId,
    required int dormId,
    required String witness,
    required String createdAt,
    this.roomNumber,
  }) : super(
    documentType: documentType,
    violatorName: violatorName,
    violationType: violationType,
    description: description,
    roomId: roomId,
    dormId: dormId,
    witness: witness,
    createdAt: createdAt,
  );

  factory ViolationWithRoomNumberSchema.fromJson(Map<String, dynamic> json, int? roomNumber) {
    return ViolationWithRoomNumberSchema(
      documentType: json['document_type'],
      violatorName: json['violator_name'],
      violationType: json['violation_type'],
      description: json['description'],
      roomId: json['room_id'],
      dormId: json['dorm_id'],
      witness: json['witness'],
      createdAt: json['created_at'],
      roomNumber: roomNumber ?? null,
    );
  }
}

Future <Map<int, List<ViolationWithRoomNumberSchema>>> getViolations(String token, int roomId) async {
  var response = await http.get(Uri.parse('http://10.0.2.2:8000/violations/$roomId/rooms/get'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
  if (response.statusCode == 200) {
    String decodedString = utf8.decode(response.bodyBytes);
    List<dynamic> decodedJson = jsonDecode(decodedString);
    Map<int, List<ViolationWithRoomNumberSchema>> roomsWithViolationList = {};
    for (var roomIndex = 0; roomIndex < decodedJson.length; ++roomIndex) {
      for (var violationIndex = 0; violationIndex < decodedJson[roomIndex]['violations'].length; ++violationIndex) {
        roomsWithViolationList[decodedJson[roomIndex]['block_number']] ??= [];
        roomsWithViolationList[decodedJson[roomIndex]['block_number']]!.add(
          ViolationWithRoomNumberSchema.fromJson(
            decodedJson[roomIndex]['violations'][violationIndex],
            decodedJson[roomIndex]['room_number'],
          ),
        );
      }
    }
    return roomsWithViolationList;
  }
  var rJson = jsonDecode(response.body);
  throw rJson['detail']['message'];
}