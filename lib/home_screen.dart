import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

       child:Column(
         children: [
           Expanded(
             flex: 6,
               child: Container(
                 color: Colors.purple,
                 child: Row(
                   children: [
                     Expanded(
                       flex: 5,
                       child: Container(
                         color: Colors.purple,
                       ),
                     ),
                     Expanded(
                       flex: 5,
                       child: Column(
                         children: [
                           Expanded(
                             flex: 5,
                             child: Container(
                               color: Colors.green,
                             ),
                           ),
                           Expanded(
                             flex: 5,
                             child: Container(
                               color: Colors.lightBlueAccent,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               )),

           Expanded(
             flex: 10,
               child: Row(
                 children: [
                   Expanded(
                     flex: 5,
                     child: Container(
                       color: Colors.amber,
                     ),
                   ),
                   Expanded(
                     flex: 20,
                     child: Column(
                       children: [
                         Expanded(
                           flex: 5,
                           child: Row(
                             children: [
                               Expanded(
                                 flex: 18,
                                 child: Container(
                                   color: Colors.white,
                                 ),
                               ),
                               Expanded(
                                 flex: 5,
                                 child: Container(
                                   color: Colors.purple,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Expanded(
                           flex: 5,
                           child: Row(
                             children: [
                               Expanded(
                                 flex: 5,
                                 child: Container(
                                   color: Colors.deepOrange,
                                 ),
                               ),
                               Expanded(
                                 flex: 15,
                                 child: Column(children: [
                                   Expanded(
                                     flex: 5,
                                     child: Container(
                                       color: Colors.limeAccent,
                                     ),
                                   ),
                                   Expanded(
                                     flex: 5,
                                     child: Container(
                                       color: Colors.deepOrangeAccent,
                                     ),
                                   ),
                                 ],),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               )),
           Expanded(
             flex: 6,
               child: Row(
                 children: [
                   Expanded(
                     flex: 5,
                     child: Column(
                       children: [
                         Expanded(
                           flex: 5,
                           child: Container(
                             color: Colors.grey,
                           ),
                         ),
                         Expanded(
                           flex: 5,
                           child: Container(
                             color: Colors.greenAccent,
                           ),
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     flex: 5,
                     child: Row(
                       children: [
                         Expanded(
                           flex: 5,
                           child: Container(
                             color: Colors.white54,
                           ),
                         ),
                         Expanded(
                           flex: 5,
                           child: Container(
                             color: Colors.teal,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ))
         ],
       ) ,
      ),
    );
  }
}
