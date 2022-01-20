import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/get_all_data_controller.dart';

class GetAllDataView extends GetView<GetAllDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetAllDataView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GetAllDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
