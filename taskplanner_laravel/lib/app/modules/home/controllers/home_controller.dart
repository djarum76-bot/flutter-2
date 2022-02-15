import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:taskplanner/app/controllers/auth_controller.dart';
import 'package:taskplanner/app/models/home_task_model.dart';
import 'package:taskplanner/app/models/notes_model.dart';
import 'package:taskplanner/app/models/tasks_model.dart';
import 'package:taskplanner/app/models/user_model.dart';
import 'package:taskplanner/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final authC = Get.find<AuthController>();

  final judul = <String>[].obs;
  final tanggal = <DateTime>[].obs;
  final waktu = <String>[].obs;
  final jumlah = 0.obs;

  final jumlahNote = 0.obs;
  final judulNote = <String>[].obs;
  final idNote = <int>[].obs;

  getUser()async{
    final response = await dio.get('/user',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.user(UserModel.fromJson(data));
      authC.user.refresh();
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
        getUser();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  getTasks()async{
    final response = await dio.get('/tasks',
      options: Dio.Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "${authC.box.read('token')}"
        }
      )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.homeTask(HomeTaskModel.fromJson(data));
      authC.homeTask.refresh();

      jumlah.value = authC.homeTask.value.tasks!.length;

      judul.clear();
      tanggal.clear();
      waktu.clear();
      for(int i=0;i<authC.homeTask.value.tasks!.length;i++){
        judul.add(authC.homeTask.value.tasks![i].title!);
        judul.refresh();

        tanggal.add(authC.homeTask.value.tasks![i].tanggal!);
        tanggal.refresh();

        waktu.add(authC.homeTask.value.tasks![i].waktu!);
        waktu.refresh();
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
        getTasks();
      }else{
        Get.defaultDialog(
            title: "Error",
            middleText: "Sesi anda berakhir"
        );
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  getNotes()async{
    final response = await dio.get('/noteshome',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.notes(NotesModel.fromJson(data));
      authC.notes.refresh();

      jumlahNote.value = authC.notes.value.notes!.length;

      judulNote.clear();

      for(int i=0;i<authC.notes.value.notes!.length;i++){
        judulNote.add(authC.notes.value.notes![i].title!);
        judulNote.refresh();

        idNote.add(authC.notes.value.notes![i].id!);
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

  logout()async{
    final response = await dio.post('/logout',
        options: Dio.Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "${authC.box.read('token')}"
            }
        )
    );

    final data = response.data;

    if(response.statusCode == 200){
      authC.box.remove('token');
      authC.box.remove('username');
      authC.box.remove('password');
      Get.offAllNamed(Routes.LOGIN);
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
        logout();
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
