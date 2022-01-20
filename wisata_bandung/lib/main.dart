import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisata_bandung/detail_screen.dart';
import 'package:wisata_bandung/main_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Bandung',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}