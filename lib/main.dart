import 'package:flutter/material.dart';
import 'package:flutter_course_2024/Pages/FloorPage/FloorPage.dart';
import 'package:flutter_course_2024/Pages/LoginPage/LoginPage.dart';
import 'package:flutter_course_2024/Pages/MainPage/MainPage.dart';
import 'package:flutter_course_2024/app/store/store.dart';
import 'package:flutter_course_2024/pages/NotesFloorPage/NotesFloorPage.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void authenticate() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthOrMainScreen(),
    );
  }
}

class AuthOrMainScreen extends StatelessWidget {
  const AuthOrMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return appState.isAuthenticated ? const MainScreen() : const LoginForm();
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String _token = '';

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await LocalStorageService().getToken();
    setState(() {
      _token = token ?? '';
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const MainPage(),
    const NotesFloorPage(),
    const FloorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
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
      body: IndexedStack(
        index: appState.selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index){_onItemTapped(index); appState.setSelectedIndex(index);},
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

