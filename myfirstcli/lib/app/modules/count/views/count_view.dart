import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myfirstcli/app/modules/count/controllers/dialogcontroller_controller.dart';

import '../controllers/count_controller.dart';

class CountView extends GetView<CountController> {
  final dialogC = Get.find<DialogcontrollerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
