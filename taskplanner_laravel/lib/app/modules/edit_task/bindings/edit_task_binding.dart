import 'package:get/get.dart';

import '../controllers/edit_task_controller.dart';

class EditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTaskController>(
      () => EditTaskController(),
    );
  }
}
