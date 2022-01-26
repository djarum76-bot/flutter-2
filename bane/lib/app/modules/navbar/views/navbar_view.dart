import 'package:bane/app/modules/home/views/home_view.dart';
import 'package:bane/app/modules/profile/views/profile_view.dart';
import 'package:bane/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Obx((){
            return IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                SearchView(),
                ProfileView()
              ],
            );
          })
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: Obx((){
          return BottomNavigationBar(
              elevation: 0,
              onTap: controller.pindahTab,
              currentIndex: controller.tabIndex.value,
              backgroundColor: Color(0xFFF1F6FB),
              selectedItemColor: Color(0xFFFF3B2F),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.home, size: 30,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.search, size: 30),
                  label: '2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.userCircle, size: 30),
                  label: '4',
                ),
              ]
          );
        }),
      ),
    );
  }
}
