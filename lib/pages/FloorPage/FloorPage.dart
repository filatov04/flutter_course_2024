import 'package:flutter/material.dart';
import 'package:flutter_course_2024/features/ModalCreateViolation/ModalCreateViolation.dart';

class FloorPage extends StatefulWidget{
  const FloorPage({super.key});

  @override
  _FloorPageState createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage>{
  String floor = '8';

  final List<Map<String, dynamic>> items = [
    {'room': '802', 'details': ['АКТ|202-3|1.08.2024|\nАнтисанитария | Иванов И.И.', 'АКТ|202-3|1.08.2024|\nКурение| Иванов И.И.']},
    {'room': '803', 'details': []},
    {'room': '804', 'details': []},
    {'room': '805', 'details': []},
    {'room': '806', 'details': []},
    {'room': '807', 'details': []},
    {'room': '808', 'details': []},
    {'room': '809', 'details': []},
  ];

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
             SizedBox(height: 20),
             ConstrainedBox(
               constraints: BoxConstraints.tightFor(width: 350, height: 615),
               child: Container(
                 child: GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2, // Количество столбцов
                     childAspectRatio: 1,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10// Пропорции карточки
                   ),
                   itemCount: items.length,
                   itemBuilder: (context, index) {
                     final item = items[index];
                     return _buildCard(item);
                   },
                 ),
               ),
             )
           ],
         ),
       ),
     )
   );
  }

  Widget _buildCard(Map<String, dynamic> item) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 170, height: 150),
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
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 85, height: 33),
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
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(12)
                      ),
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                        right: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item['room'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15, height: 33),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 70, height: 33),
                  child: Container(
                    child: GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder:(BuildContext context){
                            return  ModalCreateViolation();
                          }
                        );
                      },
                     child: Icon(Icons.add, color: Colors.white, size: 30),
                    )
                  ),
                )
              ],
            ),
            if(item['details'].isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: item['details']
                    .map<Widget>(
                      (detail) => Padding(
                    padding: const EdgeInsets.all(5),
                      child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 160),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              detail,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ),
                      )
                    ),
                  )
                      .toList(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
