import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/text_strings.dart';
import '../../forget_password/forget_password_view.dart';

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