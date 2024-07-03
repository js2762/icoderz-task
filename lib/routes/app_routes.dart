part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const HOME_VIEW = _Paths.HOME_VIEW;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const HOME_VIEW = '/home-view';
  static const SPLASH = '/splash-view';
}
