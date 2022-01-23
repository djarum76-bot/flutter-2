import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasekuldii/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus(){
    return auth.authStateChanges();
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
          onConfirm: ()async{
            await myUser.user!.sendEmailVerification();
            Get.back();
          }
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logout()async{
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void signup(String email, String password)async{
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      await myUser.user!.sendEmailVerification();

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
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void resetPassword(String email)async{
    if(email != "" && GetUtils.isEmail(email)){
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
    }
  }
}
