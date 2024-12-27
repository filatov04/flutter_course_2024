import 'package:flutter/material.dart';
import 'package:flutter_course_2024/app/store/store.dart';
import 'package:flutter_course_2024/entities/Employee/Employee.dart';
import 'package:flutter_course_2024/entities/Last/Last.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        child: Center(
          child: Column(
            children: [
              Employee(),
              SizedBox(height: 20),
              Last(token: _token)
            ],
          )
        ),
      ),
    );
  }
}