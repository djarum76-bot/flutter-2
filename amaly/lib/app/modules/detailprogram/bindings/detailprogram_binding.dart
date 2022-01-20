import 'package:get/get.dart';

import '../controllers/detailprogram_controller.dart';

class DetailprogramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailprogramController>(
      () => DetailprogramController(),
    );
  }
}
