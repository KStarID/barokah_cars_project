import 'package:barokah_cars_project/app/routes/app_pages.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final registerController = RegisterController();
    return Form(
      key: registerController.registerFormKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Header
              Center(
                child: Image.asset(BaroImages.appLogo),
              ),
              const SizedBox(height: 44.47,),
              Text(BaroTexts.registerTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D)))),
              const SizedBox(height: 4,),
              Text(BaroTexts.registerDesc, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
              const SizedBox(height: 16,),

              // -- Nama Lengkap
              TextFormField(
                controller: registerController.fullname,
                validator: (value) => BaroValidator.fullnameValidate(value),
                decoration: InputDecoration(
                  labelText: BaroTexts.fullnameRegister,
                  labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
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
              const SizedBox(height: 16,),

              // -- Username
              TextFormField(
                controller: registerController.username,
                validator: (value) => BaroValidator.usernameValidate(value),
                decoration: InputDecoration(
                  labelText: BaroTexts.username,
                  labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
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
              const SizedBox(height: 16,),

              // -- Password
              Obx(
                () => TextFormField(
                  controller: registerController.password,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => BaroValidator.passwordValidate(value),
                  obscureText: registerController.hidePassword.value,
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
                      borderSide: BorderSide(color: Color(0xFFE82027)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => registerController.hidePassword.value = !registerController.hidePassword.value, 
                      icon: Icon(registerController.hidePassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular
                      )
                    ),
                  ),
                  style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14)),
                ),
              ),
              const SizedBox(height: 16,),

              // -- Confirm Password
              Obx(
                () => TextFormField(
                  controller: registerController.confirmPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => BaroValidator.confirmPasswordValidate(value, registerController.password.text),
                  obscureText: registerController.hideConfirmPassword.value,
                  decoration: InputDecoration(
                    labelText: BaroTexts.confirmPasswordRegister,
                    labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
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
                      onPressed: () => registerController.hideConfirmPassword.value = !registerController.hideConfirmPassword.value, 
                      icon: Icon(registerController.hideConfirmPassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular
                      )
                    ),
                  ),
                  style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16,),

              // -- Register Button
              BaroWidgetButton(
                buttonName: 'Daftar', 
                onPressed: (){
                  if (controller.registerFormKey.currentState!.validate()){
                    GetStorage().write('username', registerController.username.text);
                    GetStorage().write('password', registerController.password.text);

                    Get.toNamed(Routes.LOGIN);
                  }
                }
              ),
              // -- sudah punya akun ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah memiliki akun?", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                  TextButton(onPressed: () => Get.toNamed(Routes.LOGIN), child: Text("Masuk", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFE82027))),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(thickness: 2, endIndent: 20, color: Color(0xFFE7E7E7),)),
                  Text("Atau", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFD1D1D1))),),
                  const Expanded(child: Divider(thickness: 2, indent: 20, endIndent: 0, color: Color(0xFFE7E7E7),)),
                ],
              ),
              const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage("assets/logos/google.png"), height: 20,),
                        const SizedBox(width: 16,),
                        Text("Lanjutkan dengan Google", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D))),),
                      ],
                    )),
                )
            ],
          ),
          ),
        ),
      )
    );
  }
}
