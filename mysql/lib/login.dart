import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql/main_menu.dart';
import 'package:mysql/view/user/menuUser.dart';
import 'package:mysql/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

enum LoginStatus{
  notSignIn,
  signIn,
  signInUsers
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

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      login();
    }else{
      setState(() {
        _autovalidate = true;
      });
    }
  }
  
  login() async{
    final response = await http.post(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/login.php"), body: {
      "username":username,
      "password":password
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    String usernameAPI = data['username'];
    String namaAPI = data['nama'];
    String id = data['id'];
    String level = data['level'];

    if(value == 1){
      if (level == "1"){
        setState(() {
          _loginStatus = LoginStatus.signIn;
          savePref(value, usernameAPI, namaAPI,id,level);
        });
      }else{
        setState(() {
          _loginStatus = LoginStatus.signInUsers;
          savePref(value, usernameAPI, namaAPI,id,level);
        });
      }
      print(message);
    }else{
      print(message);
    }
  }

  savePref(int value, String username, String nama, String id, String level) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("username", username);
      preferences.setString("nama", nama);
      preferences.setString("id", id);
      preferences.setString("level", level);
      preferences.commit();
    });
  }

  var value;
  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString("level");

      _loginStatus = value == "1"
          ? LoginStatus.signIn
          : value == "2" ? LoginStatus.signInUsers : LoginStatus.notSignIn;
    });
  }

  signOut() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.setString("level", '');
      preferences.commit();

      _loginStatus = LoginStatus.notSignIn;
    });
  }
  
  var _autovalidate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch(_loginStatus){
      case LoginStatus.notSignIn:
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("MySQL"),
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                    child: Form(
                        autovalidate: _autovalidate,
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              validator: (e){
                                if(e!.isEmpty){
                                  return "Please insert username";
                                }
                              },
                              onSaved: (e) => username = e!,
                              decoration: InputDecoration(
                                  hintText: "Username"
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              validator: (e){
                                if(e!.isEmpty){
                                  return "Please insert password";
                                }
                              },
                              obscureText: _secureText,
                              onSaved: (e) => password = e!,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(_secureText ? Icons.visibility : Icons.visibility_off)
                                  )
                              ),
                            ),
                            SizedBox(height: 25,),
                            ElevatedButton(
                                onPressed: (){
                                  check();
                                },
                                child: Text("Login",style: TextStyle(fontSize: 16),)
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return Register();
                                    }));
                                  },
                                  child: Text("Create a new account", style: TextStyle(fontSize: 20),),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  )
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainMenu(signOut: signOut);
        break;
      case LoginStatus.signInUsers:
        return MenuUser(signOut: signOut);
      default:
        return Center(
          child: CircularProgressIndicator(),
        );
        break;
    }
  }
}