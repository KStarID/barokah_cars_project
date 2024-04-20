import 'package:barokah_cars_project/app/modules/login/controllers/login_controller.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroLoginForm extends StatelessWidget {
  const BaroLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [

        // -- Username
        TextFormField(
          controller: controller.username,
          validator: (value) => BaroValidator.usernameValidate(value),
          decoration: InputDecoration(
            labelText: BaroTexts.usernameLogin,
            labelStyle: GoogleFonts.plusJakartaSans(fontSize: 16, color: const Color(0xFFB0B0B0)),
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE82027))
            )
          ),
        ),
        const SizedBox(height: 16,),

        // -- Password
        TextFormField(
          controller: controller.password,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
          validator: (value) => BaroValidator.passwordValidate(value),
          decoration: InputDecoration(
            labelText: BaroTexts.passwordLogin,
            labelStyle: GoogleFonts.plusJakartaSans(fontSize: 16, color: const Color(0xFFB0B0B0)),
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE82027))
            ),
            suffixIcon: IconButton(
              onPressed: (){}, 
              icon: const Icon(FluentIcons.eye_off_20_regular)
            )
          ),
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14
          ),
        ),
      ],
    );
  }
}