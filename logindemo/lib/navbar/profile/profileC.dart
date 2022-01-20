import 'package:get/get.dart';
import 'package:logindemo/global.dart';
import 'package:logindemo/login.dart';
import 'package:logindemo/navbar/navbarC.dart';

class ProfileC extends GetxController{

  final navbarC = Get.find<NavBarC>();
  final globalC = Get.find<Global>();

  logout()async{
    final response = await dio.post('/api/v1/auth/login');

    if(response.statusCode == 200){
      globalC.box.remove('token');
      globalC.box.remove('username');
      globalC.box.remove('password');
      globalC.box.write('autologin', false);
      navbarC.currentIndex.value = 0;
      Get.offAll(() => LoginPage());
    }
  }
}