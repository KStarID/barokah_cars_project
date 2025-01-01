import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation_bar/navigation_bar_view.dart';
import '../profile_screen/widgets/edit_profile.dart';

class LoginController extends GetxController {
  // -- Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final SharedPreferences? prefs;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginController() : prefs = null {
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final savedEmail = sharedPrefs.getString('saved_email') ?? '';
    final savedPassword = sharedPrefs.getString('saved_password') ?? '';
    final isRemembered = sharedPrefs.getBool('remember_me') ?? false;

    if (isRemembered) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
      rememberMe.value = true;
    }
  }

  Future<void> saveCredentials() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (rememberMe.value) {
      await sharedPrefs.setString('saved_email', emailController.text);
      await sharedPrefs.setString('saved_password', passwordController.text);
      await sharedPrefs.setBool('remember_me', true);
    } else {
      await sharedPrefs.remove('saved_email');
      await sharedPrefs.remove('saved_password');
      await sharedPrefs.setBool('remember_me', false);
    }
  }

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

      // Simpan kredensial jika remember me dicentang
      await saveCredentials();

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

        Get.offAll(
          () => const BaroEditProfile(),
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 500),
        );
      } else {
        // Jika data lengkap, arahkan ke halaman utama
        Get.snackbar('Success', 'Anda berhasil melakukan login',
            backgroundColor: const Color(0xFFE92027), colorText: Colors.white);

        Get.offAll(
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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
