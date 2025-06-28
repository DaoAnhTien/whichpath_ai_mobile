import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wichpath_ai/utils/fcm_util.dart';
import 'package:wichpath_ai/utils/local_notification_util.dart';
import 'constants/app_constants.dart';
import 'di_container.dart' as di;
import 'domain/data/models/salesman_model.dart';
import 'domain/data/models/user_model.dart';
import 'l10n/translation_service.dart';
import 'navigations/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await di.init();
  LocalNotificationUtil().init();
  FcmUtil().initForegroundNotification();
  FcmUtil().backgroundHandler();
  await TranslationService.init();
  configLoading();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(SalesmanModelAdapter());
  await Hive.openBox<UserModel>(AppConstants.BOX_USER);
  runApp(
    GetMaterialApp(
      translations: TranslationService(),
      locale: const Locale('vi'),
      fallbackLocale: TranslationService.fallbackLocale,
      builder: EasyLoading.init(),
      title: 'App Tong Kho Client',
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      checkerboardRasterCacheImages: false,
      showPerformanceOverlay: false,
      useInheritedMediaQuery: true,
      defaultTransition: Transition.rightToLeft,
      unknownRoute: AppPages.routes[0],
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(turns: controller, child: child),
    );
  }
}
