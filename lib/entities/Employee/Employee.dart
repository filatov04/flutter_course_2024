import 'package:flutter/material.dart';

class Employee extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 350, height: 183),
      child: Container(
        decoration: BoxDecoration(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 276, height: 40),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(24, 127, 246, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(4, 4),
                          blurRadius: 4
                      )
                    ],
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2),
                        right: BorderSide(color: Colors.white, width: 2)
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Дежурные',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '23.12.2024',
                          style: TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 350, height: 143),
              child: Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 300, height: 40),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color.fromRGBO(80, 85, 105, 1), width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(4, 4),
                                    blurRadius: 4
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Сайхаматов Акбар",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(80, 85, 105, 1)),
                                ),
                              ),
                            ),
                          )
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 300, height: 40),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color.fromRGBO(80, 85, 105, 1), width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(4, 4),
                                    blurRadius: 4
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Мустафаев Мухаммадали",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(80, 85, 105, 1)),
                                ),
                              ),
                            ),
                          )
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}