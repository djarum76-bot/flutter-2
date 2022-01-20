import 'package:get/get.dart';
import 'package:getxgetconnect/controllers/addC.dart';

class AddUserB implements Bindings {
  @override
  void dependencies() {
    Get.put(AddC());
  }
}