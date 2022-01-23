import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactUsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContactUsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
