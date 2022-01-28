import 'package:firecommerce/app/modules/cart/views/cart_view.dart';
import 'package:firecommerce/app/modules/home/views/home_view.dart';
import 'package:firecommerce/app/modules/profile/views/profile_view.dart';
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
                ProfileView()
              ],
            );
          })
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Obx((){
                return BottomNavigationBar(
                    elevation: 0,
                    onTap: controller.pindahTab,
                    currentIndex: controller.tabIndex.value,
                    backgroundColor: Colors.black87,
                    selectedItemColor: Color(0xFFFF3B2F),
                    unselectedItemColor: Colors.white,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(LineIcons.home, size: 30,),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(LineIcons.userCircle, size: 30),
                        label: 'Profile',
                      ),
                    ]
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
