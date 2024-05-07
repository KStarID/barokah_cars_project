import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  
  // -- Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final loginFormKey = GlobalKey<FormState>();

  void clearForm(){
    email.clear();
    password.clear();
  }
}
