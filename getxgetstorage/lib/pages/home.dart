import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgetstorage/controllers/authC.dart';
import 'package:getxgetstorage/controllers/loginC.dart';

class HomePage extends StatelessWidget{
  final auth = Get.find<AuthC>();
  final login = Get.find<LoginC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            auth.logOut(login.rememberMe.value);
          },
          child: Icon(Icons.logout),
      ),
    );
  }
}