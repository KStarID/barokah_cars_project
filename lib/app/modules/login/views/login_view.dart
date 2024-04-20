import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 16, top: 36, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Image(image: AssetImage("assets/logos/barocars_logo.png")),
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            'Selamat Datang!',
            style: GoogleFonts.plusJakartaSans(
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Silahkan masuk untuk memulai.',
            style: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(fontSize: 14)),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: TextEditingController(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username tidak boleh kosong.';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16, color: const Color(0xFFB0B0B0)),
                fillColor: const Color(0xFFF6F6F6),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE82027)))),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: TextEditingController(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong.';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 16, color: const Color(0xFFB0B0B0)),
                fillColor: const Color(0xFFF6F6F6),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE82027))),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.eye_off_20_regular))),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: Color.fromARGB(0, 8, 130, 186)),
              child: Center(
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
