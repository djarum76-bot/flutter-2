import 'package:bane/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final box = GetStorage();

  Stream<User?> authStatus(){
    return auth.authStateChanges();
  }

  void register(String username, String email, String password)async{
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      CollectionReference users = firestore.collection('users');

      String dateNow = DateTime.now().toIso8601String();

      await myUser.user!.sendEmailVerification();

      await users.doc(myUser.user!.uid).set({
        "username": username,
        "email": email,
        "image": "",
        "created_at": dateNow
      });

      box.write('uid', '${myUser.user!.uid}');

      Get.defaultDialog(
          title: "Verification Email",
          middleText: "Kami telah mengirimkan email verifikasi ke $email",
          onConfirm: (){
            Get.back();
            Get.back();
          },
          textConfirm: "OKEEE"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: "WARNING",
            middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
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
        Get.offAllNamed(Routes.NAVBAR);
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

  void logout()async{
    final isSignIn = await GoogleSignIn().isSignedIn();

    if(isSignIn){
      await GoogleSignIn().signOut();
      await auth.signOut();
    }else{
      await auth.signOut();
    }
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email)async{
    if(email != "" && GetUtils.isEmail(email)){
      Get.defaultDialog(
          title: "Reset Password",
          middleText: "Apakah anda yakin reset password ?",
          textConfirm: "Iya",
          textCancel: "Tidak",
          onConfirm: ()async{
            await auth.sendPasswordResetEmail(email: email);
            Get.back();
          }
      );
    }
  }
  
  Future<void> loginGoogle()async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential myUser = await auth.signInWithCredential(credential);

    CollectionReference users = firestore.collection('users');

    String dateNow = DateTime.now().toIso8601String();

    await users.doc(myUser.user!.uid).set({
      "username": googleUser!.displayName,
      "image": "",
      "created_at": dateNow
    });

    box.write('uid', '${myUser.user!.uid}');

    Get.offAllNamed(Routes.NAVBAR);
  }
}
