import 'package:flutter/material.dart';
import 'package:mysql/view/admin/profile/body_profile.dart';

class ProfileUser extends StatefulWidget{
  final VoidCallback signOut;

  ProfileUser({required this.signOut});

  @override
  State<ProfileUser> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileUser> {

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BodyProfile(signOut: signOut,)
      ),
    );
  }
}