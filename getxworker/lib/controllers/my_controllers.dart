import 'package:get/get.dart';

class MyController extends GetxController{
  var count = 0.obs;
  var data = 0.obs;

  void change() => count.value++;

  void reset() => count.value = 0;

  @override
  void onInit() {
    // ever(count, (callback) => print("JALAN BOSS"));
    // everAll([count,data], (callback) => print("JALANsdas BOSS"));
    // once(count, (callback) => print("INI oNCE"));
    // debounce(count, (callback) => print("debounce"),time: Duration(seconds: 3));
    interval(count, (callback) => print("Interval"),time: Duration(seconds: 3));
    super.onInit();
  }
}