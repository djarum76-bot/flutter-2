import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugaskuliah/pages/home.dart';

class Update extends StatefulWidget{
  final VoidCallback signOut;

  const Update({Key? key, required this.signOut}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late String id,username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  setup()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id")!;
      username = preferences.getString("username")!;
      password = preferences.getString("password")!;
    });

    txtUsername = TextEditingController(text: username);
    txtPassword = TextEditingController(text: password);
  }

  check(){
    final form = _key.currentState;
    if(form!.validate()){
      form.save();
      update();
    }
  }

  update() async{
    try{
      final response = await http.post(Uri.parse("https://jokitugas.000webhostapp.com/api/update.php"), body: {
        "id":id,
        "username":username,
        "password":password
      });
      final data = jsonDecode(response.body);
      int value = data['value'];
      String message = data['message'];

      if(value == 1){
        print(message);
        savePref(value, username, password,id);
        Get.snackbar(
            "Pemberitahuan",
            "Berhasil Diubah",
            backgroundColor: Colors.white
        );
        Get.offAll(()=>HomePage(signOut: widget.signOut));
      }else{
        Get.snackbar(
            "ERROR",
            "Gagal Diubah",
            backgroundColor: Colors.white
        );
      }
    }catch(e){
      Get.snackbar(
          "ERROR",
          "Gagal Diubah",
          backgroundColor: Colors.white
      );
    }
  }

  savePref(int value, String username, String password, String id) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("username", username);
      preferences.setString("password", password);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
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
                    controller: txtUsername,
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
                    controller: txtPassword,
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
                          Get.back();
                        },
                        child: Text("Cancel",style: TextStyle(fontSize: 24)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                            primary: Colors.red
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          check();
                        },
                        child: Text("Update",style: TextStyle(fontSize: 24),),
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    txtUsername.clear();
    txtPassword.clear();
    super.dispose();
  }
}