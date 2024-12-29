import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/text_strings.dart';
import 'onboarding_screen_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final onBoardingcontroller = Get.put(OnboardingScreenController());
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6),
      body: Stack(
        children: [
          // -- Horizontal Scrollable Pages
          PageView(
            controller: onBoardingcontroller.pageController,
            onPageChanged: onBoardingcontroller.updatePageIndicator,
            children: const [
              onBoardingPage(
                lottie: BaroImages.onBoardingAnimation1, 
                title: BaroTexts.onBoardingTitle1, 
                subtitle: BaroTexts.onBoardingSubtitle1
              ),
              onBoardingPage(
                lottie: BaroImages.onBoardingAnimation2, 
                title: BaroTexts.onBoardingTitle2, 
                subtitle: BaroTexts.onBoardingSubtitle2,
              ),
              onBoardingPage(
                lottie: BaroImages.onBoardingAnimation3, 
                title: BaroTexts.onBoardingTitle3, 
                subtitle: BaroTexts.onBoardingSubtitle3,
              ),
            ],
          ),

          // -- Dot Navigation SmoothPageIndicator
          const onBoardingDotNavigation(),
          // -- Circular Button
          const onBoardingNextButton()
        ],
      ),
    );
  }
}