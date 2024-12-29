import 'package:get/get.dart';

import '../modules/add_car/add_car_binding.dart';
import '../modules/add_car/add_car_view.dart';
import '../modules/car_news/car_news_binding.dart';
import '../modules/car_news/car_news_view.dart';
import '../modules/forget_password/forget_password_binding.dart';
import '../modules/forget_password/forget_password_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/navigation_bar/navigation_bar_binding.dart';
import '../modules/navigation_bar/navigation_bar_view.dart';
import '../modules/onboarding_screen/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/onboarding_screen_view.dart';
import '../modules/profile_screen/profile_screen_binding.dart';
import '../modules/profile_screen/profile_screen_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import '../modules/splash_screen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CAR,
      page: () => const AddCarView(),
      binding: AddCarBinding(),
    ),
    GetPage(
      name: _Paths.CAR_NEWS,
      page: () => CarNewsView(),
      binding: CarNewsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
  ];
}
