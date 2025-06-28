import 'package:shared_preferences/shared_preferences.dart';

class LocalClient {
  final SharedPreferences sharedPreference;

  LocalClient(this.sharedPreference);

  static const String userKey = 'user';
  static const String accessTokenKey = 'accessToken';
  static const String userBoxName = 'userBox';

  bool get isFirstOpen {
    return sharedPreference.getBool("isFirstOpen") ?? true;
  }

  String get accessToken {
    return sharedPreference.getString("accessToken") ?? "";
  }

  void setFirstOpen(bool value) {
    sharedPreference.setBool("isFirstOpen", value);
  }

  void setAccessToken(String value) {
    sharedPreference.setString("accessToken", value);
  }

  void clearAccessToken() {
    sharedPreference.remove("accessToken");
  }
}
