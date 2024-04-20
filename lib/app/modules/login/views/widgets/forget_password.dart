import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroForgetPassword extends StatelessWidget {
  const BaroForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: (){}, 
          child: Text(BaroTexts.forgetPassword, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D)))),
        ),
      ],
    );
  }
}