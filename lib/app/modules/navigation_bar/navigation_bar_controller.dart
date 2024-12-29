import 'package:get/get.dart';

import '../add_car/add_car_view.dart';
import '../car_news/car_news_view.dart';
import '../home/home_view.dart';
import '../profile_screen/profile_screen_view.dart';

class NavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeView(),
    const AddCarView(),
    CarNewsView(),
    const ProfileScreenView()
  ];
}
