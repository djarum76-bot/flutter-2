import 'package:get/get.dart';

import '../controllers/ditandai_controller.dart';

class DitandaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DitandaiController>(
      () => DitandaiController(),
    );
  }
}
