import 'package:flutter/material.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body:  Column(
          children: [
            Container(
              height: 100,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 90,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 90,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.cyan,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // height: 90,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(

                        child: Container(
                          //height: 90,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: 90,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 90,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 90,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 90,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            /*  Text('home Screen'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductList()));
                },
                child: Text('go to ProductList')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserList()));
                },
                child: Text('go to UserList')),*/
          ],
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(onPressed: (){
              showDialog(
                  barrierDismissible: false,

                  context: context, builder: (context){
                return AlertDialog(
                  titlePadding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  title: Row(
                    children: [
                      const Text('Hello'),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.close))

                    ],
                  ),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welcome our app'),
                      Text('Welcome our app'),
                      Text('Welcome our app'),
                    ],
                  ),
                );
              });
            },
              label: const Text('Dialog'),),
            FloatingActionButton.extended(
              onPressed: (){
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    )),
                    context: context, builder: (context){
                  return SizedBox(
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Title'),
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.close)),
                      ],
                    ),
                  );
                });
              },
              label: const Text('BottomSheet'),)
          ],
        )
    );
  }
}