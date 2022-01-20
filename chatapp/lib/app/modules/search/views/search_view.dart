import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.red[900],
            title: Text('Search'),
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)
            ),
            flexibleSpace: Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    onChanged: (value) => controller.searchFriend(value, authC.user.value.email!),
                    controller: controller.searchC,
                    cursorColor: Colors.red[900],
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )
                        ),
                        hintText: "Search new friend...",
                        contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: (){},
                          child: Icon(Icons.search,color: Colors.red[900],),
                        )
                    ),
                  ),
                ),
            ),
          ),
          preferredSize: Size.fromHeight(140)
      ),
      body: Obx(() => controller.tempSearch.length == 0
          ? Center(
        child: Container(
          width: Get.width * 0.7,
          height: Get.width * 0.7,
          child: Lottie.asset("assets/lottie/empty.json"),
        ),
      )
          : ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.tempSearch.length,
          itemBuilder: (context, index){
            return ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              leading: CircleAvatar(
                radius: 30,
                child: controller.tempSearch[index]["photoUrl"] == "noimage"
                    ? Image.asset("assets/logo/noimage.png",fit: BoxFit.cover,)
                    : ClipRRect(
                        child: Image.network(controller.tempSearch[index]["photoUrl"], fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(200),
                      ),
                backgroundColor: Colors.black26,
              ),
              title: Text(
                  "${controller.tempSearch[index]["name"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  )
              ),
              subtitle: Text(
                  "${controller.tempSearch[index]["email"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  )
              ),
              trailing: GestureDetector(
                onTap: (){
                  authC.addNewConnection(controller.tempSearch[index]["email"]);
                },
                child: Chip(label: Text("Message")),
              ),
            );
          }
      ))
    );
  }
}
