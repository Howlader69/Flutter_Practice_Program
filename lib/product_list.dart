import 'package:flutter/material.dart';
import 'package:stateful_widget/product_details_list.dart';
import 'package:stateful_widget/userList.dart';


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                  Navigator.pop(context);
                },
                child: const Text('Back to home')),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  UserList()), (route) => false);
                },
                child: const Text('User List')),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> ProducDetailstList('gussi handba')));
                },
                child: const Text('Product details')),

          ],
        ),
      ),
    );
  }
}