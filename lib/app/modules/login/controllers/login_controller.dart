import 'package:barokah_cars_project/app/modules/home/views/home_view.dart';
import 'package:barokah_cars_project/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  
  // -- Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;

  // final CollectionReference _userCollection =
  //     FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<bool> checkCredentials(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     QuerySnapshot querySnapshot =
  //         await _userCollection.where('email', isEqualTo: email).get();
  //     return querySnapshot.docs.isNotEmpty;
  //   } catch (e) {
  //     return false;
  //   }
  // }
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
          backgroundColor: Color(0xFFE92027), colorText: const Color(0xffffffff));
      return;
    }

    bool isValidCredentials = await checkCredentials(email, password);

    if (isValidCredentials) {
      Get.snackbar('Success', 'Anda berhasil melakukan login',
          backgroundColor: const Color(0xFFE92027), colorText: const Color(0xffffffff));

      Get.off(
        () => const NavigationBarView(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 500),
      );

      clearForm();
    } else {
      Get.snackbar('Error', 'Email atau Password salah',
          backgroundColor: Color(0xFFE92027), colorText: const Color(0xffffffff));
    }
  }

  void clearForm(){
    emailController.clear();
    passwordController.clear();
  }
  
}
