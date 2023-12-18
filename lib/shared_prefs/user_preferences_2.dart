import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences_2 {
  static UserPreferences_2? _instance;
  static SharedPreferences? _preferences;

  static Future<UserPreferences_2> getInstance() async {
    _instance ??= UserPreferences_2();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> saveData(String key, dynamic value) {
    if (value is String) {
      return _preferences!.setString(key, value);
    }
    if (value is bool) {
      return _preferences!.setBool(key, value);
    }
    if (value is int) {
      return _preferences!.setInt(key, value);
    }
    throw Exception('Unsupported value type');
  }

  dynamic getData(String key) {
    var value = _preferences!.get(key);
    return value;
  }

  Future<bool> removeData(String key) {
    return _preferences!.remove(key);
  }
}
