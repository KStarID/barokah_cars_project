// Menyimpan seluruh teks yang dibutuhkan

import 'package:barokah_cars_project/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class BaroTexts {
  final controller = Get.put(LoginController());

  // -- Authentication Heading
  static const String loginTitle = 'Selamat Datang!';
  static const String loginDesc = 'Silahkan masuk untuk memulai.';

  // -- Authentication Form
  static const String usernameLogin = 'Username';
  static const String passwordLogin = 'Password';
  static const String forgetPassword = 'Lupa password?';
  static const String login = 'Masuk';
  static const String or = 'Atau';
  static const String dontHaveAccount = 'Belum memiliki akun?';
  static const String registerHere = 'Daftar disini';
  static const String continueWithGoogle = 'Lanjutkan dengan Google';
}