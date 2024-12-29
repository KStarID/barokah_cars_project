import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';

class BaroHeader extends StatelessWidget {
  const BaroHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(BaroImages.appLogo),
        ),
        const SizedBox(height: 44.47,),
        Text(BaroTexts.loginTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D))),),
        const SizedBox(height: 4,),
        Text(BaroTexts.loginDesc, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
        const SizedBox(height: 16,),
      ],
    );
  }
}