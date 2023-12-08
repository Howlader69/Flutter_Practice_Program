import 'package:flutter/material.dart';


class ProducDetailstList extends StatefulWidget {
  ProducDetailstList(String s);



  @override
  State<ProducDetailstList> createState() => _ProducDetailstListState();
}

class _ProducDetailstListState extends State<ProducDetailstList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('Product Screen'),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,'hello');
                },
                child: const Text('Back to home')),


          ],
        ),
      ),
    );
  }
}