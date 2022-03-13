import 'package:simple_flutter_login/preferences/pref_instance.dart';

class PrefUtil {
  static Future<int> get getIsLogin => PrefInstance.getInt(PrefName.isLogin);
  static Future setIsLogin(int value) => PrefInstance.setInt(PrefName.isLogin, value);

  static Future<String> get getUserData => PrefInstance.getString(PrefName.userData);
  static Future setUserData(String value) => PrefInstance.setString(PrefName.userData, value);

  // static Future logout() => PrefInstance.clear();
  // atau bisa ini
  static Future logout() => PrefInstance.setInt(PrefName.isLogin, 0);
}


class PrefName {
  static String isLogin = "pref_is_login";
  static String userData = "pref_user_data";
}