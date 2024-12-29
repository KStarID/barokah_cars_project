import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/validators/validation.dart';
import '../../utils/widgets/widget_button.dart';
import 'forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F1F6),
        title: const Text(BaroTexts.forgetPasswordTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Lottie.asset(BaroImages.forgetPasswordAnimation),
            ),
            Form(
              key: forgetPasswordFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) => BaroValidator.emailValidate(value),
                    decoration: InputDecoration(
                        labelText: BaroTexts.email,
                        labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0))),
                        fillColor: const Color(0xFFF6F6F6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE82027)))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BaroWidgetButton(
                    buttonName: BaroTexts.forgetPasswordButton,
                    onPressed: () async {
                      Get.dialog(
                        const Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFE92027),
                              ),
                              strokeWidth: 5,
                            ),
                          ),
                        ),
                        barrierDismissible: false,
                      );

                      await Future.delayed(const Duration(seconds: 2));

                      controller.resetPassword(controller.emailController.text);

                      Get.back();

                      controller.clearForm();
                    },
                    color: BaroColors.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
