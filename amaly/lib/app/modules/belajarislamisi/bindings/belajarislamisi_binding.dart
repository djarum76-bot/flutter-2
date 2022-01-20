import 'package:get/get.dart';

import '../controllers/belajarislamisi_controller.dart';

class BelajarislamisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BelajarislamisiController>(
      () => BelajarislamisiController(),
    );
  }
}
