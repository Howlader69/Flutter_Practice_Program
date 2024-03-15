import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductscreen extends StatefulWidget {
  const AddNewProductscreen({super.key});

  @override
  State<AddNewProductscreen> createState() => _AddNewProductscreenState();
}

class _AddNewProductscreenState extends State<AddNewProductscreen> {
  bool inprogress = false;
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _QtyTEController = TextEditingController();
  final TextEditingController _TotalpriceTEController = TextEditingController();
  final TextEditingController _ImageTEController = TextEditingController();
  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();

  void addnewproducts() async {
    inprogress = true;
    if (mounted) {
      setState(() {});
    }
    Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode({
          "Img": _ImageTEController.text.trim(),
          "ProductCode": _productCodeTEController.text.trim(),
          "ProductName": _nameTEController.text.trim(),
          "Qty": _QtyTEController.text.trim(),
          "TotalPrice": _TotalpriceTEController.text.trim(),
          "UnitPrice": _priceTEController.text.trim(),
        }));
    inprogress = false;
    if (mounted) {
      setState(() {});
    }
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodedbody = jsonDecode(response.body);
      if (decodedbody['status'] == 'success') {
        if (mounted) {
          _priceTEController.clear();
          _nameTEController.clear();
          _productCodeTEController.clear();
          _QtyTEController.clear();
          _TotalpriceTEController.clear();
          _ImageTEController.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('New product add successfully')));
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('New product add failed! Try again')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('addnewproductscreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formstate,
            child: Column(
              children: [
                TextFormField(
                    controller: _nameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Product Name',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product name';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _productCodeTEController,
                    decoration: const InputDecoration(
                      hintText: 'Product code',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product Code';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _priceTEController,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product price';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _QtyTEController,
                    decoration: const InputDecoration(
                      hintText: 'Qty',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product Quantity';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _TotalpriceTEController,
                    decoration: const InputDecoration(
                      hintText: 'Total price',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product Total price';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _ImageTEController,
                    decoration: const InputDecoration(
                      hintText: 'Image',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter product Image';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: inprogress
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (_formstate.currentState!.validate()) {
                              addnewproducts();
                            }
                          },
                          child: const Text('Add')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
