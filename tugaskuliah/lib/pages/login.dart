import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugaskuliah/pages/home.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  late String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  final usernameT = TextEditingController();
  final passwordT = TextEditingController();

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      login();
    }
  }

  login() async{
    try{
      final response = await http.post(Uri.parse("https://jokitugas.000webhostapp.com/api/login.php"), body: {
        "username":username,
        "password":password
      });
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];
      String usernameAPI = data['username'];
      String passwordAPI = data['password'];
      String namaAPI = data['nama'];
      String id = data['id'];

      if(value == 1){
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameAPI, passwordAPI, namaAPI,id);
        print(message);
        print(id);
      }else{
        Get.snackbar(
            "ERROR",
            "Password / Email anda salah",
            backgroundColor: Colors.white
        );
        print(message);
      }
    }catch(e){
      Get.snackbar(
          "ERROR",
          "Password / Email anda salah",
          backgroundColor: Colors.white
      );
      print(e.toString());
    }
  }

  savePref(int value, String username, String password,String nama, String id) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("username", username);
      preferences.setString("password", password);
      preferences.setString("nama", nama);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;
  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1
          ? LoginStatus.signIn
          : LoginStatus.notSignIn;
    });
  }

  signOut() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.commit();

      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    usernameT.clear();
    passwordT.clear();
  }

  @override
  Widget build(BuildContext context) {
    switch(_loginStatus){
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (e){
                          if(e!.isEmpty){
                            return "Masukkan username";
                          }
                        },
                        controller: usernameT,
                        decoration: InputDecoration(
                          label: Text("Username", style: TextStyle(fontSize: 24),),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (e)=>username = e!,
                        onChanged: (e)=>username = e,
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (e){
                          if(e!.isEmpty){
                            return "Masukkan password";
                          }
                        },
                        controller: passwordT,
                        decoration: InputDecoration(
                            label: Text("Password", style: TextStyle(fontSize: 24),),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility)
                            )
                        ),
                        obscureText: _secureText,
                        onSaved: (e)=>password = e!,
                        onChanged: (e)=>password = e,
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                usernameT.clear();
                                passwordT.clear();
                              });
                            },
                            child: Text("Reset",style: TextStyle(fontSize: 24)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                                primary: Colors.red
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              check();
                            },
                            child: Text("Login",style: TextStyle(fontSize: 24),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35)
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return HomePage(signOut: signOut,);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameT.clear();
    passwordT.clear();
    super.dispose();
  }
}