import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product ${Get.parameters['id']}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ini Anime ${Get.parameters['name']} dengan rating ${Get.parameters['rating']}")
          ],
        ),
      ),
    );
  }
}