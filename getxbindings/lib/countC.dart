import 'package:get/get.dart';

class CountC extends GetxController{
  var count = 0.obs;

  void add() => count.value++;
}