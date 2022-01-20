import 'package:get/get.dart';
import 'package:getxstatemixin/userP.dart';

class MyC extends GetxController with StateMixin<Map<String,dynamic>>{
  void getData(){
    try{
      UserProvider().getUser().then((response){
          if(response.statusCode == 200){
            final data = response.body["data"] as Map<String,dynamic>;
            change(
                data,
                status: RxStatus.success()
            );
          }
        },
        onError: (_){
          change(null,status: RxStatus.error("Tidak dapat data dari API "));
        }
      );
    }catch(e){
      change(null,status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    change(null,status: RxStatus.empty());
    super.onInit();
  }
}