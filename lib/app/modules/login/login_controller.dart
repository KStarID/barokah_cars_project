import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../navigation_bar/navigation_bar_view.dart';
import '../profile_screen/widgets/edit_profile.dart';

class LoginController extends GetxController {
  // -- Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> checkCredentials(String email, String password) async {
    try {
      // Mencoba untuk login dengan email dan password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Jika berhasil login, mengembalikan true
      return true;
    } catch (e) {
      // Jika terjadi kesalahan atau gagal login, mengembalikan false
      return false;
    }
  }

  Future<void> loginValidation() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email atau Password tidak boleh kosong',
          backgroundColor: Color(0xFFE92027),
          colorText: const Color(0xffffffff));
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Cek data user di Firestore
      DocumentSnapshot userDoc =
          await _userCollection.doc(userCredential.user!.uid).get();

      if (!userDoc.exists ||
          (userDoc.data() as Map<String, dynamic>)['name'] == null ||
          (userDoc.data() as Map<String, dynamic>)['name'].isEmpty) {
        // Jika user belum memiliki data lengkap, arahkan ke halaman edit profile
        Get.snackbar(
            'Perhatian', 'Silakan lengkapi data profil Anda terlebih dahulu',
            backgroundColor: const Color(0xFFE92027), colorText: Colors.white);

        Get.off(
          () => const BaroEditProfile(),
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 500),
        );
      } else {
        // Jika data lengkap, arahkan ke halaman utama
        Get.snackbar('Success', 'Anda berhasil melakukan login',
            backgroundColor: const Color(0xFFE92027), colorText: Colors.white);

        Get.off(
          () => const NavigationBarView(),
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 500),
        );
      }

      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Email atau Password salah',
          backgroundColor: Color(0xFFE92027), colorText: Colors.white);
    }
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }
}
