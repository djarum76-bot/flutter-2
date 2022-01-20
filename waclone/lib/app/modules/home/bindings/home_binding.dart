import 'package:get/get.dart';
import 'package:waclone/app/modules/camera_page/controllers/camera_page_controller.dart';
import 'package:waclone/app/modules/chats_page/controllers/chats_page_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ChatsPageController>(
          () => ChatsPageController(),
    );
    Get.lazyPut<CameraPageController>(
          () => CameraPageController(),
    );
  }
}
