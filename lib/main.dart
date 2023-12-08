
import 'package:flutter/material.dart';
import 'package:stateful_widget/homescreen.dart';

void main(){
  runApp(const myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homeScreen(),
    );
  }
}


class messageScreen extends StatefulWidget {
  const messageScreen({super.key});

  @override
  State<messageScreen> createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  String welcomemessage= 'hi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stateful widget',style: TextStyle(),),
      ),
      body: Center(
        child: Text(welcomemessage,style: const TextStyle(fontSize: 24),),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          setState(() {

          });
          welcomemessage= welcomemessage== 'hi'?'hello': 'hi';
          print(welcomemessage);
        },
        label: const Text(''
            'change text'),
      ),
    );
  }
}