import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter = 0.obs;

  var isDark = false.obs;

  void changeTheme() => isDark.value = !isDark.value;

  void increment() => counter.value++;
}