import 'package:get/get.dart';

import 'package:amaly/app/modules/belajarislam/bindings/belajarislam_binding.dart';
import 'package:amaly/app/modules/belajarislam/views/belajarislam_view.dart';
import 'package:amaly/app/modules/belajarislamisi/bindings/belajarislamisi_binding.dart';
import 'package:amaly/app/modules/belajarislamisi/views/belajarislamisi_view.dart';
import 'package:amaly/app/modules/daftarsurat/bindings/daftarsurat_binding.dart';
import 'package:amaly/app/modules/daftarsurat/views/daftarsurat_view.dart';
import 'package:amaly/app/modules/detailberita/bindings/detailberita_binding.dart';
import 'package:amaly/app/modules/detailberita/views/detailberita_view.dart';
import 'package:amaly/app/modules/detailprogram/bindings/detailprogram_binding.dart';
import 'package:amaly/app/modules/detailprogram/views/detailprogram_view.dart';
import 'package:amaly/app/modules/detailprogramnominal/bindings/detailprogramnominal_binding.dart';
import 'package:amaly/app/modules/detailprogramnominal/views/detailprogramnominal_view.dart';
import 'package:amaly/app/modules/home/bindings/home_binding.dart';
import 'package:amaly/app/modules/home/views/home_view.dart';
import 'package:amaly/app/modules/isisurat/bindings/isisurat_binding.dart';
import 'package:amaly/app/modules/isisurat/views/isisurat_view.dart';
import 'package:amaly/app/modules/metodepembayaran/bindings/metodepembayaran_binding.dart';
import 'package:amaly/app/modules/metodepembayaran/views/metodepembayaran_view.dart';
import 'package:amaly/app/modules/tanyaustadz/bindings/tanyaustadz_binding.dart';
import 'package:amaly/app/modules/tanyaustadz/views/tanyaustadz_view.dart';
import 'package:amaly/app/modules/tilawahquran/bindings/tilawahquran_binding.dart';
import 'package:amaly/app/modules/tilawahquran/views/tilawahquran_view.dart';
import 'package:amaly/app/modules/tilawahquranisi/bindings/tilawahquranisi_binding.dart';
import 'package:amaly/app/modules/tilawahquranisi/views/tilawahquranisi_view.dart';
import 'package:amaly/app/modules/videoislami/bindings/videoislami_binding.dart';
import 'package:amaly/app/modules/videoislami/views/videoislami_view.dart';

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
      name: _Paths.DAFTARSURAT,
      page: () => DaftarsuratView(),
      binding: DaftarsuratBinding(),
    ),
    GetPage(
      name: _Paths.ISISURAT,
      page: () => IsisuratView(),
      binding: IsisuratBinding(),
    ),
    GetPage(
      name: _Paths.BELAJARISLAM,
      page: () => BelajarislamView(),
      binding: BelajarislamBinding(),
    ),
    GetPage(
      name: _Paths.BELAJARISLAMISI,
      page: () => BelajarislamisiView(),
      binding: BelajarislamisiBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPROGRAM,
      page: () => DetailprogramView(),
      binding: DetailprogramBinding(),
    ),
    GetPage(
      name: _Paths.TILAWAHQURAN,
      page: () => TilawahquranView(),
      binding: TilawahquranBinding(),
    ),
    GetPage(
      name: _Paths.TILAWAHQURANISI,
      page: () => TilawahquranisiView(),
      binding: TilawahquranisiBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOISLAMI,
      page: () => VideoislamiView(),
      binding: VideoislamiBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPROGRAMNOMINAL,
      page: () => DetailprogramnominalView(),
      binding: DetailprogramnominalBinding(),
    ),
    GetPage(
      name: _Paths.METODEPEMBAYARAN,
      page: () => MetodepembayaranView(),
      binding: MetodepembayaranBinding(),
    ),
    GetPage(
      name: _Paths.DETAILBERITA,
      page: () => DetailberitaView(),
      binding: DetailberitaBinding(),
    ),
    GetPage(
      name: _Paths.TANYAUSTADZ,
      page: () => TanyaustadzView(),
      binding: TanyaustadzBinding(),
    ),
  ];
}
