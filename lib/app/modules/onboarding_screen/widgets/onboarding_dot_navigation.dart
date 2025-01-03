import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../onboarding_screen_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onBoardingcontroller = Get.put(OnboardingScreenController());
    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: 24,
      child: SmoothPageIndicator(
        onDotClicked: onBoardingcontroller.dotNavigationClick,
        controller: onBoardingcontroller.pageController,
        count: 3,
        effect: const ExpandingDotsEffect(activeDotColor: Colors.black, dotHeight: 6),
      )
    );
  }
}