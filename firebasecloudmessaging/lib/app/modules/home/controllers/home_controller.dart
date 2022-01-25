import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  void sub()async{
    await FirebaseMessaging.instance.subscribeToTopic('bleach');
  }
}
