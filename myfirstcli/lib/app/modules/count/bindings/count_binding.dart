import 'package:get/get.dart';

import 'package:myfirstcli/app/modules/count/controllers/dialogcontroller_controller.dart';

import '../controllers/count_controller.dart';

class CountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogcontrollerController>(
      () => DialogcontrollerController(),
    );
    Get.lazyPut<CountController>(
      () => CountController(),
    );
  }
}
