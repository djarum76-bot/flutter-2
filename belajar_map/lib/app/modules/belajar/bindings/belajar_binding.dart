import 'package:get/get.dart';

import '../controllers/belajar_controller.dart';

class BelajarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BelajarController>(
      () => BelajarController(),
    );
  }
}
