import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroFormHeader extends StatelessWidget {
  const BaroFormHeader({
    super.key, 
    required this.headerTitle, 
    required this.headerDesc,
  });

  final String headerTitle;
  final String headerDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Image(
            image: AssetImage(BaroImages.appLogo),
          ),
        ),
        const SizedBox(height: 44,),
        Text(headerTitle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),),
        const SizedBox(height: 4,),
        Text(headerDesc, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14)),),
      ],
    );
  }
}