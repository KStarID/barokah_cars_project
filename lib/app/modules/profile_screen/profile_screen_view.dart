import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login_view.dart';
import 'profile_screen_controller.dart';
import 'widgets/edit_profile.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileScreenController profileController =
        Get.put(ProfileScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFE92027),
        elevation: 0,
        title: Text(
          "Profile Saya",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              color: const Color(0xFFE92027),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Profile Image
                  GestureDetector(
                    onTap: () => profileController.pickImage(),
                    child: Stack(
                      children: [
                        Obx(() => CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: profileController
                                      .profileImageUrl.isNotEmpty
                                  ? NetworkImage(
                                      profileController.profileImageUrl.value)
                                  : null,
                              child: profileController.profileImageUrl.isEmpty
                                  ? const Icon(
                                      FluentIcons.person_32_regular,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  : null,
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: const Icon(
                              FluentIcons.camera_20_regular,
                              size: 20,
                              color: Color(0xFFE92027),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Profile Info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Obx(() => Text(
                              profileController.name.value.isEmpty
                                  ? "Tambahkan Nama"
                                  : profileController.name.value,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF232323),
                              ),
                            )),
                        const SizedBox(height: 8),
                        Obx(() => Text(
                              profileController.email.value,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                color: const Color(0xFF80869A),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Menu Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Edit Profile Button
                    _buildMenuButton(
                      icon: FluentIcons.person_edit_20_regular,
                      title: "Edit Profil",
                      onTap: () => Get.to(() => const BaroEditProfile()),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    // Logout Button
                    _buildMenuButton(
                      icon: FluentIcons.sign_out_20_regular,
                      title: "Keluar",
                      isLogout: true,
                      onTap: () => _showLogoutDialog(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    bool isLogout = false,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isLogout ? const Color(0xFFE92027) : Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isLogout
                    ? const Color(0xFFE92027)
                    : const Color(0xFF232323),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isLogout
                      ? const Color(0xFFE92027)
                      : const Color(0xFF232323),
                ),
              ),
              const Spacer(),
              if (!isLogout)
                const Icon(
                  FluentIcons.chevron_right_20_regular,
                  color: Color(0xFF80869A),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Konfirmasi Keluar',
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar?',
          style: GoogleFonts.plusJakartaSans(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Batal',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.grey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              Get.dialog(
                const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFE92027)),
                  ),
                ),
                barrierDismissible: false,
              );
              await Future.delayed(const Duration(seconds: 2));
              await FirebaseAuth.instance.signOut();
              Get.offAll(
                () => LoginView(),
                transition: Transition.fadeIn,
                duration: const Duration(seconds: 1),
              );
              Get.snackbar(
                "Logout Berhasil",
                "Terima kasih telah menggunakan BaroCars.",
                backgroundColor: const Color(0xFFE92027),
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE92027),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Keluar',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
