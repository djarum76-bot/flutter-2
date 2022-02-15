import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/models/notes_model.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class NoteController extends GetxController {
  final authC = Get.find<AuthController>();

  final jumlahNote = 0.obs;
  final judulNote = <String>[].obs;
  final idNote = <int>[].obs;

  getNotes()async{
    final response = await dio.get('/notes',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.notes2(NotesModel.fromJson(data));
      authC.notes2.refresh();

      jumlahNote.value = authC.notes2.value.notes!.length;

      judulNote.clear();

      for(int i=0;i<authC.notes2.value.notes!.length;i++){
        judulNote.add(authC.notes2.value.notes![i].title!);
        judulNote.refresh();

        idNote.add(authC.notes2.value.notes![i].id!);
        idNote.refresh();
      }
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
        getNotes();
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
