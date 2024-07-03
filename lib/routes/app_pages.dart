import 'package:get/get.dart';

import '../controllers/bindings/auth_binding.dart';
import '../views/authentication/login_view.dart';
import '../views/authentication/splash_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  // static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
  ];
}
