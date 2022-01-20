import 'package:firebase/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget{
  late final User user;

  MainPage(this.user);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.uid),
            RaisedButton(
                onPressed: ()async{
                  await AuthServices.signOut();
                },
                child: Text("Sign Out"),
            )
          ],
        )
      ),
    );
  }
}