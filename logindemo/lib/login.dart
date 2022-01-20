import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/loginC.dart';
import 'package:logindemo/navbar/navbarC.dart';

class LoginPage extends StatelessWidget {

  final loginC = Get.put(LoginPageC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("E-Surat Polsek"),
        backgroundColor: Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.09803921568, bottom: Get.height * 0.01225490196),
              child: Center(
                child: Container(
                    width: Get.height * 0.23284313725,
                    height: Get.height * 0.17156862745,
                    child: Image.asset('asset/images/polri-logo.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.01225490196),
              child: Center(
                child: Text(
                  "Kantor Kepolisian Sektor Sukodadi",
                  style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height * 0.03676470588),
              child: Center(
                child: Text(
                  "Selamat datang di Aplikasi E-Surat Polsek",
                  style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                ),
              ),
            ),

            Form(
                key: loginC.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.height * 0.0306372549),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Masukkan username'
                        ),
                        controller: loginC.username,
                        onSaved: (String? e) => loginC.username.text = e!,
                        validator: loginC.eValidator,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Get.height * 0.0306372549, right: Get.height * 0.0306372549, top: Get.height * 0.01225490196, bottom: 0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Masukkan password'
                        ),
                        controller: loginC.password,
                        onSaved: (String? e) => loginC.password.text = e!,
                        validator: loginC.pValidator,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(Get.height * 0.02450980392, Get.height * 0.03676470588, Get.height * 0.02450980392, 0),
                      height: Get.height * 0.0612745098,
                      width: Get.height * 0.30637254902,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Colors.blue,Colors.indigo[900]!]
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          loginC.check();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                )
            ),

            SizedBox(
              height: 20,
            ),
            Text('Pengguna Baru? Hubungi Admin')
          ],
        ),
      ),
    );
  }
}