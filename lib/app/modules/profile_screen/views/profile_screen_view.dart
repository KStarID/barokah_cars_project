import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/edit_profile.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/profile_feature.dart';
import 'package:barokah_cars_project/app/routes/app_pages.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE92027),
        title: Text("Profile Saya", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),),
        // -- Back Button
        //leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(FluentIcons.arrow_left_20_regular, color: Colors.white,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                color: const Color(0xFFE92027),
              ),
              Positioned(
                top: 85 - 52,
                child: Container(
                  width: 390,
                  height: 78,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        offset: const Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage: const AssetImage(BaroImages.kemalas),
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Kemalaz Hakim Ramadhan", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF232323))),),
                          Text("mkemalashakim@gmail.com", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF80869A))),),
                        ],
                      )
                    ],
                  ),
                )
              ),
            ]
          ),
          const SizedBox(height: 70,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // -- First Fiturs
                BaroProfileFeature(fiturIcon: FluentIcons.text_bullet_list_square_edit_20_regular, fiturName: "Informasi Pribadi", onTap: () => Get.to(() => const BaroEditProfile()),),
                const SizedBox(height: 40,),

                // -- Second Fiturs
                BaroProfileFeature(fiturIcon: FluentIcons.history_20_regular, fiturName: "Riwayat Pembelian", onTap: () {},),
                const SizedBox(height: 40,),

                // -- Third Fiturs
                BaroProfileFeature(fiturIcon: FluentIcons.calendar_empty_20_regular, fiturName: "Menambah dan Menghapus Produk", onTap: () {},),
                const SizedBox(height: 40,),

                // -- Fourth Fiturs
                BaroProfileFeature(fiturIcon: FluentIcons.location_20_regular, fiturName: "Lokasi Saya", onTap: () {},),
                const SizedBox(height: 40,),

                // -- Fifth Fiturs
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.LOGIN),
                  child: Row(
                    children: [
                      const Icon(FluentIcons.sign_out_20_regular),
                      const SizedBox(width: 8,),
                      Text("Keluar", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF232323))),),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),

              ],
            ),
          )
        ],
      ),
    );
  }
}