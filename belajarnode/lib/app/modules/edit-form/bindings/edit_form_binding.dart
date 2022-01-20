import 'package:get/get.dart';

import '../controllers/edit_form_controller.dart';

class EditFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditFormController>(
      () => EditFormController(),
    );
  }
}
