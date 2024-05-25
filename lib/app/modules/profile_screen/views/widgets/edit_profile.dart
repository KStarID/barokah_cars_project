import 'package:barokah_cars_project/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/widgets/edit_profile_features.dart';
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
    final editProfileController = Get.put(ProfileScreenController());

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
                child: const Icon(
                  FluentIcons.person_20_regular,
                color: Colors.white,
                ),
              ),
              Positioned(
                top: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 2),
                      ),
                    ],
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: const Icon(FluentIcons.camera_switch_20_regular),
                    iconSize: 25,
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

              Obx(() => EditProfileFeatures(text: editProfileController.name.value, icon: FluentIcons.person_20_regular, continueIcon: FluentIcons.ios_arrow_rtl_24_regular,)),
              const SizedBox(height: 20,),

              // -- Email

              Obx(() => EditProfileFeatures(text: editProfileController.email.value, icon: FluentIcons.mail_20_regular, continueIcon: FluentIcons.ios_arrow_rtl_24_regular,)),
              const SizedBox(height: 20,),

            // Update Data

              // -- Phone number

              const EditProfileFeatures(text: "+62-822-4869-6800", icon: FluentIcons.phone_20_regular),
              
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextFormField(
              //         controller: editProfileController.phoneNumberController,
              //         focusNode: _phoneNumberFocusNode,
              //         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
              //         decoration: InputDecoration(
              //           hintText: 'Masukkan Nomor Telepon',
              //           border: InputBorder.none,
              //           // Atur warna border
              //           enabledBorder: const UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.transparent),
              //           ),
              //           // Atur warna border saat fokus
              //           focusedBorder: const UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.transparent),
              //           ),
              //           // Atur warna background
              //           filled: true,
              //           fillColor: const Color.fromARGB(31, 142, 142, 142),

              //           prefixIcon: const Icon(FluentIcons.phone_20_regular),

              //           suffixIcon: 
              //           IconButton(
              //             onPressed: (){
              //               _phoneNumberFocusNode.requestFocus();
              //             },
              //             icon: const Icon(FluentIcons.edit_20_regular, color: Colors.black),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20,),

              // -- Location

              // LocationDropdown(),

              const EditProfileFeatures(text: "Jakarta Selatan, Jawa Barat", icon: FluentIcons.location_20_regular, continueIcon: FluentIcons.chevron_down_20_regular,),
              const SizedBox(height: 40,),

              // -- Save Changes Button
              BaroWidgetButton(
                buttonName: "Simpan", 
                onPressed: () async {
                  editProfileController.saveUserData();
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
                    Get.snackbar("Informasi Pribadi Diperbarui", "Perubahan pada informasi anda telah berhasil disimpan.", backgroundColor: const Color(0xFFE92027), snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
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

