import 'package:flutter/material.dart';
import 'package:ucraft/custom/custom_atas.dart';
import 'package:ucraft/custom/style.dart';
import 'package:ucraft/custom/teks_form.dart';
import 'package:ucraft/ui/tombol.dart';
import 'package:ucraft/widget/login.dart';

class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAtas(judul: "Register"),
            SizedBox(height:50),
            TeksForm(icon: Icons.person, hintText: "Nama"),
            TeksForm(icon: Icons.call, hintText: "Password"),
            TeksForm(icon: Icons.location_on_outlined, hintText: "Alamat"),
            TeksForm(icon: Icons.mail_outline, hintText: "Email"),
            TeksForm(icon: Icons.lock, hintText: "Password",icon2: Icons.visibility,),
            SizedBox(),
            Tombol(
                isi: "Register",
                backgroundColor: tombolCoklat,
                tulisanColor: putih,
                aksi: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Register();
                  }));
                },
            )
          ],
        ),
      ),
    );
  }
}