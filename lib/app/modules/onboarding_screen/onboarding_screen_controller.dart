import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class OnboardingScreenController extends GetxController {
  static OnboardingScreenController get instance => Get.find();

  // -- Variables
  final pageController = PageController();
  Rx<int> currentPageindex = 0.obs;

  // -- Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageindex.value = index;

  // -- Jump to Spesific dot selected page
  void dotNavigationClick(index){
    currentPageindex.value = index;
    pageController.jumpTo(index);
  }

  // -- Update Current Index & Jump to next page
  void nextPage(){
    if(currentPageindex.value == 2){
      Get.offAllNamed(Routes.LOGIN);
    }else{
      int page = currentPageindex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}
