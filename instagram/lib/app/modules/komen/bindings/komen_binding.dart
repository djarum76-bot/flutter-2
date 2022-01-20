import 'package:get/get.dart';

import '../controllers/komen_controller.dart';

class KomenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KomenController>(
      () => KomenController(),
    );
  }
}
