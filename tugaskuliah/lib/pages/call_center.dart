import 'package:flutter/material.dart';

class CallCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Center"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://cdn.dribbble.com/users/627451/screenshots/6101538/media/d6f7b023d9453c4a11e5a8ae05d94a12.png"),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}
