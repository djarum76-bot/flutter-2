import 'package:blognode/app/routes/app_pages.dart';
import 'package:blognode/app/services/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();

  logout()async{
    authC.box.remove('token');
    Get.offAllNamed(Routes.WELCOME);
  }
}
