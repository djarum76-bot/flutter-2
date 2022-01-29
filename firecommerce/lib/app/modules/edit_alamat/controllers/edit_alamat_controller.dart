import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAlamatController extends GetxController {
  late TextEditingController provinsi;
  late TextEditingController kabkot;
  late TextEditingController kec;
  late TextEditingController detail;
  late TextEditingController kodepos;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    provinsi = TextEditingController();
    kabkot = TextEditingController();
    kec = TextEditingController();
    detail = TextEditingController();
    kodepos = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provinsi.dispose();
    kabkot.dispose();
    kec.dispose();
    detail.dispose();
    kodepos.dispose();
  }
}
