import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/model/user_model.dart';
import 'package:logindemo/navbar/home/home.dart';
import 'package:logindemo/navbar/navbarC.dart';
import 'package:logindemo/navbar/profile/profil.dart';

import 'notifTab/widget/notifikasi.dart';
class NavBar extends StatelessWidget {

  final navbarC = Get.put(NavBarC());

  final List<Widget> _children =[
    Home(),
    Notifikasi(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        body: FutureBuilder(
            future: navbarC.getUser(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }else{
                return IndexedStack(
                  index: navbarC.currentIndex.value,
                  children: _children,
                );
              }
            }
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navbarC.currentIndex.value,
          onTap: navbarC.pindahTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Beranda'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifikasi'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profil'),
            ),
          ],
        ),
      );
    });
      
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logindemo/global.dart';
// import 'package:logindemo/model/user_model.dart';
// import 'package:logindemo/navbar/home/home.dart';
// import 'package:logindemo/navbar/navbarC.dart';
// import 'package:logindemo/navbar/profile/profil.dart';
//
// import 'notifTab/widget/notifikasi.dart';
// class NavBar extends GetView<NavbarC> {
//   int _currentIndex = 0;
//   String nama = "asd";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUser();
//   }
//
//   final List<Widget> _children =[
//     Home(),
//     NotificationTab(),
//     Profile()
//   ];
//   void onBarTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: onBarTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Beranda'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             title: Text('Notifikasi'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text('Profil'),
//           ),
//         ],
//       ),
//     );
//
//   }
// }