import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WaitingToReset extends StatelessWidget {
  const WaitingToReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(BaroImages.waitingResetPassword),
            Text("Tautan Reset Password telah dikirim", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),),
          ],
        ),
      ),
    );
  }
}