import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return  Scaffold(
      appBar: AppBar(),
      body:  LayoutBuilder(
        builder: (context, constraints) {
         // print(constraints.maxWidth);
         // print(constraints.minWidth);
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        //fittedBox
                        width:150,
                          height: 25,

                          child: FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                              child: Text('this is testing of responsive widget'))),
                      Text('this is testing of responsive widget'),

                    ],
                  ),
                 SizedBox(height: size.height/10,),
                 Text(size.width.toString()),
                 if(constraints.maxWidth>1600)
                   Text('Big desktop screen'),
                 if(constraints.maxWidth>1200)
                   Text('Desktop screen'),
                 if(constraints.maxWidth>700 && constraints.maxWidth<=1200)
                   Text('Tablet'),
                  if(constraints.maxWidth<700)
                   Text('phone'),
                 Container(
                   //AspectRatio
                   color: Colors.blue,
                   width: 200,
                   height: 200,
                   alignment: Alignment.center,
                   child: AspectRatio(
                     aspectRatio: 16/9,
                     child: Container(
                       color: Colors.greenAccent,

                     ),
                   ),

                 ),
                ],
              ),
            );
        }
      ),

    );
  }
}
