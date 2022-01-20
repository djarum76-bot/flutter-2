import 'dart:async';
import 'dart:io';

import 'package:chatapp/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final authC = Get.find<AuthController>();
  final String chat_id = (Get.arguments as Map<String, dynamic>)["chat_id"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.red[900],
        leadingWidth: 100,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            ClipRRect(
              child: CircleAvatar(
                radius: 25,
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: controller.streamFriendData((Get.arguments as Map<String,dynamic>)["friendEmail"]),
                    builder: (context, snapFriendUser){
                      if(snapFriendUser.connectionState == ConnectionState.active){
                        var dataFriend = snapFriendUser.data!.data() as Map<String, dynamic>;
                        if(dataFriend["photoUrl"] == "noimage"){
                          return Image.asset("assets/logo/noimage.png",fit: BoxFit.cover,);
                        }else{
                          return Image.network(dataFriend["photoUrl"], fit: BoxFit.cover,);
                        }
                      }
                      return Image.asset("assets/logo/noimage.png",fit: BoxFit.cover,);
                    }
                ),
              ),
              borderRadius: BorderRadius.circular(200),
            )
          ],
        ),
        title: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.streamFriendData((Get.arguments as Map<String,dynamic>)["friendEmail"]),
            builder: (context, snapFriendUser){
              if(snapFriendUser.connectionState == ConnectionState.active){
                var dataFriend = snapFriendUser.data!.data() as Map<String, dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${dataFriend["name"]}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        )
                    ),
                    Text(
                        "${dataFriend["status"]}",
                        style: TextStyle(
                            fontSize: 14
                        )
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Tunggu BGST",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  Text(
                      "Tunggu BGST",
                      style: TextStyle(
                          fontSize: 14
                      )
                  ),
                ],
              );
            }
        ),
      ),
      body: WillPopScope(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: controller.streamChats(chat_id),
                        builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.active){
                            var alldata = snapshot.data!.docs;
                            Timer(Duration.zero, ()=>controller.scrollC.jumpTo(controller.scrollC.position.maxScrollExtent));
                            return ListView.builder(
                                controller: controller.scrollC,
                                itemCount: alldata.length,
                                itemBuilder: (context, index){
                                  if(index == 0){
                                    return Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        Text("${alldata[index]["groupTime"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                        ItemChat(
                                          isSender: alldata[index]["pengirim"] == authC.user.value.email!,
                                          msg: "${alldata[index]["msg"]}",
                                          time: "${alldata[index]["time"]}",
                                        )
                                      ],
                                    );
                                  }else{
                                    if(alldata[index]["groupTime"] == alldata[index-1]["groupTime"]){
                                      return ItemChat(
                                        isSender: alldata[index]["pengirim"] == authC.user.value.email!,
                                        msg: "${alldata[index]["msg"]}",
                                        time: "${alldata[index]["time"]}",
                                      );
                                    }else{
                                      return Column(
                                        children: [
                                          Text("${alldata[index]["groupTime"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                          ItemChat(
                                            isSender: alldata[index]["pengirim"] == authC.user.value.email!,
                                            msg: "${alldata[index]["msg"]}",
                                            time: "${alldata[index]["time"]}",
                                          )
                                        ],
                                      );
                                    }
                                  }
                                }
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            autocorrect: false,
                            controller: controller.chatC,
                            focusNode: controller.focusNode,
                            onEditingComplete: (){
                              controller.newChat(
                                  authC.user.value.email!,
                                  Get.arguments as Map<String, dynamic>,
                                  controller.chatC.text
                              );
                            },
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: (){
                                      controller.focusNode.unfocus();
                                      controller.isShowEmoji.toggle();
                                    },
                                    icon: Icon(Icons.emoji_emotions_outlined)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                            ),
                          ),
                        )
                    ),
                    SizedBox(width: 10,),
                    Material(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red[900],
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: (){
                          controller.newChat(
                              authC.user.value.email!,
                              Get.arguments as Map<String, dynamic>,
                              controller.chatC.text
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.send,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx((){
                if(controller.isShowEmoji.isTrue)
                  return Container(
                    height: 325,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        // Do something when emoji is tapped
                        controller.addEmojiToChat(emoji);
                      },
                      onBackspacePressed: () {
                        // Backspace-Button tapped logic
                        // Remove this line to also remove the button in the UI
                        controller.deleteEmoji();
                      },
                      config: Config(
                          backspaceColor: Color(0xFFB71C1C),
                          columns: 7,
                          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          initCategory: Category.RECENT,
                          bgColor: Color(0xFFF2F2F2),
                          indicatorColor: Color(0xFFB71C1C),
                          iconColor: Colors.grey,
                          iconColorSelected: Color(0xFFB71C1C),
                          progressIndicatorColor: Color(0xFFB71C1C),
                          showRecentsTab: true,
                          recentsLimit: 28,
                          noRecentsText: "No Recents",
                          noRecentsStyle:
                          const TextStyle(fontSize: 20, color: Colors.black26),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL
                      ),
                    ),
                  );
                else
                  return Container();
              })
            ],
          ),
          onWillPop: (){
            if(controller.isShowEmoji.isTrue){
              controller.isShowEmoji.value = false;
            }else{
              Navigator.pop(context);
            }
            return Future.value(false);
          }
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key, required this.isSender, required this.msg, required this.time,
  }) : super(key: key);

  final bool isSender;
  final String msg;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text("${msg}", style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: isSender
                  ? BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )
                  : BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
            ),
          ),
          SizedBox(height: 5,),
          Text("${DateFormat.jm().format(DateTime.parse(time))}"),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
