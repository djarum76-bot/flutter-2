import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxworker/controllers/my_controllers.dart';

class HomePage extends StatelessWidget{
  final myC = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                myC.reset();
              },
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx((){
                  return Text(
                    "Terjadi sesuatu sebanyak ${myC.count.value}x",
                    style: TextStyle(fontSize: 25),
                  );
                }),
                SizedBox(height: 30,),
                TextField(
                  onChanged: (_) => myC.change(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                )
              ],
            ),
          ),
      )
    );
  }
}