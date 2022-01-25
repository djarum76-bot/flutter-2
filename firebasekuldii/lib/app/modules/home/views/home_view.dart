import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasekuldii/app/controllers/auth_controller.dart';
import 'package:firebasekuldii/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              authC.logout();
            }, 
            icon: Icon(Icons.arrow_forward_ios)
          )
        ],
      ),
      // ONE TIME FROM DATABASE
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: controller.getData(),
      //     builder: (context, snapshot){
      //       if(snapshot.connectionState == ConnectionState.done){
      //         var listAllDocs = snapshot.data!.docs;
      //         return ListView.builder(
      //             itemCount: listAllDocs.length,
      //             itemBuilder: (context, index){
      //               var data = listAllDocs[index].data() as Map<String, dynamic>;
      //               return ListTile(
      //                 title: Text("${data["name"]}"),
      //                 subtitle: Text("Rp ${data["price"]}"),
      //               );
      //             }
      //         );
      //       }
      //       return Center(child: CircularProgressIndicator(),);
      //     }
      // ),

      //REALTIME DATABASE
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              var listAllDocs = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index){
                    var data = listAllDocs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      onTap: (){
                        Get.toNamed(Routes.EDIT_PRODUCT, arguments: listAllDocs[index].id);
                      },
                      leading: Image.network("${data["gambar"]}"),
                      title: Text("${data["name"]}"),
                      subtitle: Text("Rp ${data["price"]}"),
                      trailing: IconButton(
                          onPressed: (){
                            controller.deleteProduct(listAllDocs[index].id);
                          },
                          icon: Icon(Icons.delete)
                      ),
                    );
                  }
              );
            }
            return Center(child: CircularProgressIndicator(),);
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(Routes.ADD_PRODUCT);
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
