import 'package:get/get.dart';

import 'package:mygetcli/app/modules/add/bindings/add_binding.dart';
import 'package:mygetcli/app/modules/add/views/add_view.dart';
import 'package:mygetcli/app/modules/edit/bindings/edit_binding.dart';
import 'package:mygetcli/app/modules/edit/views/edit_view.dart';
import 'package:mygetcli/app/modules/home/bindings/home_binding.dart';
import 'package:mygetcli/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => EditView(),
      binding: EditBinding(),
    ),
  ];
}
