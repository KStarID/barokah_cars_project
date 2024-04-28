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
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginController = LoginController();
    return Form(
      key: loginController.loginFormKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // -- Header
                Center(
                  child: Image.asset(BaroImages.appLogo),
                ),
                const SizedBox(height: 44.47,),
                Text(BaroTexts.loginTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D))),),
                const SizedBox(height: 4,),
                Text(BaroTexts.loginDesc, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                const SizedBox(height: 16,),

                // -- Username
                TextFormField(
                  controller: loginController.username,
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
                      borderSide: BorderSide(color: Color(0xFFE82027))
                    )
                  ),
                ),
                const SizedBox(height: 16,),

                // -- Password
                TextFormField(
                  controller: loginController.password,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => BaroValidator.passwordValidate(value),
                  obscureText: true,
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
                      onPressed: (){}, 
                      icon: const Icon(FluentIcons.eye_off_20_regular),
                      )
                  ),
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){}, 
                      child: Text('Lupa password?', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D)))),
                      )
                  ],
                ),

                // -- Login Button
                BaroWidgetButton(
                  buttonName: 'Masuk',
                  onPressed: () {
                    if(loginController.loginFormKey.currentState!.validate()){
                      GetStorage().write('username', loginController.username.text);
                      GetStorage().write('password', loginController.password.text);

                      Get.toNamed(Routes.HOME);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum memiliki akun?", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                    TextButton(onPressed: () => Get.toNamed(Routes.REGISTER), child: Text("Daftar disini", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFE82027))),))
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
      ),
    );
  }
}