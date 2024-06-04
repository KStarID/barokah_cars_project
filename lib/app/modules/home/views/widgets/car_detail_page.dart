import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDetailPage extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarDetailPage({
    super.key, 
    required this.car
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        title: Text('${car['merk'] ?? 'Unknown'} ${car['model'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12,),
            car['image'] != null
              ? Image.network(car['image'], width: double.infinity, height: 200, fit: BoxFit.cover)
              : const CircleAvatar(child: Icon(Icons.car_rental)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Warna', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 76,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['warna'] ?? 'Unknown'}', maxLines: 2, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Tahun', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 80,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['tahun_pembuatan'] ?? 'Unknown'}', maxLines: 2, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Kondisi', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 65,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['kondisi'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Bahan Bakar', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 20,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['bahan_bakar'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Harga', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 77,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['harga'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Kontak', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 66,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Text('${car['kontak_penjual'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
              ],
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deskripsi', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 46,),
                Text(':', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,))),
                const SizedBox(width: 24,),
                Expanded(child: Text('${car['deskripsi'] ?? 'Unknown'}', style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black,)))),
              ],
            ),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}