import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mysql/model/keranjangModel.dart';
import 'package:mysql/model/produkModel.dart';
import 'package:http/http.dart' as http;
import 'package:mysql/view/user/produk/productUser.dart';
import 'package:mysql/view/user/profile/profileUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuUser extends StatefulWidget{
  final VoidCallback signOut;

  MenuUser({required this.signOut});

  @override
  State<MenuUser> createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  int bottomNavIndex = 0;

  signOut(){
    setState(() {
      widget.signOut();
    });
  }

  var loading = false;

  String idUsers = '';

  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idUsers = preferences.getString("id")!;
    });
  }

  String jumlah = "0";
  final ex = <KeranjangModel>[];
  _jumlahKeranjang()async{
    setState(() {
      loading = true;
    });

    ex.clear();

    final response = await http.get(Uri.parse("https://iniaplikasikumanaaplikasimu.000webhostapp.com/api_android/api/lihatKeranjang.php?idUsers="+idUsers));

    final data = jsonDecode(response.body);
    data.forEach((api){
      final exp = new KeranjangModel(api['jumlah']);
      ex.add(exp);
      setState(() {
        jumlah = exp.jumlah;
      });
    });

    setState(() {
      loading = false;
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
    List _screen = [ProductUser(idUsers: idUsers,jumlahkeranjang: _jumlahKeranjang,),ProfileUser(signOut: signOut)];
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.shopping_cart)
              ),
              jumlah == "0"
                  ? Container()
                  : Positioned(
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.brightness_1,
                          size: 25,
                          color: Colors.orange,
                        ),
                        Positioned(
                            top: 3.0,
                            right: 9.0,
                            child: Text(jumlah, style: TextStyle(color: Colors.white,fontSize: 15),)
                        )
                      ],
                    ),
                  )
            ],
          )
        ],
      ),
      body: _screen[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text("Product")
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