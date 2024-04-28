import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroWidgetButton extends StatelessWidget {
  const BaroWidgetButton({
    super.key, 
    required this.buttonName,
    required this.onPressed, 
  });
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
          Color(0xFFE82027),
          ),
        ),
        child: Text(buttonName, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)))),
      ),
    );
  }
}