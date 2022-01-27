import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecommerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> authStatus(){
    return auth.authStateChanges();
  }

  void signup(String email, String password, String username, String address)async{
    try{
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      CollectionReference users = firestore.collection('users');

      String dateNow = DateTime.now().toIso8601String();

      await myUser.user!.sendEmailVerification();

      await users.doc(myUser.user!.uid).set({
        "Username": username,
        "UserID": myUser.user!.uid,
        "UserEmail": email,
        "UserAddres": address,
      });

      Get.defaultDialog(
          title: "Verification Email",
          middleText: "Kami telah mengirimkan email verifikasi ke $email",
          onConfirm: (){
            Get.back();
            Get.back();
          },
          textConfirm: "OKEEE"
      );
    }on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: "Error",
            middleText: 'The account already exists for that email.'
        );
      }
    }catch(e){
      print(e);
    }
  }

  void login(String email, String password)async{
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if(myUser.user!.emailVerified){
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.defaultDialog(
            title: "Verification Email",
            middleText: "Verikasi email terlebih dahulu. Apakah kamu ingin verifikasi kembali ?",
            textConfirm: "Iya",
            textCancel: "Tidak",
            onConfirm: ()async{
              await myUser.user!.sendEmailVerification();
              Get.back();
            }
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Error",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "Error",
          middleText: "Wrong password provided for that user.",
        );
      }
    }
  }

  void signout()async{
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
