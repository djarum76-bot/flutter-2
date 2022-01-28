import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final tabIndex = 0.obs;

  void pindahTab(int index){
    tabIndex.value = index;
  }
}
