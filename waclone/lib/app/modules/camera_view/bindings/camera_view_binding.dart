import 'package:get/get.dart';

import '../controllers/camera_view_controller.dart';

class CameraViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraViewController>(
      () => CameraViewController(),
    );
  }
}
