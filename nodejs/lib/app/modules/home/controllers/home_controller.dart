import 'package:get/get.dart';
import 'package:nodejs/app/routes/app_pages.dart';
import 'package:nodejs/app/services/auth_controller.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();

  logout(){
    authC.box.remove('token');
    authC.box.remove('password');
    authC.box.remove('email');
    authC.box.remove('id');

    Get.offAllNamed(Routes.LOGIN);
  }
}
