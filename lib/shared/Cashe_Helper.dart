import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> PutDataa({
    required String Key,
    required bool value,
  })async
  {
    return await sharedPreferences.setBool(Key, value);
  }
  static dynamic GetDataa({
  required String Key,
})
  {
    sharedPreferences.getBool(Key);

  }


}
