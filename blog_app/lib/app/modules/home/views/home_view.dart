import 'package:blog_app/app/routes/app_pages.dart';
import 'package:blog_app/app/service/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getPosts(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return Obx((){
                    return ListView.builder(
                        itemCount: controller.authC.posts.value.posts!.length,
                        itemBuilder: (context, index){
                          var data = controller.authC.posts.value.posts![index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.00490196078, vertical: Get.height * 0.01225490196),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: Get.height * 0.00735294117),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: Get.height * 0.04656862745,
                                            height: Get.height * 0.04656862745,
                                            decoration: BoxDecoration(
                                                image: data.user!.image != null
                                                    ? DecorationImage(
                                                    image: NetworkImage(
                                                        "${data.user!.image}"
                                                    )
                                                )
                                                    : null,
                                                borderRadius: BorderRadius.circular(25),
                                                color: Colors.amber
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            "${data.user!.name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    data.user!.id == controller.authC.box.read('user_id')
                                        ? PopupMenuButton(
                                            child: Padding(
                                              padding: EdgeInsets.only(right: Get.height * 0.01225490196),
                                              child: Icon(Icons.more_vert, color: Colors.black,),
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: Text("Edit"),
                                                value: 'Edit',
                                              ),
                                              PopupMenuItem(
                                                child: Text("Delete"),
                                                value: 'Delete',
                                              )
                                            ],
                                            onSelected: (val){
                                              if(val == 'Edit'){
                                                //edit
                                                Get.toNamed(Routes.EDIT_POST, arguments: data.id);
                                              }else{
                                                //delete
                                                controller.deletePost(data.id!);
                                              }
                                            },
                                          )
                                        : SizedBox()
                                  ],
                                ),
                                SizedBox(height: 12,),
                                Text("${data.body}"),
                                data.image != null
                                    ? Container(
                                  width: Get.width,
                                  height: Get.height * 0.22058823529,
                                  margin: EdgeInsets.only(top: Get.height * 0.00612745098),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("${data.image}"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                )
                                    : SizedBox(height: data.image != null ? 0 : 10),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Material(
                                          child: InkWell(
                                            onTap: (){
                                              controller.likeUnlike(data.id!);
                                            },
                                            child: Obx((){
                                              return Padding(
                                                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01225490196),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    controller.liked.value[index]
                                                        ? Icon(Icons.favorite, size: 16, color: Colors.red,)
                                                        : Icon(Icons.favorite_outline, size: 16,),
                                                    SizedBox(width: 4,),
                                                    Text("${controller.likeC.value[index]}")
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        )
                                    ),
                                    Container(
                                      height: Get.height * 0.0306372549,
                                      width: Get.height * 0.00061274509,
                                      color: Colors.black38,
                                    ),
                                    Expanded(
                                        child: Material(
                                          child: InkWell(
                                            onTap: (){
                                              Get.toNamed(Routes.COMMENT, arguments: data.id);
                                            },
                                            child: Obx((){
                                              return Padding(
                                                padding: EdgeInsets.symmetric(vertical: Get.height * 0.01225490196),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.sms_outlined, size: 16,),
                                                    SizedBox(width: 4,),
                                                    Text("${controller.comment.value[index]}")
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                                Container(
                                  width: Get.width,
                                  height: Get.height * 0.00061274509,
                                  color: Colors.black26,
                                )
                              ],
                            ),
                          );
                        }
                    );
                  });
                }
              }
          )
      ),
    );
  }
}
