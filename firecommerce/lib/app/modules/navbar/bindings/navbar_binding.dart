import 'package:firecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:firecommerce/app/modules/profile/controllers/profile_controller.dart';
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
  }
}
