import 'package:get/get.dart';

import '../controllers/add_blog_controller.dart';

class AddBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBlogController>(
      () => AddBlogController(),
    );
  }
}
