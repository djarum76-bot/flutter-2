import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_storage_controller.dart';

class HomeStorageView extends GetView<HomeStorageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeStorageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeStorageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.uploadMultiFile();
          },
      ),
    );
  }
}
