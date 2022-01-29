import 'package:get/get.dart';

import 'package:firecommerce/app/modules/cart/bindings/cart_binding.dart';
import 'package:firecommerce/app/modules/cart/views/cart_view.dart';
import 'package:firecommerce/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:firecommerce/app/modules/checkout/views/checkout_view.dart';
import 'package:firecommerce/app/modules/detail/bindings/detail_binding.dart';
import 'package:firecommerce/app/modules/detail/views/detail_view.dart';
import 'package:firecommerce/app/modules/edit_alamat/bindings/edit_alamat_binding.dart';
import 'package:firecommerce/app/modules/edit_alamat/views/edit_alamat_view.dart';
import 'package:firecommerce/app/modules/edit_profil/bindings/edit_profil_binding.dart';
import 'package:firecommerce/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:firecommerce/app/modules/home/bindings/home_binding.dart';
import 'package:firecommerce/app/modules/home/views/home_view.dart';
import 'package:firecommerce/app/modules/login/bindings/login_binding.dart';
import 'package:firecommerce/app/modules/login/views/login_view.dart';
import 'package:firecommerce/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:firecommerce/app/modules/navbar/views/navbar_view.dart';
import 'package:firecommerce/app/modules/order_sukses/bindings/order_sukses_binding.dart';
import 'package:firecommerce/app/modules/order_sukses/views/order_sukses_view.dart';
import 'package:firecommerce/app/modules/pilih_alamat/bindings/pilih_alamat_binding.dart';
import 'package:firecommerce/app/modules/pilih_alamat/views/pilih_alamat_view.dart';
import 'package:firecommerce/app/modules/profile/bindings/profile_binding.dart';
import 'package:firecommerce/app/modules/profile/views/profile_view.dart';
import 'package:firecommerce/app/modules/register/bindings/register_binding.dart';
import 'package:firecommerce/app/modules/register/views/register_view.dart';
import 'package:firecommerce/app/modules/tambah_alamat/bindings/tambah_alamat_binding.dart';
import 'package:firecommerce/app/modules/tambah_alamat/views/tambah_alamat_view.dart';

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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_ALAMAT,
      page: () => PilihAlamatView(),
      binding: PilihAlamatBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_ALAMAT,
      page: () => TambahAlamatView(),
      binding: TambahAlamatBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ALAMAT,
      page: () => EditAlamatView(),
      binding: EditAlamatBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SUKSES,
      page: () => OrderSuksesView(),
      binding: OrderSuksesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => EditProfilView(),
      binding: EditProfilBinding(),
    ),
  ];
}
