import 'package:get/get.dart';
import 'package:wichpath_ai/features/profile/profile.dart';
import 'root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
