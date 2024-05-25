import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final SearchController = SearchScreenController();
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        offset: Offset(0, 1)
                      )
                    ]
                   ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(
                        FluentIcons.search_20_regular,
                        color: Colors.black45,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          onChanged: SearchController.filterCars,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // const SearchBar(
                //     leading: Icon(FluentIcons.search_20_regular),
                //     hintText: "Temukan mobil yang anda inginkan",
                //     backgroundColor: MaterialStatePropertyAll(Colors.white),
                // ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Riwayat Pencarian", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D))),),
                    Text("Hapus Semua", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFB0B0B0))),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Avanza", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                    const Icon(FluentIcons.dismiss_20_regular, color: Color(0xFFB0B0B0),),
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lexus CT", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))),),
                    const Icon(FluentIcons.dismiss_20_regular, color: Color(0xFFB0B0B0),),
                  ],
                ),
                const SizedBox(height: 20,),
                Text("Populer", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3D3D3D))),),
                const SizedBox(height: 12,),
                Container(
                  width: 72,
                  height: 28,
                  color: const Color(0xFFE92027),  // -- Belum Beres
                  child: Text("Avanza", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF3D3D3D))), textAlign: TextAlign.center,),
                )
              ],
            ),
          )
        ),
        ),
    );
  }
}
