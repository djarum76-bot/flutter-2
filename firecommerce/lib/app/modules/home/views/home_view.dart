import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "username",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                // backgroundImage: e.userImage == null
                //     ? AssetImage("images/userImage.png")
                //     : NetworkImage(e.userImage),
              ),
              decoration: BoxDecoration(color: Color(0xfff2f2f2)),
              accountEmail: Text("Email", style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              selected: controller.homeColor.value,
              onTap: () {
                controller.homeColor.value = true;
                controller.contactUsColor.value = false;
                controller.checkoutColor.value = false;
                controller.aboutColor.value = false;
                controller.profileColor.value = false;
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: controller.checkoutColor.value,
              onTap: () {
                controller.checkoutColor.value = true;
                controller.contactUsColor.value = false;
                controller.homeColor.value = false;
                controller.profileColor.value = false;
                controller.aboutColor.value = false;
                Get.offNamed(Routes.CHECK_OUT);
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Checkout"),
            ),
            ListTile(
              selected: controller.aboutColor.value,
              onTap: () {
                controller.aboutColor.value = true;
                controller.contactUsColor.value = false;
                controller.homeColor.value = false;
                controller.profileColor.value = false;
                controller.checkoutColor.value = false;
                Get.offNamed(Routes.ABOUT);
              },
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
            ListTile(
              selected: controller.profileColor.value,
              onTap: () {
                controller.aboutColor.value = false;
                controller.contactUsColor.value = false;
                controller.homeColor.value = false;
                controller.profileColor.value = true;
                controller.checkoutColor.value = false;
                Get.offNamed(Routes.PROFILE);
              },
              leading: Icon(Icons.info),
              title: Text("Profile"),
            ),
            ListTile(
              selected: controller.contactUsColor.value,
              onTap: () {
                controller.contactUsColor.value = true;
                controller.checkoutColor.value = false;
                controller.profileColor.value = false;
                controller.homeColor.value = false;
                controller.aboutColor.value = false;
                Get.offNamed(Routes.CONTACT_US);
              },
              leading: Icon(Icons.phone),
              title: Text("Contant Us"),
            ),
            ListTile(
              onTap: () {
                controller.authC.signout();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              controller.key.currentState?.openDrawer();
            }),
        actions: <Widget>[
          // NotificationButton(),
        ],
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
