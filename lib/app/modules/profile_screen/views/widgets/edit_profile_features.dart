import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileFeatures extends StatelessWidget {
  const EditProfileFeatures({
    super.key, required this.text, required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(31, 142, 142, 142)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 12,),
                Text(text, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
              ],
            ),
            const Icon(FluentIcons.ios_arrow_rtl_24_regular, color: Colors.black)
          ],
        ),
      ),
    );
  }
}