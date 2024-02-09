

import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData({required bool value}) async {
    return await sharedPreferences?.setBool('isReadme', value);
  }

  static Future<dynamic> putuserdata({
    required String firstname,
    required String lastname,
    required String image,
    required String gender,
    required String email,
    required String username,
  }) async {
    return await sharedPreferences?.setStringList(
        'user', <String>[firstname, lastname, username, image, email, gender]);
  }

  static List<String> getuserdata() {

    final List<String>? items = sharedPreferences?.getStringList('user');
    return items??[];
  }

  static bool getdate() {
    final bool? repeat = sharedPreferences!.getBool('isReadme');

    return repeat ?? false;
  }
}
