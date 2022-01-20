import 'package:flutter/material.dart';
import 'package:mysql/view/admin/home/home.dart';
import 'package:mysql/view/admin/product/product.dart';
import 'package:mysql/view/admin/profile/profile.dart';
import 'package:mysql/view/admin/users/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget{
  final VoidCallback signOut;

  MainMenu({required this.signOut});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int bottomNavIndex = 0;

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  String username = "";
  String nama = "";

  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username")!;
      nama = preferences.getString("nama")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    List _screen = [Home(),Product(),Users(),Profile(signOut: signOut,)];
    return Scaffold(
      body: _screen[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                title: Text("Product")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                title: Text("Users")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text("Profile")
            ),
          ],
          onTap: (selected){
            setState(() {
              bottomNavIndex = selected;
            });
          },
      ),
    );
  }
}