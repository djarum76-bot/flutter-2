import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugaskuliah/pages/login.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async{
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Selamat Datang",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 28)),),
              Image.asset("asset/splash.png"),
              Text("Pasar Desa Sambungrejo",style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 28)))
            ],
          ),
        ),
      ),
    );
  }
}
