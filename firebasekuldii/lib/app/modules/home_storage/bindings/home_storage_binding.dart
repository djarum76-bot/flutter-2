import 'package:get/get.dart';

import '../controllers/home_storage_controller.dart';

class HomeStorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStorageController>(
      () => HomeStorageController(),
    );
  }
}
