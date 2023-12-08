import 'package:flutter/material.dart';
import 'package:stateful_widget/product_list.dart';
class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('User Screen'),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Back to home')),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductList()));
                },
                child: const Text('go to Product List')),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => ProductList()));
                },
                child: const Text('Product List and remove all'))

          ],
        ),
      ),
    );
  }
}