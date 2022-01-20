import 'package:get/get.dart';

import '../controllers/chats_page_controller.dart';

class ChatsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatsPageController>(
      () => ChatsPageController(),
    );
  }
}
