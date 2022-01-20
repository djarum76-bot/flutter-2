import 'package:flutter/material.dart';
import 'package:valorant/first_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant',
      theme: ThemeData(),
      home: FirstScreen(),
    );
  }
}