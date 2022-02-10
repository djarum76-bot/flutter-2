import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNoteController extends GetxController {
  late TextEditingController title;
  late TextEditingController content;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title = TextEditingController();
    content = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }
}
