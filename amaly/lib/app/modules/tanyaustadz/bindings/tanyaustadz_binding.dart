import 'package:get/get.dart';

import '../controllers/tanyaustadz_controller.dart';

class TanyaustadzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TanyaustadzController>(
      () => TanyaustadzController(),
    );
  }
}
