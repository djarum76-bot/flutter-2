import 'package:flutter/material.dart';
import 'package:sliver/learning_path_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sliver",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LearningPathPage(),
    );
  }
}