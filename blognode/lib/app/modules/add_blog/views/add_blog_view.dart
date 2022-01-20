import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_blog_controller.dart';

class AddBlogView extends GetView<AddBlogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Add"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddBlogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
