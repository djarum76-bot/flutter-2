import 'package:blog_app/app/modules/add_post/views/add_post_view.dart';
import 'package:blog_app/app/modules/home/views/home_view.dart';
import 'package:blog_app/app/modules/profile/views/profile_view.dart';
import 'package:blog_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                ProfileView()
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.toNamed(Routes.ADD_POST);
            },
            child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
              onTap: controller.pindahTab,
              currentIndex: controller.tabIndex.value,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]
          ),
        ),
      );
    });
  }
}
