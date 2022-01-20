import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comment_controller.dart';

class CommentView extends GetView<CommentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: controller.getComments(Get.arguments),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return Obx((){
                    return Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: controller.authC.comments.value.post!.length,
                                itemBuilder: (context, index){
                                  var data = controller.authC.comments.value.post![index];
                                  return Container(
                                    padding: EdgeInsets.all(Get.height * 0.01225490196),
                                    width: Get.height,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: Colors.black26, width: 0.5)
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: Get.height * 0.03676470588,
                                                  height: Get.height * 0.03676470588,
                                                  decoration: BoxDecoration(
                                                      image: data.user!.image != null
                                                          ? DecorationImage(
                                                          image: NetworkImage("${data.user!.image}"),
                                                          fit: BoxFit.cover
                                                      )
                                                          : null,
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.blueGrey
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text(
                                                  "${data.user!.name}",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16
                                                  ),
                                                )
                                              ],
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
                                                  controller.send.value = 1;
                                                  controller.edit.value = data.id!;
                                                  controller.comment.text = data.comment!;
                                                }else{
                                                  //delete
                                                  controller.deleteComment(data.id!, Get.arguments);
                                                }
                                              },
                                            )
                                                : SizedBox()
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Obx((){
                                          return Text(
                                              "${controller.commentL.value[index]}"
                                          );
                                        })
                                      ],
                                    ),
                                  );
                                }
                            )
                        ),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(Get.height * 0.01225490196),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.black26, width: 0.5)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Comment",
                                        border: OutlineInputBorder()
                                    ),
                                    controller: controller.comment,
                                    onSaved: (String? e) => controller.comment.text = e!,
                                  )
                              ),
                              IconButton(
                                  onPressed: (){
                                    if(controller.comment.text.isEmpty){

                                    }else{
                                      controller.send.value == 0
                                          ? controller.createComments(Get.arguments)
                                          : controller.editComment(controller.edit.value);
                                    }
                                  },
                                  icon: Icon(Icons.send)
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
                }
              }
          )
      ),
    );
  }
}
