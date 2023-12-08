
import 'package:flutter/material.dart';
import 'package:todo_project/homescreen.dart';

void main(){
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
      home: HomeScreen(),
      // themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.white
          )
      ),
    );
  }
}