import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget{
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String username,password,nama;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  var _autovalidate = false;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      save();
    }else{
      setState(() {
        _autovalidate = true;
      });
    }
  }

  save()async{
    final response = await http.post(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/register.php"),body: {
      "nama":nama,
      "username":username,
      "password":password
    });
    final data = jsonDecode(response.body);
    int value = data["value"];
    String message = data["message"];

    if(value == 1){
      setState(() {
        Navigator.pop(context);
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
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
                              return "Please insert your name";
                            }
                          },
                          onSaved: (e) => nama = e!,
                          decoration: InputDecoration(
                              hintText: "Nama"
                          ),
                        ),
                        SizedBox(height: 8,),
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
                            }else if(e.length < 8){
                              return "Panjang password minimal 8 huruf";
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
                            child: Text("Register",style: TextStyle(fontSize: 16),)
                        ),
                      ],
                    )
                ),
              )
          ),
        ),
      ),
    );
  }
}