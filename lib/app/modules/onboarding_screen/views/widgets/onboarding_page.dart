import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            image: AssetImage(image)
          ),
          Text(title, style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Color(0xFF3D3D3D)),), textAlign: TextAlign.center,),
          const SizedBox(height: 16,),
          Text(subtitle, style: GoogleFonts.plusJakartaSans(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0)),), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}