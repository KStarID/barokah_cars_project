import 'package:barokah_cars_project/app/routes/app_pages.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFE92027))),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          const Padding(padding: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FluentIcons.settings_20_regular, color: Color(0xFFE92027),),
              Icon(FluentIcons.shopping_bag_20_regular, color: Color(0xFFE92027),),
            ],
          ),
          )
          

        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 55,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(Color(0xFFE92027))
            ),
            onPressed: () => Get.offAllNamed(Routes.LOGIN), 
            child: Text("Logout", style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),)
            ),
        )
      ),
    );
  }
}
