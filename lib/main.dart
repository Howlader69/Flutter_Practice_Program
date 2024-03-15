import 'package:crud_project/homescreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Homescreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder(),
             focusedBorder: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.black87)
             )
        )
      ),
    );
  }
}
