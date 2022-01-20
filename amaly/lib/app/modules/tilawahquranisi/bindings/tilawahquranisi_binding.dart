import 'package:get/get.dart';

import '../controllers/tilawahquranisi_controller.dart';

class TilawahquranisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TilawahquranisiController>(
      () => TilawahquranisiController(),
    );
  }
}
