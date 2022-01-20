import 'package:blog_app/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:blog_app/app/modules/home/controllers/home_controller.dart';
import 'package:blog_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
    Get.lazyPut<AddPostController>(
          () => AddPostController(),
    );
  }
}
