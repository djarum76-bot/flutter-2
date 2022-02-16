import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/models/note_models.dart';
import 'package:taskplanner/app/modules/home/controllers/home_controller.dart';
import 'package:taskplanner/app/modules/note/controllers/note_controller.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class DetailNoteController extends GetxController {
  final authC = Get.find<AuthController>();
  final noteC = Get.find<NoteController>();
  final homeC = Get.find<HomeController>();

  final judul = "".obs;
  final konten = "".obs;
  final id = 0.obs;

  getNote()async{
    final response = await dio.get('/notes/${Get.arguments}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.note(NoteModel.fromJson(data));
      authC.note.refresh();

      judul.value = authC.note.value.note![0].title!;
      konten.value = authC.note.value.note![0].content!;
      id.value = authC.note.value.note![0].id!;
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password'),
      });

      final responseLogin = await dio.post('/login',
          data: formData,
          options: Dio.Options(
              headers: {
                "Accept": "application/json"
              }
          )
      );

      final dataLogin = responseLogin.data;

      if(responseLogin.statusCode == 200){
        authC.box.write('token', dataLogin["token"]);
        getNote();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  deleteNote()async{
    final response = await dio.delete('/notes/${Get.arguments}',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      await homeC.getNotes();
      await noteC.getNotes();
      Get.back();
    }else{
      Dio.FormData formData = Dio.FormData.fromMap({
        'username':authC.box.read('username'),
        'password':authC.box.read('password'),
      });

      final responseLogin = await dio.post('/login',
          data: formData,
          options: Dio.Options(
              headers: {
                "Accept": "application/json"
              }
          )
      );

      final dataLogin = responseLogin.data;

      if(responseLogin.statusCode == 200){
        authC.box.write('token', dataLogin["token"]);
        deleteNote();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
