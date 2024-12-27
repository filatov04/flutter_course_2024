import 'package:flutter/material.dart';
import 'package:flutter_course_2024/entities/Notes/Notes.dart';

class NotesFloorPage extends StatefulWidget {
  @override
  _NotesFloorPageState createState() => _NotesFloorPageState();
}

class _NotesFloorPageState extends State<NotesFloorPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index, String token) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/MainPage', arguments: token);

    } else if (index == 1) {
      print('Notes Floor pushed');
      // Navigator.pushNamed(context, '/NotesFloorPage', arguments: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: Container(
          padding: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(5, 65, 240, 1),
                    Color.fromRGBO(55, 235, 255, 1)
                  ]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("lib/shared/assets/appBar/logo.png"),
              Image.asset('lib/shared/assets/appBar/vector.png'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Center(
            child: Column(
              children: [
                Notes(token: token)
              ],
            )
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.transparent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>  _onItemTapped(index, token),
        //surfaceTintColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, size: 50,),
            icon: Icon(Icons.home_outlined, size: 50,),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.library_books_outlined, size: 40,),
            selectedIcon: Icon(Icons.library_books, size: 40,),
            label: '',
          )
        ],
      ),
    );
  }
}