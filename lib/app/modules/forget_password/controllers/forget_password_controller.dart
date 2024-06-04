import 'package:barokah_cars_project/app/modules/forget_password/views/waiting_to_reset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  
  // -- Variables
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if(email.isNotEmpty && GetUtils.isEmail(email)){
      try{
        await auth.sendPasswordResetEmail(email: email);
        Get.to(const WaitingToReset());
      }catch(e){
        Get.snackbar('Terjadi Kesalahan', 'Tidak dapat mengirimkan tautan reset password',
          backgroundColor: Color(0xFFE92027), colorText: const Color(0xFFFFFFFF)
        );
      }
    } else {
      Get.snackbar('Terjadi Kesalahan', 'Email yang anda masukkan tidak valid',
          backgroundColor: Color(0xFFE92027), colorText: const Color(0xFFFFFFFF)
        );
    }
  } 

  void clearForm(){
    emailController.clear();
  }
}
