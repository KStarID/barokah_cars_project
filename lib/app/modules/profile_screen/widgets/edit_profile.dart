import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../profile_screen_controller.dart';

class BaroEditProfile extends StatelessWidget {
  const BaroEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(ProfileScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE92027),
        elevation: 0,
        title: Text(
          "Edit Profil",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto profil
            Container(
              width: double.infinity,
              color: const Color(0xFFE92027),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Profile Image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() => CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    image: editProfileController
                                            .profileImageUrl.value.isNotEmpty
                                        ? DecorationImage(
                                            image: NetworkImage(
                                                editProfileController
                                                    .profileImageUrl.value),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: editProfileController
                                          .profileImageUrl.value.isEmpty
                                      ? const Icon(
                                          FluentIcons.person_32_regular,
                                          size: 45,
                                          color: Colors.grey,
                                        )
                                      : null,
                                ),
                              ),
                            )),
                      ),
                      // Camera Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => editProfileController.pickImage(),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              FluentIcons.camera_20_regular,
                              color: Color(0xFFE92027),
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Form Section dengan background putih dan rounded corner
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle("Informasi Pribadi"),
                          const SizedBox(height: 20),
                          // Nama Field
                          _buildEditField(
                            title: "Nama Lengkap",
                            icon: FluentIcons.person_20_regular,
                            value: editProfileController.name,
                            onTap: () =>
                                _showEditNameDialog(editProfileController),
                          ),
                          const SizedBox(height: 16),
                          // Email Field (Read Only)
                          _buildEditField(
                            title: "Email",
                            icon: FluentIcons.mail_20_regular,
                            value: editProfileController.email,
                            isEditable: false,
                          ),
                          const SizedBox(height: 40),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFE92027),
                                      ),
                                    ),
                                  ),
                                  barrierDismissible: false,
                                );

                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Get.offAllNamed(Routes.LOGIN);
                                Get.snackbar(
                                  "Berhasil",
                                  "Profil berhasil diperbarui",
                                  backgroundColor: const Color(0xFFE92027),
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  margin: const EdgeInsets.all(20),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE92027),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Simpan Perubahan",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF232323),
      ),
    );
  }

  Widget _buildEditField({
    required String title,
    required IconData icon,
    required RxString value,
    bool isEditable = true,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEditable ? onTap : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, color: const Color(0xFF80869A)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          color: const Color(0xFF80869A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Obx(() => Text(
                            value.value.isEmpty ? "Belum diisi" : value.value,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: value.value.isEmpty
                                  ? Colors.grey
                                  : const Color(0xFF232323),
                            ),
                          )),
                    ],
                  ),
                ),
                if (isEditable)
                  const Icon(
                    FluentIcons.chevron_right_20_regular,
                    color: Color(0xFF80869A),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditNameDialog(ProfileScreenController controller) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          "Ubah Nama",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          controller: TextEditingController(text: controller.name.value),
          decoration: InputDecoration(
            labelText: "Nama Lengkap",
            hintText: "Masukkan nama lengkap Anda",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) => controller.name.value = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Batal",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.grey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateName(controller.name.value);
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE92027),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Simpan",
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
