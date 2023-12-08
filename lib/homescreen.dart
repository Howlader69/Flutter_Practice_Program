import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _titleTEController = TextEditingController();
  TextEditingController _descripTEController = TextEditingController();
  List<todo> todos = [];
  GlobalKey <FormState> _todoform=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(onPressed: (){
            todos.clear();
            if(mounted){
              setState(() {});
            }
          }, icon: const Icon(Icons.playlist_remove))
        ],
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: (){
                todos[index].isdone=! todos[index].isdone ;
                if(mounted){
                  setState(() {});
                }
              },
              leading: todos[index].isdone
                  ? const Icon(Icons.done_outline)
                  : const Icon(Icons.close),
              title: Text(todos[index].title),
              subtitle: Text(todos[index].description),
              trailing: IconButton(
                onPressed: () {
                  if (mounted) {
                    setState(() {});
                  }
                  todos.removeAt(index);
                },
                icon: const Icon(Icons.delete_forever_outlined),
              ),

            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (mounted) {
              setState(() {});
            }
            showaddNewtodoModelsheet();
          },
          child: const Icon(Icons.add)),
    );
  }

  void showaddNewtodoModelsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _todoform,
              child: Column(
                children: [
                  const Text('Add New Todo'),
                  TextFormField(
                    controller: _titleTEController,
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return 'Enter your title';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'title',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextFormField(
                    controller: _descripTEController,
                    validator: (String? value){
                      if(value?.trim().isEmpty??true){
                        return 'Enter your description';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'description',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,),
                        )
                    ),

                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_todoform.currentState!.validate()) {
                            todos.add(todo(_titleTEController.text.trim(),
                                _descripTEController.text.trim(), false));
                            if (mounted) {
                              setState(() {});
                            }
                            _titleTEController.clear();
                            _descripTEController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('add')),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class todo {
  String title, description;
  bool isdone;

  todo(this.title, this.description, this.isdone);
}