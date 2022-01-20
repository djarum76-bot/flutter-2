import 'package:get/get.dart';

import '../ayat_model.dart';

class AyatProvider extends GetConnect {
  Future<Map<String,dynamic>> getAyat(int nomor)async{
    final response = await get('https://equran.id/api/surat/${nomor}');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      return response.body;
    }
  }
}
