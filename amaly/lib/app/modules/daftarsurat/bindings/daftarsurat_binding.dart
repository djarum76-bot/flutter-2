import 'package:get/get.dart';

import '../controllers/daftarsurat_controller.dart';

class DaftarsuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarsuratController>(
          () => DaftarsuratController(),
    );
    // Get.put(DaftarsuratController());
  }
}