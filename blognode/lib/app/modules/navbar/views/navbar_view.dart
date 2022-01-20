import 'package:blognode/app/modules/add_blog/views/add_blog_view.dart';
import 'package:blognode/app/modules/home/views/home_view.dart';
import 'package:blognode/app/modules/profile/views/profile_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx((){
            return IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                AddBlogView(),
                ProfileView()
              ],
            );
          })
      ),
      bottomNavigationBar: Obx((){
        return CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: controller.tabIndex.value,
          height: Get.height * 0.07352941176,
          items: [
            Icon(Icons.home, size: 30, color: Colors.white,),
            Icon(Icons.add, size: 30, color: Colors.white,),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          color: Colors.teal,
          buttonBackgroundColor: Colors.teal,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            controller.tabIndex.value = index;
          },
          letIndexChange: (index) => true,
        );
      }),
    );
  }
}
