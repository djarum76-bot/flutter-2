import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecommerce/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController  with SingleGetTickerProviderMixin {
  final pageC = PageController(keepPage: true);
  late TabController tabController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final authC = Get.find<AuthController>();

  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID',decimalDigits: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 10, vsync: this);
  }

  Future<QuerySnapshot<Object?>> getDataUser()async{
    CollectionReference user = firestore.collection('users');

    return user.where('uid', isEqualTo: authC.box.read('uid')).get();
  }

  Stream<QuerySnapshot<Object?>> streamDataUser(){
    CollectionReference user = firestore.collection('users');

    return user.where('uid', isEqualTo: authC.box.read('uid')).snapshots();
  }
}
