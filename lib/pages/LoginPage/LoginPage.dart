import 'package:flutter/material.dart';
import '../../pohuy_api/SooAPI.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() async{
    String phone = _phoneController.text;
    String password = _passwordController.text;
    final api = SooProjectAPI('http://10.0.2.2:8000');
    try {
      final token = await api.authenticate(phone, password);
      final userInfo = await api.getUserInfo(token);
      final notesList = await api.getNotes(token, userInfo.dormId);
      final floorsList = await api.getFloors(token, userInfo.dormId);
      final violations = await api.getViolationsByDormId(token, userInfo.dormId);
      Navigator.pushNamed(context, '/MainPage');
    }
    catch (e) {
      print(e);
    }

    // if(phone == '78005553535' && password == 'example'){
    //   Navigator.pushNamed(context, '/MainPage');
    //   print('Username: $phone');
    //   print('Password: $password');
    // }
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
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black)
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
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          )
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
}