import 'package:get/get.dart';

import '../controllers/select_contact_controller.dart';

class SelectContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectContactController>(
      () => SelectContactController(),
    );
  }
}
