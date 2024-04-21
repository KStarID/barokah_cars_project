import 'package:barokah_cars_project/app/modules/login/views/widgets/login_header.dart';
import 'package:barokah_cars_project/app/modules/register/views/widgets/register_form.dart';
import 'package:barokah_cars_project/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 80, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -- Header
                BaroFormHeader(headerTitle: BaroTexts.registerTitle, headerDesc: BaroTexts.registerDesc,),
                const SizedBox(height: 20,),
                BaroRegisterForm(),
              ],
            ),
          ),
        )
      )
    );
  }
}
