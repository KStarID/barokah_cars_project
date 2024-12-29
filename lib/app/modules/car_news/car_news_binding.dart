import 'package:get/get.dart';

import 'car_news_controller.dart';

class CarNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarNewsController>(
      () => CarNewsController(),
    );
  }
}
