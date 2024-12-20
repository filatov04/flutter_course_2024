import 'package:flutter/material.dart';
import './Pages/LoginPage/LoginPage.dart';
import './Pages/MainPage/MainPage.dart';

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
      },
    );
  }
}

/*class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin(){
    String phone = _phoneController.text;
    String password = _passwordController.text;

    print('Username: $phone');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
                child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 326),
                  child: Container(
                    padding: EdgeInsets.only(top: 45, bottom: 40, left: 25, right: 25),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(24, 127, 246, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(4, 4),
                            blurRadius: 4
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Телефон",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(fontSize: 20, color: Colors.black)
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Пароль",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (){_handleLogin();},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(194, 50),
                                backgroundColor: Color.fromRGBO(24, 127, 246, 1),
                                side: BorderSide(color: Colors.white, width: 2, style: BorderStyle.solid),
                                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                                elevation: 4
                            ),
                            child: Text(
                              "Войти",
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            )
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        )
    );
  }
}*/

