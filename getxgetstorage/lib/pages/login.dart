import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxgetstorage/controllers/authC.dart';
import 'package:getxgetstorage/controllers/loginC.dart';

class LoginPage extends StatelessWidget{
  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autocorrect: false,
                controller: c.emailC,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              Obx((){
                return TextField(
                  autocorrect: false,
                  controller: c.passC,
                  obscureText: c.hidden.value,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: (){
                            c.hidden.toggle();
                          },
                          icon: c.hidden.isTrue ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                      )
                  ),
                );
              }),
              SizedBox(height: 10,),
              Obx((){
                return CheckboxListTile(
                  value: c.rememberMe.value,
                  onChanged: (value){
                    c.rememberMe.toggle();
                  },
                  title: Text("Remember Me"),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }),
              ElevatedButton(
                  onPressed: (){
                    auth.login(c.emailC.text, c.passC.text, c.rememberMe.value);
                  },
                  child: Text("Login")
              )
            ],
          ),
      ),
    );
  }
}