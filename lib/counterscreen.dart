import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [

          Center(
            child: Text(counter.toString(),style: const TextStyle(fontSize: 24),),
          ),
        ],
      ) ,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {});
              counter=counter+1;
            },child:const Icon(Icons.add),),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {});
              counter = counter - 1;
            },
            child: const Icon(Icons.remove),),
          const SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: (){
              setState(() {});
              counter=0;
            },child:const Icon(Icons.clear) ,)

        ],
      ),
    );
  }
}