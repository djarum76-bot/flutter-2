import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_state/provider/done_module_provider.dart';

class DoneModuleList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final doneModuleList = Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Done Module List"),
      ),
      body: ListView.builder(
          itemCount: doneModuleList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(doneModuleList[index]),
            );
          }
      ),
    );
  }
}