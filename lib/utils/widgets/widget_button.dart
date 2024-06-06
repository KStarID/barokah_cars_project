import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroWidgetButton extends StatelessWidget {
  const BaroWidgetButton({
    super.key, 
    required this.buttonName,
    required this.onPressed, 
    required this.color, 
  });
  final String buttonName;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
          color,
          ),
        ),
        child: Text(buttonName, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white))),
      ),
    );
  }
}