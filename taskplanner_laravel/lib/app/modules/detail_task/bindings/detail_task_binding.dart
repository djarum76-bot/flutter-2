import 'package:get/get.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTaskController>(
      () => DetailTaskController(),
    );
  }
}
