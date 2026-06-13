import 'package:get/get.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/register_consumer/bindings/register_consumer_binding.dart';
import '../modules/authentication/register/register_consumer/views/register_consumer_view.dart';
import '../modules/authentication/register/register_farmer/bindings/register_farmer_binding.dart';
import '../modules/authentication/register/register_farmer/views/register_farmer_view.dart';
import '../modules/authentication/rolepicker/bindings/rolepicker_binding.dart';
import '../modules/authentication/rolepicker/views/rolepicker_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_FARMER,
      page: () => const RegisterFarmerView(),
      binding: RegisterFarmerBinding(),
    ),

    GetPage(
      name: _Paths.REGISTER_CONSUMER,
      page: () => const RegisterConsumerView(),
      binding: RegisterConsumerBinding(),
    ),

    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ROLEPICKER,
      page: () => const RolePickerView(),
      binding: RolepickerBinding(),
    ),
  ];
}
