import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './FloorsListApi/FloorsListApi.dart';

class FloorsList extends StatelessWidget{
  final String token;

  const FloorsList({super.key, required this.token});

  void _onClick(int floorId) async{
    print('Clicked $floorId');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FloorSchema>>(
      future: getFloors(token, 1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 70, height: 600),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var currentFloor = data[index];
                return ElevatedButton(
                    onPressed: (){_onClick(data[index].floorId);},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 40),
                        backgroundColor: Color.fromRGBO(24, 127, 246, 1),
                        side: BorderSide(color: Colors.white, width: 2, style: BorderStyle.solid),
                        elevation: 4
                    ),
                    child: Text(
                      currentFloor.floorNumber.toString(),
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )
                );
              }
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}