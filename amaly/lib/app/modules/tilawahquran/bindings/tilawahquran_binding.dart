import 'package:get/get.dart';

import '../controllers/tilawahquran_controller.dart';

class TilawahquranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TilawahquranController>(
      () => TilawahquranController(),
    );
  }
}
