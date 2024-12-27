import 'package:flutter/material.dart';
import 'package:flutter_course_2024/Pages/NotesFloorPage/NotesFloorPage.dart';
import './pages/LoginPage/LoginPage.dart';
import './pages/MainPage/MainPage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOO_Platform_MISIS',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => LoginForm(),
        '/MainPage': (BuildContext context) => MainPage(),
        '/NotesFloorPage': (BuildContext context) => NotesFloorPage(),
      },
    );
  }
}


