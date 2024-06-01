import 'package:barokah_cars_project/app/modules/register/controllers/register_controller.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:barokah_cars_project/utils/validators/validation.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BaroRegisterForm extends StatelessWidget {
  const BaroRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    return Column(
      children: [
        // -- Name
        TextFormField(
          controller: registerController.name,
          validator: (value) => BaroValidator.nameValidate(value),
          decoration: InputDecoration(
            labelText: BaroTexts.nameRegister,
            labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE82027))
            ),
          ),
        ),
        const SizedBox(height: 16,),

        // -- Email
        TextFormField(
          controller: registerController.email,
          validator: (value) => BaroValidator.emailValidate(value),
          decoration: InputDecoration(
            labelText: BaroTexts.email,
            labelStyle: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFB0B0B0))),
            fillColor: const Color(0xFFF6F6F6),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE82027))
            ),
          ),
        ),
        const SizedBox(height: 16,),

        // -- Password
        TextFormField(
          controller: registerController.password,
          obscureText: true,
          validator: (value) => BaroValidator.passwordValidate(value),
          decoration: InputDecoration(
            labelText: BaroTexts.password,
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
        const SizedBox(height: 16,),

        // -- Confirmation Password
        TextFormField(
          controller: registerController.confirmPassword,
          obscureText: true,
          validator: (value) => BaroValidator.confirmPasswordValidate(value, registerController.password.text),
          decoration: InputDecoration(
            labelText: BaroTexts.confirmPasswordRegister,
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