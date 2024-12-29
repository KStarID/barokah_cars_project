import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/validators/validation.dart';
import '../../utils/widgets/widget_button.dart';
import '../login/login_view.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    return Form(
        key: registerFormKey,
        child: Scaffold(
          backgroundColor: const Color(0xFFF2F1F6),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Header
                  Center(
                    child: Image.asset(BaroImages.appLogo),
                  ),
                  const SizedBox(
                    height: 44.47,
                  ),
                  Text(BaroTexts.registerTitle,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3D3D3D)))),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    BaroTexts.registerDesc,
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3D3D3D))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // -- Name
                  TextFormField(
                    controller: registerController.name,
                    validator: (value) => BaroValidator.nameValidate(value),
                    decoration: InputDecoration(
                      labelText: BaroTexts.nameRegister,
                      labelStyle: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0B0B0))),
                      fillColor: const Color(0xFFF6F6F6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE82027)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // -- Email
                  TextFormField(
                    controller: registerController.email,
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
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE82027)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // -- Password
                  Obx(
                    () => TextFormField(
                      controller: registerController.password,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          BaroValidator.passwordValidate(value),
                      obscureText: registerController.hidePassword.value,
                      decoration: InputDecoration(
                        labelText: BaroTexts.password,
                        labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0))),
                        fillColor: const Color(0xFFF6F6F6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE82027)),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => registerController.hidePassword
                                .value = !registerController.hidePassword.value,
                            icon: Icon(registerController.hidePassword.value
                                ? FluentIcons.eye_off_20_regular
                                : FluentIcons.eye_20_regular)),
                      ),
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // -- Confirm Password
                  Obx(
                    () => TextFormField(
                      controller: registerController.confirmPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          BaroValidator.confirmPasswordValidate(
                              value, registerController.password.text),
                      obscureText: registerController.hideConfirmPassword.value,
                      decoration: InputDecoration(
                        labelText: BaroTexts.confirmPasswordRegister,
                        labelStyle: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB0B0B0))),
                        fillColor: const Color(0xFFF6F6F6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE82027)),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () => registerController
                                .hideConfirmPassword
                                .value = !controller.hideConfirmPassword.value,
                            icon: Icon(
                                registerController.hideConfirmPassword.value
                                    ? FluentIcons.eye_off_20_regular
                                    : FluentIcons.eye_20_regular)),
                      ),
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // -- Register Button
                  BaroWidgetButton(
                    buttonName: 'Daftar',
                    onPressed: () async {
                      String name = registerController.name.text;
                      String email = registerController.email.text;
                      String password = registerController.password.text;
                      String confirmPassword =
                          registerController.confirmPassword.text;

                      if (registerController.validateInputs(
                        name: name,
                        email: email,
                        password: password,
                      )) {
                        if (password != confirmPassword) {
                          Get.snackbar("Terjadi kesalahan!",
                              "Password dan Konfirmasi Password berbeda.",
                              backgroundColor: const Color(0xFFE92027),
                              colorText: Colors.white);
                        } else {
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
                          Get.off(
                            () => LoginView(),
                            transition: Transition.fadeIn,
                            duration: const Duration(seconds: 1),
                          );

                          Get.snackbar("Registrasi berhasil",
                              "Selamat! Anda berhasil melakukan Registrasi. Silahkan masuk dan temukan mobil impian anda.",
                              backgroundColor: const Color(0xFFE82027),
                              colorText: Colors.white,
                              duration: const Duration(seconds: 4));

                          await registerController.registerUser(
                            name,
                            email,
                            password,
                          );
                          registerController.clearForm();
                        }
                      }
                    },
                    color: BaroColors.primaryColor,
                  ),
                  // -- sudah punya akun ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah memiliki akun?",
                        style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF3D3D3D))),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Masuk",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFE82027))),
                          )),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        endIndent: 20,
                        color: Color(0xFFE7E7E7),
                      )),
                      //Text("Atau", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFD1D1D1))),),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 0,
                        color: Color(0xFFE7E7E7),
                      )),
                    ],
                  ),
                  // const SizedBox(height: 20,),
                  //   SizedBox(
                  //     width: double.infinity,
                  //     height: 52,
                  //     child: ElevatedButton(
                  //       onPressed: (){},
                  //       style: ButtonStyle(
                  //         shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10)
                  //           ),
                  //         ),
                  //         backgroundColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF))
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           const Image(image: AssetImage("assets/icons/google.png"), height: 20,),
                  //           const SizedBox(width: 16,),
                  //           Text("Lanjutkan dengan Google", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D))),),
                  //         ],
                  //       )),
                  //   )
                ],
              ),
            ),
          ),
        ));
  }
}
