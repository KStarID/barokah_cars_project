import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroLoginButton extends StatelessWidget {
  const BaroLoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: (){},
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(const Color(0xFFE82027)),
          ),
          child: Text(
            BaroTexts.login, 
            style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
              )
            ),
          )
        ),
    );
  }
}