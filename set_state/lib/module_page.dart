import 'package:flutter/material.dart';
import 'package:set_state/done_module_list.dart';
import 'package:set_state/module_list.dart';

class ModulePage extends StatelessWidget {
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memulai Pemrograman dengan Dart"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DoneModuleList();
                }));
              },
              icon: Icon(Icons.done)
          )
        ],
      ),
      body: ModuleList()
    );
  }
}