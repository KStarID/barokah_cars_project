import 'package:barokah_cars_project/app/modules/add_car/controllers/add_car_controller.dart';
import 'package:get/get.dart';

class AddCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarController>(
      () => AddCarController(),
    );
  }
}
