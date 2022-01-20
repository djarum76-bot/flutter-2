import 'package:get/get.dart';

import '../controllers/belajarislam_controller.dart';

class BelajarislamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BelajarislamController>(
      () => BelajarislamController(),
    );
  }
}
