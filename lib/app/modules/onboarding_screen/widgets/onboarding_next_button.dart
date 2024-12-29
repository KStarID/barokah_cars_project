import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../onboarding_screen_controller.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: kBottomNavigationBarHeight,
      child: ElevatedButton(
        onPressed: () => OnboardingScreenController.instance.nextPage(), 
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFE82027)),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
        child: Center(
          child: Text("Selanjutnya", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),),
        )
      )
    );
  }
}