import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigation/page2.dart';

class PageSatu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Satu"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                // onPressed: ()async{
                //   var data = await Get.to(() => PageDua());
                //   print("Hasil = $data");
                // },

                onPressed: (){
                  // navigator!.push(MaterialPageRoute(builder: (_){
                  //   return PageDua();
                  // }));

                  // Get.to(() => PageDua()); //push
                  // Get.to(() => PageDua(),arguments: "Dari Page 1"); //push dengan arguments

                  // Get.off(() => PageDua()); //pushReplacement
                  // Get.off(() => PageDua(), arguments: "Ini arguments page 1"); //pushReplacement dengan arguments

                  Get.toNamed("/page2"); //push pakai nama

                  // Get.offNamed("/page2"); //pushReplacement pakai nama
                },
                child: Text("Next Page")
            )
          ],
        ),
      ),
    );
  }
}