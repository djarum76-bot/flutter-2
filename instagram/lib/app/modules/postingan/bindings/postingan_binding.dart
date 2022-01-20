import 'package:get/get.dart';

import '../controllers/postingan_controller.dart';

class PostinganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostinganController>(
      () => PostinganController(),
    );
  }
}
