import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './NotesApi/NotesApi.dart';

class Notes extends StatelessWidget{
  final String token;

  const Notes({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NoteSchema>> (future: getNotes(token, 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 267, height: 631),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(24, 127, 246, 1),
                  borderRadius: BorderRadius.circular(20),
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
                      constraints: BoxConstraints.tightFor(
                          width: 152, height: 40),
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
                            child: Text(
                              "Примечания",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: 350, height: 392),
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 40),
                        child: Column(
                          children: <Widget>[
                            Expanded (
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  var currentNote = data[index];
                                  return Column(
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 300, height: 95),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(24, 127, 246, 1),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                  width: 1, color: Colors.white),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                                    offset: Offset(4, 4),
                                                    blurRadius: 4
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 10, right: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      ConstrainedBox(
                                                        constraints: BoxConstraints.tightFor(
                                                            width: 66, height: 30),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              border: Border.all(
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1),
                                                                  width: 1,
                                                                  style: BorderStyle.solid),
                                                              borderRadius: BorderRadius
                                                                  .circular(12)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'test',
                                                              style: TextStyle(fontSize: 14,
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ConstrainedBox(
                                                        constraints: BoxConstraints.tightFor(
                                                            width: 50, height: 30),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Color.fromRGBO(
                                                                  188, 55, 55, 1),
                                                              border: Border.all(
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1),
                                                                  width: 1,
                                                                  style: BorderStyle.solid),
                                                              borderRadius: BorderRadius
                                                                  .circular(12)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'test1',
                                                              style: TextStyle(fontSize: 14,
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1),
                                                                  fontWeight: FontWeight
                                                                      .w600),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ConstrainedBox(
                                                        constraints: BoxConstraints.tightFor(
                                                            width: 144, height: 30),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              border: Border.all(
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1),
                                                                  width: 1,
                                                                  style: BorderStyle.solid),
                                                              borderRadius: BorderRadius
                                                                  .circular(12)
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'test2',
                                                              style: TextStyle(fontSize: 14,
                                                                  color: Color.fromRGBO(
                                                                      80, 85, 105, 1)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints.tightFor(
                                                        width: 279, height: 35),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color: Color.fromRGBO(
                                                                  80, 85, 105, 1),
                                                              width: 1,
                                                              style: BorderStyle.solid),
                                                          borderRadius: BorderRadius.circular(
                                                              12)
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 10, right: 20),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            'test3',
                                                            style: TextStyle(fontSize: 12,
                                                                color: Color.fromRGBO(
                                                                    80, 85, 105, 1),
                                                                height: 1),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (index < data.length - 1)
                                          SizedBox(height: 10),
                                      ]
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}