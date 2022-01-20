import 'package:get/get.dart';
import 'package:getxgetconnect/bindings/addB.dart';
import 'package:getxgetconnect/bindings/profileB.dart';
import 'package:getxgetconnect/pages/add_page.dart';
import 'package:getxgetconnect/pages/home_page.dart';
import 'package:getxgetconnect/pages/profile_page.dart';
import 'package:getxgetconnect/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => ProfilePage(),
      binding: ProfileB(),
    ),
    GetPage(
      name: RouteName.add,
      page: () => AddPage(),
      binding: AddUserB(),
    ),
  ];
}