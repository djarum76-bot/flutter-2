import 'package:get/get.dart';
import 'package:getxstatemixin/myC.dart';

class MyB extends Bindings{
  @override
  void dependencies() {
    Get.put(MyC());
  }
}