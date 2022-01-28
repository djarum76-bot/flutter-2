import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController  with SingleGetTickerProviderMixin {
  final pageC = PageController(keepPage: true);

  late TabController tabController;

  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 10, vsync: this);
  }
}
