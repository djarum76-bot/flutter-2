import 'package:flutter/material.dart';
import 'package:mysql/view/admin/profile/body_profile.dart';

class Profile extends StatefulWidget{
  final VoidCallback signOut;

  Profile({required this.signOut});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SafeArea(
          child: BodyProfile(signOut: signOut,)
      ),
    );
  }
}