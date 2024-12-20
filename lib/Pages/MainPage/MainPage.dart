import 'package:flutter/material.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        body: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
              icon: Icon(Icons.login),
              hintText: "Введите логин",
              helperText: "Логин используется для входа в систему",
          )
        )
      )
    );
  }
}