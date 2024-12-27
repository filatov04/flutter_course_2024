import 'package:http/http.dart' as http;
import 'dart:convert';

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


Future<List<NoteSchema>> getNotes(String token, int dormId) async {
  var response = await http.get(Uri.parse("http://10.0.2.2:8000/notes/$dormId/get"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      });
  if (response.statusCode == 200) {
    String decodedString = utf8.decode(response.bodyBytes);
    List<dynamic> decodedJson = jsonDecode(decodedString);
    List<NoteSchema> notes = decodedJson.map((json) => NoteSchema.fromJson(json)).toList();
    return notes;
  }
  var rJson = jsonDecode(response.body);
  throw rJson['detail']['message'];
}
