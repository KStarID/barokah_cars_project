import 'package:barokah_cars_project/app/modules/car_news/controllers/car_news_controller.dart';
import 'package:get/get.dart';

class AllBrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarNewsController>(
      () => CarNewsController(),
    );
  }
}
