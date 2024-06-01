import 'package:barokah_cars_project/app/modules/forget_password/views/forget_password_view.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroLupaPassword extends StatelessWidget {
  const BaroLupaPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Get.to(() => ForgetPasswordView()), 
          child: Text(BaroTexts.forgetPasswordQuestion, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D)))),
          )
      ],
    );
  }
}