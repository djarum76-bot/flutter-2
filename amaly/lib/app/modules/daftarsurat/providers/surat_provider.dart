import 'package:get/get.dart';

import '../surat_model.dart';

class SuratProvider extends GetConnect {
  Future<List<dynamic>> getSurat()async{
    final response = await get('https://equran.id/api/surat');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      return response.body;
    }
  }
}
