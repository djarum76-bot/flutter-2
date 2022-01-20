import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:instagram/app/modules/add/views/add_view.dart';
import 'package:instagram/app/modules/add_story/views/add_story_view.dart';
import 'package:instagram/app/modules/home/views/home_view.dart';
import 'package:instagram/app/modules/profile/views/profile_view.dart';
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
                AddView(),
                AddStoryView(),
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
          items: <Widget>[
            Icon(LineIcons.home, size: 30, color: Colors.white,),
            Icon(LineIcons.plus, size: 30, color: Colors.white),
            Icon(LineIcons.bookOpen, size: 30, color: Colors.white),
            Icon(LineIcons.user, size: 30, color: Colors.white),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
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
