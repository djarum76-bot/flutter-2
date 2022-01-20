import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget{
  final String moduleName;
  final bool isDone;
  final Function()? onClick;

  ModuleTile({required this.moduleName, required this.isDone, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
        ? Icon(Icons.done)
        : RaisedButton(
          onPressed: onClick,
          child: Text("Done"),
      )
    );
  }
}