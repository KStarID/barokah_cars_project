import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroProfileFeatures extends StatelessWidget {
  const BaroProfileFeatures({
    super.key, 
    required this.fiturIcon, 
    required this.fiturName, required this.onTap,
  });

  final IconData fiturIcon;
  final String fiturName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(fiturIcon),
              const SizedBox(width: 8,),
              Text(fiturName, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF232323))),),
            ],
          ),
          const Icon(FluentIcons.ios_arrow_rtl_24_filled)
        ],
      ),
    );
  }
}