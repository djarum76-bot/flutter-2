import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/login.dart';
import 'package:logindemo/main.dart';
import 'package:logindemo/navbar/navbarC.dart';
import 'package:logindemo/navbar/profile/profileC.dart';

void main() => runApp(MaterialApp(
  home:Profile(),
));

class Profile extends StatelessWidget {

  final globalC = Get.find<Global>();
  final profileC = Get.put(ProfileC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
         title: new Text("Profil"),
         backgroundColor: Color(0xFF1A237E),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.indigo[900]!, Colors.blue[700]!]
                    )
                ),
                child: Container(
                  width: double.infinity,
                  height: Get.height * 0.30637254902,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          // backgroundImage: NetworkImage(
                          //   "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                          // ),
                          backgroundImage: AssetImage("asset/images/user.png"),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          globalC.user.value.data!.nama != null ? "${globalC.user.value.data!.nama}" : "Nama",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                      ],
                    ),
                  ),
                )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.03676470588,horizontal: Get.height * 0.01960784313),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nama : ",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      globalC.user.value.data!.nama != null ? "${globalC.user.value.data!.nama}" : "Nama",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Jabatan : ",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      globalC.user.value.data!.role != null ? "${globalC.user.value.data!.role}" : "Jabatan",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Pangkat : ",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      globalC.user.value.data!.pangkat != null ? "${globalC.user.value.data!.pangkat}" : "Pangkat",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    globalC.user.value.data!.role == "Satuan Kerja"
                        ? Column(
                            children: [
                              Text(
                                "Satuan : ",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Text(
                                globalC.user.value.data!.satuan != null ? "${globalC.user.value.data!.satuan}" : "Pangkat",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          )
                        : SizedBox(height: 0,),
                    Text(
                      "Username : ",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      globalC.user.value.data!.username != null ? "${globalC.user.value.data!.username}" : "Username",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: Get.height * 0.24509803921,
              child: RaisedButton(
                  onPressed: () {
                    profileC.logout();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)
                  ),
                  elevation: 0.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Colors.indigo[900]!,Colors.blue]
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text("Logout",
                        style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight:FontWeight.w500),
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
