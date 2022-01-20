import 'package:firebase/auth/login_page.dart';
import 'package:firebase/auth/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    return firebaseUser == null ? LoginPage() : MainPage(firebaseUser);
  }
}