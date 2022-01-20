import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcreate/shopC.dart';
import 'package:getxcreate/shop_item.dart';

class ShopPage extends StatelessWidget{
  final shopC = Get.put(ShopC(),tag: 'total');
  final quantityC = Get.create(() => ShopC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Page"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return ShopItem();
          }
      ),
      floatingActionButton: CircleAvatar(
        child: Obx((){
          return Text("${shopC.total.value}");
        }),
      ),
    );
  }
}