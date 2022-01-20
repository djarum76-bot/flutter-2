import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChatPageController extends GetxController {
  late IO.Socket socket;

  void connect(){
    socket = IO.io("http://192.168.100.175:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) => print("Connected"));
    socket.emit("/test","ini test ya bgst");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connect();
  }
}
