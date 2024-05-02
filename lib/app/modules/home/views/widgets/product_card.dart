import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCustomCard extends StatelessWidget {
  const ProductCustomCard({
    super.key, 
    required this.image, 
    required this.brand, 
    required this.stock,
  });

  final String image;
  final String brand;
  final String stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFE82027),),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(brand, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black)),),
                Text(stock, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFB0B0B0))),),
              ],
            )
          ],
        ),
      ),
    );
  }
}