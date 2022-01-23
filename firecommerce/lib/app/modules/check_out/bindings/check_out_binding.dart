import 'package:get/get.dart';

import '../controllers/check_out_controller.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(
      () => CheckOutController(),
    );
  }
}
