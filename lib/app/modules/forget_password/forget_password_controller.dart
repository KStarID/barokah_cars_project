import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';
import 'waiting_to_reset.dart';

class ForgetPasswordController extends GetxController {
  // -- Variables
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if (email.isNotEmpty && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.to(const WaitingToReset());
      } catch (e) {
        Get.snackbar(BaroTexts.cannotSnackbarExceptionTitle,
            BaroTexts.cannotSendEmailSubtitle,
            backgroundColor: BaroColors.primaryColor,
            colorText: BaroColors.whiteColor);
      }
    } else {
      Get.snackbar(BaroTexts.cannotSnackbarExceptionTitle,
          BaroTexts.notValidEmailSubtitle,
          backgroundColor: const Color(0xFFE92027),
          colorText: BaroColors.whiteColor);
    }
  }

  void clearForm() {
    emailController.clear();
  }
}
