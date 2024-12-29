import 'package:flutter/material.dart';
import 'package:flutter_course_2024/entities/Notes/Notes.dart';
import 'package:flutter_course_2024/entities/FloorsList/FloorsList.dart';
import 'package:flutter_course_2024/app/store/store.dart';


class NotesFloorPage extends StatefulWidget {
  const NotesFloorPage({super.key});

  @override
  _NotesFloorPageState createState() => _NotesFloorPageState();
}

class _NotesFloorPageState extends State<NotesFloorPage> {
  String _token = "";

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await LocalStorageService().getToken();
    setState(() {
      _token = token ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Notes(token: _token),
              ),
            ),
            FloorsList(token: _token),
          ],
        ),
      ),
    );
  }
}