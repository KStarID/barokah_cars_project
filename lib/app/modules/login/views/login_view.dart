import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/widgets/google_authentication.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 36, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  image: AssetImage(BaroImages.appLogo),
                ),
              ),
              const SizedBox(height: 44,),
              Text(BaroTexts.loginTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),),
              const SizedBox(height: 4,),
              Text(BaroTexts.loginDesc, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14)),),
              const SizedBox(height: 16,),
              TextFormField(
                controller: TextEditingController(),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Username tidak boleh kosong.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: BaroTexts.usernameLogin,
                  labelStyle: GoogleFonts.plusJakartaSans(fontSize: 16, color: const Color(0xFFB0B0B0)),
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
              TextFormField(
                controller: TextEditingController(),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Password tidak boleh kosong.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: BaroTexts.passwordLogin,
                  labelStyle: GoogleFonts.plusJakartaSans(fontSize: 16, color: const Color(0xFFB0B0B0)),
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
                    icon: const Icon(FluentIcons.eye_off_20_regular))
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){}, 
                    child: Text(BaroTexts.forgetPassword, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D)))),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFE82027)),
                  ),
                  child: Text(
                    BaroTexts.login, 
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  )
                  ),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(BaroTexts.dontHaveAccount, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(color: Color(0xFF3D3D3D), fontSize: 14, fontWeight: FontWeight.w500)),),
                  TextButton(onPressed: (){}, child: Text(BaroTexts.registerHere, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(color: Color(0xFFE82027), fontWeight: FontWeight.w700, fontSize: 14)))),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(thickness: 2, endIndent: 20, color: Color(0xFFE7E7E7),)),
                  Text(BaroTexts.or, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, color: Color(0xFFD1D1D1), fontWeight: FontWeight.w600)),),
                  const Expanded(child: Divider(thickness: 2, indent: 20, endIndent: 0, color: Color(0xFFE7E7E7))),
                ],
              ),
              const SizedBox(height: 20,),
              const LogInWithGoogle(),
            ],
          )
        )
      )
    );
  }
}
