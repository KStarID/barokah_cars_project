import 'package:barokah_cars_project/app/modules/add_car/views/add_car_view.dart';
import 'package:barokah_cars_project/app/modules/car_news/views/car_news_view.dart';
import 'package:barokah_cars_project/app/modules/home/views/home_view.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeView(), AddCarView (), CarNewsView(), ProfileScreenView()];
}
