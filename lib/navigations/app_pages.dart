import 'package:get/get.dart';
import 'package:wichpath_ai/features/root/root.dart';
import 'package:wichpath_ai/features/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: initial, page: () => SplashPage(), binding: SplashBinding()),
  ];
}
