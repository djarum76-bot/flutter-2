import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  late RegExp regExp;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController address;

  final obserText = true.obs;
  final isMale = true.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    regExp = new RegExp(p);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    address.dispose();
  }

  void validation()async{
    if(username.text.isEmpty && email.text.isEmpty && password.text.isEmpty && phone.text.isEmpty && address.text.isEmpty){
      scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("All Field Are Empty"),
          )
      );
    }else if(username.text.length < 6){
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    }else if(email.text.isEmpty){
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    }else if(!regExp.hasMatch(email.text)){
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
    }else if(password.text.isEmpty){
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    }else if(password.text.length < 8){
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    }else if (phone.text.length < 11 || phone.text.length > 11) {
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    }else if (address.text.isEmpty) {
      scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Adress Is Empty "),
        ),
      );
    } else {
      submit();
    }
  }

  void submit()async{
    late UserCredential result;
    try{
      isLoading.value = true;
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, 
        password: password.text
      );
    }on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "Error",
          middleText: 'The account already exists for that email.'
        );
      }
    }catch(e){
      print(e);
    }

    FirebaseFirestore.instance.collection('User').doc(result.user!.uid).set({
      "Username": username.text,
      "UserID": result.user!.uid,
      "UserEmail": email.text,
      "UserAddres": address.text,
      "UserGender": isMale.value == true ? "Male" : "Female",
      "UserPhone": phone.text
    });

    Get.offNamed(Routes.HOME);

    isLoading.value = false;
  }
}
