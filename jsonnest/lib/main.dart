import 'package:flutter/material.dart';
import 'package:jsonnest/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NESTED",
      theme:ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Home(),
    );
  }
}