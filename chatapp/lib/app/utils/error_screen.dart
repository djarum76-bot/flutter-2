import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Terjadi Kesalahan"),
        ),
      ),
    );
  }
}