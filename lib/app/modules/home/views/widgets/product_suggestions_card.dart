import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCustomCard extends StatelessWidget {
  const ProductCustomCard({
    super.key, 
    required this.image, 
    required this.name, 
    required this.price,
  });

  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFE82027),),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image(image: AssetImage(image))),
            const SizedBox(height: 16,),
            Text(name, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black)),),
            Text(price, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFE82027))),)
          ],
        ),
      ),
    );
  }
}