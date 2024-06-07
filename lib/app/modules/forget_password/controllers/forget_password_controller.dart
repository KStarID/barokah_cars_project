import 'package:barokah_cars_project/app/modules/forget_password/views/waiting_to_reset.dart';
import 'package:barokah_cars_project/utils/constants/colors.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
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
        Get.snackbar(BaroTexts.cannotSnackbarExceptionTitle, BaroTexts.cannotSendEmailSubtitle,
          backgroundColor: BaroColors.primaryColor, colorText: BaroColors.whiteColor
        );
      }
    } else {
      Get.snackbar(BaroTexts.cannotSnackbarExceptionTitle, BaroTexts.notValidEmailSubtitle,
          backgroundColor: const Color(0xFFE92027), colorText: BaroColors.whiteColor
        );
    }
  } 

  void clearForm(){
    emailController.clear();
  }
}
