import 'package:flutter/material.dart';

class SMSCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Center"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://cdn.dribbble.com/users/262577/screenshots/10059482/media/4f75cdcac300fc6f257d38d5e61f9a19.jpg"),
              fit: BoxFit.fill
          )
        ),
      ),
    );
  }
}