import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroCreateAccountButton extends StatelessWidget {
  const BaroCreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(BaroTexts.dontHaveAccount, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(color: Color(0xFF3D3D3D), fontSize: 14, fontWeight: FontWeight.w500)),),
        TextButton(onPressed: (){}, child: Text(BaroTexts.registerHere, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(color: Color(0xFFE82027), fontWeight: FontWeight.w700, fontSize: 14)))),
      ],
    );
  }
}