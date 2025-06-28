import 'package:get/get.dart';
import 'package:wichpath_ai/di_container.dart';
import 'package:wichpath_ai/domain/client/api_client.dart';
import 'package:wichpath_ai/domain/client/local_client.dart';
import 'package:wichpath_ai/navigations/app_pages.dart';
import 'package:wichpath_ai/utils/object_util.dart';

import '../../domain/data/models/user_model.dart';
import '../../domain/database/user_db.dart';

class SplashController extends GetxController {
  final ApiClient client = ApiClient();

  @override
  void onInit() {
    super.onInit();
  }
}
