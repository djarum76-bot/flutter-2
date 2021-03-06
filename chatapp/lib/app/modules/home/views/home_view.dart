import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Chats",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                      )
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[900],
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.chatsStream(authC.user.value.email!),
                  builder: (context, snapshot1){
                    if(snapshot1.connectionState == ConnectionState.active){
                      var listDocsChats = snapshot1.data!.docs;
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: listDocsChats.length,
                          itemBuilder: (context, index){
                            return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                                stream: controller.friendStream(listDocsChats[index]["connection"]),
                                builder: (context, snapshot2){
                                  if(snapshot2.connectionState == ConnectionState.active){
                                    var data = snapshot2.data!.data();
                                    return data!["status"] == ""
                                        ? ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                        onTap: (){
                                          controller.goToChatRoom(
                                              "${listDocsChats[index].id}",
                                              authC.user.value.email!,
                                              listDocsChats[index]["connection"]
                                          );
                                        },
                                        leading: CircleAvatar(
                                          radius: 30,
                                          child: data["photoUrl"] == "noimage"
                                              ? Image.asset("assets/logo/noimage.png",fit: BoxFit.cover,)
                                              : ClipRRect(
                                            child: Image.network(data["photoUrl"], fit: BoxFit.cover,),
                                            borderRadius: BorderRadius.circular(200),
                                          ),
                                          backgroundColor: Colors.black26,
                                        ),
                                        title: Text(
                                            "${data["name"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20
                                            )
                                        ),
                                        trailing: listDocsChats[index]["total_unread"] == 0
                                            ? SizedBox()
                                            : Chip(
                                                  backgroundColor: Colors.red[900],
                                                  label: Text("${listDocsChats[index]["total_unread"]}",style: TextStyle(color: Colors.white),)
                                              )
                                    )
                                        : ListTile(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                        onTap: (){
                                          controller.goToChatRoom(
                                              "${listDocsChats[index].id}",
                                              authC.user.value.email!,
                                              listDocsChats[index]["connection"]
                                          );
                                        },
                                        leading: CircleAvatar(
                                          radius: 30,
                                          child: data["photoUrl"] == "noimage"
                                              ? Image.asset("assets/logo/noimage.png",fit: BoxFit.cover,)
                                              : ClipRRect(
                                            child: Image.network(data["photoUrl"], fit: BoxFit.cover,),
                                            borderRadius: BorderRadius.circular(200),
                                          ),
                                          backgroundColor: Colors.black26,
                                        ),
                                        title: Text(
                                            "${data["name"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20
                                            )
                                        ),
                                        subtitle: Text(
                                            "${data["status"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16
                                            )
                                        ),
                                        trailing: listDocsChats[index]["total_unread"] == 0
                                            ? SizedBox()
                                            : Chip(
                                            backgroundColor: Colors.red[900],
                                            label: Text("${listDocsChats[index]["total_unread"]}",style: TextStyle(color: Colors.white),)
                                        )
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                            );
                          }
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(Routes.SEARCH);
          },
          child: Icon(Icons.search,size: 30,),
          backgroundColor: Colors.red[900],
      ),
    );
  }
}
