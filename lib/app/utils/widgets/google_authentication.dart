import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/image_strings.dart';
import '../constants/text_strings.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({
    super.key,
  });

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
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(BaroImages.google), height: 20,),
              const SizedBox(width: 16,),
              Text(BaroTexts.continueWithGoogle, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D))),)
            ],
          ),
          ),
    );
  }
}