import 'package:barokah_cars_project/app/modules/login/views/widgets/dont_have_account.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/forget_password.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/login_header.dart';
import 'package:barokah_cars_project/app/modules/login/views/widgets/login_with.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});


  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Form(
      key: loginFormKey,
      child: Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // -- Header
                const BaroHeader(),
                

                // -- Email
                TextFormField(
                  controller: loginController.emailController,
                  validator: (value) => BaroValidator.emailValidate(value),
                  decoration: InputDecoration(
                    labelText: BaroTexts.email,
                    labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                    fillColor: const Color(0xFFF6F6F6),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE82027))
                    )
                  ),
                ),
                const SizedBox(height: 16,),

                // -- Password
                Obx(
                  () => TextFormField(
                    controller: loginController.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => BaroValidator.passwordValidate(value),
                    obscureText: loginController.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: BaroTexts.password,
                      labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
                      fillColor: const Color(0xFFF6F6F6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE82027))
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => loginController.hidePassword.value = !loginController.hidePassword.value,
                        icon: Icon(loginController.hidePassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular),
                        )
                    ),
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      )
                    ),
                  ),
                ),

                // -- Forget Password
                const BaroLupaPassword(),

                // -- Login Button
                BaroWidgetButton(
                  buttonName: BaroTexts.login,
                  onPressed: () async {
                    Get.dialog(
                        const Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE92027),),
                              strokeWidth: 5,
                            ),
                          ),
                        ),
                        barrierDismissible: false,
                      );

                      await Future.delayed(const Duration(seconds: 3));

                      loginController.loginValidation();

                      Get.back();
                  },
                ),

                // -- Belum memiliki Akun
                const BaroDontHaveAccount(),

                // -- Atau login dengan
                const BaroLoginWith(),
                const SizedBox(height: 20,),

                // -- Continue with Google
                //const BaroContinueWithGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}