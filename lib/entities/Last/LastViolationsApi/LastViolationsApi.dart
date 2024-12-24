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

  factory ViolationSchema.fromJson(Map<String, dynamic> json) {
    return ViolationSchema(
      documentType: json['document_type'],
      violatorName: json['violator_name'],
      violationType: json['violation_type'],
      description: json['description'],
      roomId: json['room_id'],
      dormId: json['dorm_id'],
      witness: json['witness'],
      createdAt: json['created_at'],
    );
  }
}

Future<List<ViolationSchema>> getViolationsByDormId(String token, int dormId, [int limit = 3]) async {
  var response = await http.get(Uri.parse('http://10.0.2.2:8000/violations/$dormId/get?limit=$limit'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
  if (response.statusCode == 200) {
    String decodedString = utf8.decode(response.bodyBytes);
    List<dynamic> decodedJson = jsonDecode(decodedString);
    List<ViolationSchema> violations = decodedJson.map((json) => ViolationSchema.fromJson(json)).toList();
    return violations;
  }
  var rJson = jsonDecode(response.body);
  throw rJson['detail']['message'];
}