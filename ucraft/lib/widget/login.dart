import 'package:flutter/material.dart';
import 'package:ucraft/custom/custom_atas.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomAtas(judul: "Login"),
      ),
    );
  }
}