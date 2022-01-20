import 'package:get/get.dart';

import 'package:belajarnode/app/modules/detail/bindings/detail_binding.dart';
import 'package:belajarnode/app/modules/detail/views/detail_view.dart';
import 'package:belajarnode/app/modules/edit-form/bindings/edit_form_binding.dart';
import 'package:belajarnode/app/modules/edit-form/views/edit_form_view.dart';
import 'package:belajarnode/app/modules/form/bindings/form_binding.dart';
import 'package:belajarnode/app/modules/form/views/form_view.dart';
import 'package:belajarnode/app/modules/home/bindings/home_binding.dart';
import 'package:belajarnode/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => FormView(),
      binding: FormBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_FORM,
      page: () => EditFormView(),
      binding: EditFormBinding(),
    ),
  ];
}
