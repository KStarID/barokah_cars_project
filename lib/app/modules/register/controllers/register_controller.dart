import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  // -- Variables
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final registerFormKey = GlobalKey<FormState>();

  void clearForm(){
    name.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }
}
