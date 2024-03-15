import 'dart:convert';
import 'package:crud_project/addnewproductscreen.dart';
import 'package:crud_project/product.dart';
import 'package:crud_project/updateproductscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<product> products = [];
  bool inprogress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getproducts();
  }

  void getproducts() async {
    inprogress = true;
    setState(() {});
    Response response =
        await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      products.clear();
      for (var e in decodedResponse['data']) {
        products.add(product.tojson(e));
      }
    }

    inprogress = false;
    setState(() {});
  }

  void deletetproducts(String id) async {
    inprogress = true;
    setState(() {});
    Response response = await get(
        Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$id'));
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      getproducts();
    } else {
      inprogress = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              getproducts();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        title: const Center(
          child: Text('CRUD'),
        ),
      ),
      body: inprogress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            contentPadding: const EdgeInsets.only(left: 16),
                            title: Row(
                              children: [
                                const Text('Chose an action'),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateProductscreen(
                                                  Product: products[index],
                                                )));
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit'),
                                ),
                                const Divider(
                                  height: 0,
                                ),
                                ListTile(
                                  onTap: () {
                                    deletetproducts(products[index].Id);
                                    Navigator.pop(context);
                                  },
                                  leading: const Icon(Icons.delete),
                                  title: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  title: Text(products[index].ProductName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Code: ${products[index].ProductCode}'),
                      Text('Total Price: ${products[index].Totalprice}'),
                      Text('Available Units: ${products[index].Qty}'),
                    ],
                  ),
                  leading: Image.network(
                    products[index].Img,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.image);
                    },
                  ),
                  trailing: Text('${products[index].unitprice}/p'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNewProductscreen()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
