import 'package:barokah_cars_project/app/modules/login/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  
  // -- Variables
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if(email.isNotEmpty && GetUtils.isEmail(email)){
      try{
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Link reset password telah dikirimkan ke email $email",
          onConfirm: (){
            Get.back();
            Get.back();
          },
          textConfirm: "Kembali"
        );
      }catch(e){
        Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat mengirimkan reset password $e"
      );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid"
      );
    }
  } 
}
