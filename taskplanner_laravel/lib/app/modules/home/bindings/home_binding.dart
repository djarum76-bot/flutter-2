import 'package:get/get.dart';
import 'package:taskplanner/app/modules/note/controllers/note_controller.dart';
import 'package:taskplanner/app/modules/task/controllers/task_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(TaskController());
    Get.put(NoteController());
  }
}
