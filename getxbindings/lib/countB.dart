import 'package:get/get.dart';
import 'package:getxbindings/countC.dart';

class CountB implements Bindings{
  @override
  void dependencies() {
    Get.put(CountC());
  }
}