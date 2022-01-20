import 'package:get/get.dart';
import 'package:getxgetstorage/pages/home.dart';
import 'package:getxgetstorage/pages/login.dart';
import 'package:getxgetstorage/routes/route_name.dart';

class AppPage{
  static final pages = [
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
  ];
}