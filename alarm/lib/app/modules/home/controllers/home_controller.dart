import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final time = TimeOfDay.now().obs;

  void onTimeChanged(TimeOfDay newTime) {
    time.value = newTime;
  }

  alarm(DateTime time)async{
    final int isolateId = Isolate.current.hashCode;
    print("[$time] Hello, world! isolate=${isolateId} function='$alarm'");
  }
}
