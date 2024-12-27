import 'package:flutter/material.dart';
import 'package:flutter_course_2024/Pages/LoginPage/LoginPage.dart';
import 'package:flutter_course_2024/Pages/MainPage/MainPage.dart';
import 'package:flutter_course_2024/Pages/NotesFloorPage/NotesFloorPage.dart';
import 'package:flutter_course_2024/app/store/store.dart';
import 'package:provider/provider.dart';



class AppState extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  void authenticate() {
    _isAuthenticated = true;
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
  int _selectedIndex = 0;
  String? _token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await LocalStorageService().getToken();
    setState(() {
      _token = token;
    });
  }



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const MainPage(),
    const NotesFloorPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: Colors.transparent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => _onItemTapped(index),
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


/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Состояние приложения
class AppState extends ChangeNotifier {
  bool _isAuthenticated = false;
  String sharedData = "Общее состояние";

  bool get isAuthenticated => _isAuthenticated;

  void authenticate() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void updateData(String newData) {
    sharedData = newData;
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

// Главный виджет, который определяет, что показывать: авторизацию или основной экран
class AuthOrMainScreen extends StatelessWidget {
  const AuthOrMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // Если пользователь авторизован, показать основное приложение, иначе - экран авторизации
    return appState.isAuthenticated ? const MainScreen() : const LoginScreen();
  }
}

// Экран авторизации
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // При успешной авторизации вызываем метод authenticate
            Provider.of<AppState>(context, listen: false).authenticate();
          },
          child: const Text("Войти"),
        ),
      ),
    );
  }
}

// Главный экран с AppBar и BottomNavigationBar
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главное приложение"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}

// Экран "Главная"
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Center(
      child: Text(
        "Главный экран\nОбщее состояние: ${appState.sharedData}",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

// Экран "Поиск"
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Экран поиска", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Text("Общее состояние: ${appState.sharedData}",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              appState.updateData("Новое состояние от Поиска");
            },
            child: const Text("Обновить состояние"),
          ),
        ],
      ),
    );
  }
}

// Экран "Настройки"
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Экран настроек", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Text("Общее состояние: ${appState.sharedData}",
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
*/

