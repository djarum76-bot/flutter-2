import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/get_my_data_controller.dart';

class GetMyDataView extends GetView<GetMyDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetMyDataView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GetMyDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
