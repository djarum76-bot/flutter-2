import 'package:get/get.dart';

import '../controllers/metodepembayaran_controller.dart';

class MetodepembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MetodepembayaranController>(
      () => MetodepembayaranController(),
    );
  }
}
