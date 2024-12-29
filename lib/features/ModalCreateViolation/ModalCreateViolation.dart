import 'package:flutter/material.dart';

class ModalCreateViolation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return Dialog(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //               child: Container(
    //                 padding: EdgeInsets.all(16.0),
    //                 height: 200,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       'Привет!',
    //                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //                     ),
    //                     SizedBox(height: 16),
    //                     Text('Это кастомное модальное окно.'),
    //                     SizedBox(height: 16),
    //                     ElevatedButton(
    //                       onPressed: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: Text('Закрыть'),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             );
    //           },
    //         );
    //       },
    //       child: Text('Открыть кастомное окно'),
    //     ),
    //   ),
    // );
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Привет!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Это кастомное модальное окно.'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Закрыть'),
            ),
          ],
        ),
      ),
    );
  }
}