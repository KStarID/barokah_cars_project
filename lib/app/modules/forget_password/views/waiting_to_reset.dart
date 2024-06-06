import 'package:barokah_cars_project/app/modules/forget_password/controllers/forget_password_controller.dart';
import 'package:barokah_cars_project/app/modules/login/views/login_view.dart';
import 'package:barokah_cars_project/utils/constants/colors.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WaitingToReset extends StatelessWidget {
  const WaitingToReset({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(BaroImages.waitingResetPassword),
                Text(controller.emailController.text),
                const SizedBox(height: 5,),
                Text("Tautan Reset Password telah dikirim", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black)),),
                const SizedBox(height: 5,),
                Text("Keamanan akun Anda adalah prioritas kami! Kami telah mengirimi Anda tautan reset password untuk mengubah kata sandi Anda dengan aman dan menjaga akun Anda tetap terlindungi.", 
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black)),
                ),
                const SizedBox(height: 32,),
                Container(
                  height: 52,
                  width: double.infinity,
                  child: BaroWidgetButton(
                    buttonName: "Kembali", 
                    onPressed: (() => Get.to(() => LoginView())), 
                    color: BaroColors.primaryColor,
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}