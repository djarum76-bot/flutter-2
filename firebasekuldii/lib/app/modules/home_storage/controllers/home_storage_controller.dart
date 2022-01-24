import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:convert' show utf8;
import 'dart:typed_data' show Uint8List;

class HomeStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  String downloadUrl = "";

  Future<void> downloadURL() async{
    downloadUrl = await storage.ref('Logo_PENS.png').getDownloadURL();
  }

  void akses()async{
    String text = 'Hello World!';
    List<int> encoded = utf8.encode(text);
    Uint8List data = Uint8List.fromList(encoded);

    Reference ref = FirebaseStorage.instance.ref('uploads/hello-world.txt');

    try {
      // Upload raw data.
      await ref.putData(data);
      // Get raw data.
      Uint8List? downloadedData = await ref.getData();
      // prints -> Hello World!
      print(utf8.decode(downloadedData!));
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
