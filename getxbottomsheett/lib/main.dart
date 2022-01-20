import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // showModalBottomSheet(context: context, builder: (context){
          //   return Padding(
          //       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          //         color: Colors.red,
          //         child: Center(
          //           child: ListView(
          //             children: [
          //               TextField(
          //                 decoration: InputDecoration(
          //                     border: OutlineInputBorder()
          //                 ),
          //               ),
          //               SizedBox(height: 20,),
          //               TextField(
          //                 decoration: InputDecoration(
          //                     border: OutlineInputBorder()
          //                 ),
          //               ),
          //               SizedBox(height: 20,),
          //               TextField(
          //                 decoration: InputDecoration(
          //                     border: OutlineInputBorder()
          //                 ),
          //               ),
          //               SizedBox(height: 20,),
          //               TextField(
          //                 decoration: InputDecoration(
          //                     border: OutlineInputBorder()
          //                 ),
          //               ),
          //               SizedBox(height: 20,),
          //               TextField(
          //                 decoration: InputDecoration(
          //                     border: OutlineInputBorder()
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //   );
          // });

          Get.bottomSheet(
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  color: Colors.red,
                  child: Center(
                    child: ListView(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){}, child: Text("SIMPAN"))
                      ],
                    ),
                  ),
                ),
              ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
