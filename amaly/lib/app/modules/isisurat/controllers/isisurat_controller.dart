import 'dart:convert';

import 'package:amaly/app/modules/daftarsurat/controllers/daftarsurat_controller.dart';
import 'package:amaly/app/modules/isisurat/ayat_model.dart';
import 'package:amaly/app/modules/isisurat/providers/ayat_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:amaly/app/modules/isisurat/providers/ayat_provider.dart';
import 'package:get/get.dart';

class IsisuratController extends GetxController with StateMixin<Map<String,dynamic>> {
  final isPlay = false.obs;
  final isFavor = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    AyatProvider().getAyat(Get.find<DaftarsuratController>().nomor.value).then((value){
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

// class IsisuratController extends GetxController{
//   final isPlay = false.obs;
//   final isFavor = false.obs;
//   final listAyat = <Ayat>[];
//
//   getData(String nomor)async{
//     final response = await http.get(Uri.parse("https://api.npoint.io/99c279bb173a6e28359c/surat/$nomor"));
//     final data = jsonDecode(response.body);
//     data.forEach((api){
//       final ab = new Ayat(
//         ar: api["ar"],
//         id: api["id"],
//         nomor: api["nomor"],
//         tr: api["tr"],
//       );
//       listAyat.add(ab);
//     });
//   }
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getData(Get.find<DaftarsuratController>().nomor);
//     super.onInit();
//   }
// }