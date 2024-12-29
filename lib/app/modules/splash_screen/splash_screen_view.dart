import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants/image_strings.dart';
import 'splash_screen_controller.dart';
import 'widgets/center_logo.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(initState: (_) {
      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.ONBOARDING_SCREEN);
      });
    }, builder: (context) {
      return const Scaffold(
        backgroundColor: Color(0xFFF2F1F6),
        body: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: CenterLogo(
            logo: BaroImages.appLogo,
            width: 253,
            height: 53,
          ),
        ),
      );
    });
  }
}
