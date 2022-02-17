import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:resep/app/modules/home/views/home_view.dart';
import 'package:resep/app/modules/search/views/search_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx((){
            return IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                SearchView()
              ],
            );
          })
      ),
      bottomNavigationBar: Obx((){
        return BottomNavigationBar(
            elevation: 0,
            onTap: controller.pindahTab,
            currentIndex: controller.tabIndex.value,
            backgroundColor: Color(0xFFE3FDFD),
            selectedItemColor: Color(0xFFFFAB73),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(LineIcons.hamburger),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.search),
                label: 'Search',
              ),
            ]
        );
      })
      ,
    );
  }
}
