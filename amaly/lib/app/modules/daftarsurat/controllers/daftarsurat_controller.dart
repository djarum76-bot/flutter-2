import 'dart:convert';

import 'package:amaly/app/modules/daftarsurat/providers/surat_provider.dart';
import 'package:get/get.dart';

class DaftarsuratController extends GetxController with StateMixin<List<dynamic>>{
  final nomor = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SuratProvider().getSurat().then((value){
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}