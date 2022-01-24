import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter()async{
    // final result = await firestore.collection('users').where('mobil', whereIn: [["hino","yaris"], ["yaris","hino"], ["hino"]]).get();
    // final result = await firestore.collection('users').orderBy('umur').orderBy('nama').limitToLast(2).get();
    // final result = await firestore.collection('users').where('umur', isGreaterThan: 20).orderBy('umur').get();
    final result = await firestore.collection('users').orderBy('nama').startAt(["zoro"]).get();

    if(result.docs.length > 0){
      print("Total data yang di filter ada : ${result.docs.length}");

      result.docs.forEach((element) {
        var id = element.id;
        var data = element.data();

        print("ID : ${id}");
        print("data : ${data}");
        print("Nama : ${data["nama"]}");
        print("umur : ${data["umur"]}");
        print("mobil-0 : ${data["mobil"][0]}");
        data["mobil"].forEach((mobil) {
          print(mobil);
        });
      });
    }else{
      print("Tidak ada data");
    }
  }
}
