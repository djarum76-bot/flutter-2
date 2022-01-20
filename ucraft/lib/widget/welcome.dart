import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ucraft/custom/style.dart';
import 'package:ucraft/ui/tombol.dart';
import 'package:ucraft/widget/login.dart';
import 'package:ucraft/widget/register.dart';

class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Image.asset("asset/welcome.png"),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                color: HexColor("E6CCB2"),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                )
            ),
            child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16,),
                    Text(
                        "Welcome",
                        style: TextStyle(fontSize: 48),
                    ),
                    SizedBox(height: 16,),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tombol(
                          isi: "Register",
                          backgroundColor: tombolCoklat,
                          tulisanColor: putih,
                          aksi: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Register();
                            }));
                          },
                        ),
                        Tombol(
                          isi: "Login",
                          backgroundColor: tombolPutih,
                          tulisanColor: hitam,
                          aksi: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Login();
                            }));
                          },
                        ),
                      ],
                    )
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}