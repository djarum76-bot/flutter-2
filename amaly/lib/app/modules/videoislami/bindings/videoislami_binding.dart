import 'package:get/get.dart';

import '../controllers/videoislami_controller.dart';

class VideoislamiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoislamiController>(
      () => VideoislamiController(),
    );
  }
}
