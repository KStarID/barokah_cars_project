import 'package:get/get.dart';

import '../controllers/all_brand_controller.dart';

class AllBrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllBrandController>(
      () => AllBrandController(),
    );
  }
}
