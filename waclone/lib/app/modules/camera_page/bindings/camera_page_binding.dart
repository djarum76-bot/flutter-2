import 'package:get/get.dart';

import '../controllers/camera_page_controller.dart';

class CameraPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraPageController>(
      () => CameraPageController(),
    );
  }
}
