
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils{

  static SharedPreferences? prefs;


  // Load stored value from SharedPreferences
  static String? loadStringValue(String key) {
    return prefs!.getString(key);
  }

  // Save value to SharedPreferences
  static Future<void> saveStringValue(String key,String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString(key, value);
  }

}