import 'package:get/get.dart';
import 'package:instagram/app/modules/add/controllers/add_controller.dart';
import 'package:instagram/app/modules/add_story/controllers/add_story_controller.dart';
import 'package:instagram/app/modules/home/controllers/home_controller.dart';
import 'package:instagram/app/modules/profile/controllers/profile_controller.dart';

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
    Get.lazyPut<AddController>(
          () => AddController(),
    );
    Get.lazyPut<AddStoryController>(
          () => AddStoryController(),
    );
    Get.put(ProfileController());
  }
}
