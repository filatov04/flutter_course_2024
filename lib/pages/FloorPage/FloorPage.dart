import 'package:flutter/material.dart';

class FloorPage extends StatefulWidget{
  const FloorPage({super.key});

  @override
  _FloorPageState createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage>{
  String floor = '8';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Padding(
       padding: EdgeInsets.only(top: 20),
       child: Center(
         child: Column(
           children: [
             ConstrainedBox(
               constraints: BoxConstraints.tightFor(width:350, height: 71),
               child: Container(
                 decoration: BoxDecoration(
                   color: Color.fromRGBO(24, 127, 246, 1),
                   borderRadius: BorderRadius.circular(12),
                   boxShadow: [
                     BoxShadow(
                         color: Color.fromRGBO(0, 0, 0, 0.25),
                         offset: Offset(4, 4),
                         blurRadius: 4
                     )
                   ],
                 ),
                 child: Column(
                   children: [
                     Row(
                       children: [
                         ConstrainedBox(
                           constraints: BoxConstraints.tightFor(width: 111, height: 37),
                           child: Container(
                             decoration: BoxDecoration(
                               color: Color.fromRGBO(24, 127, 246, 1),
                               border: Border(
                                   bottom: BorderSide(color: Colors.white, width: 2),
                                   right: BorderSide(color: Colors.white, width: 2)
                               ),
                               borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(12),
                                   topLeft: Radius.circular(12)
                               ),
                               boxShadow: [
                                 BoxShadow(
                                     color: Color.fromRGBO(0, 0, 0, 0.25),
                                     offset: Offset(4, 4),
                                     blurRadius: 4
                                 )
                               ],
                             ),
                             child: Center(
                               child: Text(
                                 '$floor этаж',
                                 style: TextStyle(fontSize: 20, color: Colors.white),
                               ),
                             ),
                           ),
                         ),
                         SizedBox(height: 37, width: 9),
                         ConstrainedBox(
                           constraints: BoxConstraints.tightFor(width: 230, height: 37),
                           child: Container(
                             decoration: BoxDecoration(
                               color:  Color.fromRGBO(24, 127, 246, 1),
                               borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(12),
                               ),
                             ),
                             child: Center(
                               child: Text(
                                 'Мустафаев М.М.',
                                 style: TextStyle(fontSize: 20, color: Colors.white),
                               ),
                             ),
                           ),
                         )
                       ],
                     ),
                     Row(
                       children: [
                         ConstrainedBox(
                           constraints: BoxConstraints.tightFor(width: 150, height: 34),
                           child: Container(
                             child: Row(
                               children: [
                                 SizedBox(width: 10, height: 34),
                                 Icon(Icons.telegram, color: Colors.white, size: 30,),
                                 SizedBox(width: 10, height: 34),
                                 Text(
                                   '@miw4ik',
                                   style: TextStyle(fontSize: 20, color: Colors.white),
                                 )
                               ],
                             )
                           ),
                         ),
                         ConstrainedBox(
                           constraints: BoxConstraints.tightFor(width: 200, height: 34),
                           child: Container(
                             child: Row(
                               children: [
                                 SizedBox(width: 15, height: 34),
                                 Icon(Icons.phone, color: Colors.white, size: 25),
                                 SizedBox(width: 10, height: 34),
                                 Text(
                                   '+79919451059',
                                   style: TextStyle(fontSize: 20, color: Colors.white),
                                 )
                               ],
                             ),
                           ),
                         )
                       ],
                     )
                   ],
                 ),
               ),
             ),
             SizedBox(height: 20,),
             ConstrainedBox(
               constraints: BoxConstraints.tightFor(width: 350, height: 615),
               child: Container(

               ),
             )
           ],
         ),
       ),
     )
   );
  }
}
