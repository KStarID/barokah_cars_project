import 'package:flutter/material.dart';

class BaroLoginWith extends StatelessWidget {
  const BaroLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(thickness: 2, endIndent: 20, color: Color(0xFFE7E7E7),)),
        // Text(BaroTexts.or, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFFD1D1D1))),),
        const Expanded(child: Divider(thickness: 2, indent: 20, endIndent: 0, color: Color(0xFFE7E7E7),)),
      ],
    );
  }
}