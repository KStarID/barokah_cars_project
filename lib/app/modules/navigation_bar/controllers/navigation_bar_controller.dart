import 'package:barokah_cars_project/app/modules/home/views/home_view.dart';
import 'package:barokah_cars_project/app/modules/login/views/login_view.dart';
import 'package:barokah_cars_project/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:barokah_cars_project/app/modules/search_screen/views/search_screen_view.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeView(), const SearchScreenView (), const LoginView(), const ProfileScreenView()];
}
