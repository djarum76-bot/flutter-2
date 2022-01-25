import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:convert' show utf8;
import 'dart:typed_data' show Uint8List;

class HomeStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;

  void uploadFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file);

      String filename = DateTime.now().toIso8601String();
      String ext = result.files.first.extension!;
      try {
        await FirebaseStorage.instance
            .ref('${filename}.${ext}')
            .putFile(file);
      } on FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
        print(e);
      }
    } else {
      print("gagal");
      // User canceled the picker
    }
  }

  void uploadMultiFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      result.files.forEach((element)async{
        String filename = element.name;
        String ext = element.extension!;
        File file = File(element.path!);

        await FirebaseStorage.instance
            .ref('${filename}')
            .putFile(file);
      });
    } else {
      print("gagal");
      // User canceled the picker
    }
  }

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
