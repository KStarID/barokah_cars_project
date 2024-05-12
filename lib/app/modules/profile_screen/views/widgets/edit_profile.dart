import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroEditProfile extends StatelessWidget {
  const BaroEditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F1F6),
        title: Text("Informasi Pribadi", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF232323))),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16,),
          Center(
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey.shade800,
              backgroundImage: const AssetImage(BaroImages.kemalas),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // -- Name

              Container(
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
                          const Icon(FluentIcons.person_20_regular, color: Colors.black),
                          const SizedBox(width: 12,),
                          Text("Kemalaz Hakim Ramadhan", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
                        ],
                      ),
                      const Icon(FluentIcons.ios_arrow_rtl_24_regular, color: Colors.black)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              // -- Email

              Container(
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
                          const Icon(FluentIcons.mail_20_regular, color: Colors.black),
                          const SizedBox(width: 12,),
                          Text("mkemalashakim@gmail.com", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
                        ],
                      ),
                      const Icon(FluentIcons.ios_arrow_rtl_24_regular, color: Colors.black)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              // -- Phone number

              Container(
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
                          const Icon(FluentIcons.phone_20_regular, color: Colors.black,),
                          const SizedBox(width: 12,),
                          Text("082839431768", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
                        ],
                      ),
                      const Icon(FluentIcons.ios_arrow_rtl_24_regular, color: Colors.black)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              // -- Phone number

              Container(
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
                          const Icon(FluentIcons.phone_20_regular, color: Colors.black,),
                          const SizedBox(width: 12,),
                          Text("Jakarta Selatan, Jawa Barat", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
                        ],
                      ),
                      const Icon(FluentIcons.chevron_down_20_regular, color: Colors.black)
                    ],
                  ),
                ),
              ),
            ],
          ),
          )
        ],
      )
    );
  }
}