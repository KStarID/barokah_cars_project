import 'package:barokah_cars_project/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/edit_profile_features.dart';
import 'package:barokah_cars_project/utils/constants/image_strings.dart';
import 'package:barokah_cars_project/utils/widgets/widget_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey.shade800,
                backgroundImage: const AssetImage(BaroImages.kemalas),
              ),
              Positioned(
                top: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(1, 2),
                      )
                    ],
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(FluentIcons.camera_switch_20_regular),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // -- Name

              const EditProfileFeatures(text: "Kemalaz Hakim Ramadhan", icon: FluentIcons.person_20_regular,),
              const SizedBox(height: 20,),

              // -- Email

              const EditProfileFeatures(text: "mkemalashakim@gmail.com", icon: FluentIcons.mail_20_regular),
              const SizedBox(height: 20,),

              // -- Phone number

              const EditProfileFeatures(text: "082839431768", icon: FluentIcons.phone_20_regular),
              const SizedBox(height: 20,),

              // -- Phone number

              const EditProfileFeatures(text: "Jakarta Selatan, Jawa Barat", icon: FluentIcons.phone_20_regular),
              const SizedBox(height: 40,),

              // -- Save Changes Button
              BaroWidgetButton(
                buttonName: "Simpan", 
                onPressed: () async {
                    Get.dialog(
                        const Center(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE92027),),
                              strokeWidth: 5,
                            ),
                          ),
                        ),
                        barrierDismissible: false,
                      );

                      await Future.delayed(const Duration(seconds: 2));
                      Get.to(
                        () => const NavigationBarView(),
                        transition: Transition.fadeIn,
                        duration: const Duration(seconds: 1),
                      );
                    Get.snackbar("Informasi Pribadi Diperbarui", "Perubahan pada informasi anda telah berhasil disimpan.", backgroundColor: const Color(0xFFE92027), colorText: Colors.white);
                  }, 
              ),
            ],
          ),
          )
        ],
      )
    );
  }
}

