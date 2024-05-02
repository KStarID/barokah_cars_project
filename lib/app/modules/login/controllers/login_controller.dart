import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  
  // -- Variables
  final username = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final loginFormKey = GlobalKey<FormState>();

  void clearForm(){
    username.clear();
    password.clear();
  }
}
