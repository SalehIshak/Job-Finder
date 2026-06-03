import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PrefHelper {
  final SharedPreferences _prefs;
  PrefHelper(this._prefs);

  // Future<void> init() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  ///////////////////// BOOL
  Future<void> setBool(String key, bool isDone) async {
    _prefs.setBool(key, isDone);
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  ///////////////////////// STRINGS
  Future<void> setString(String key, String value) async {
    _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  ////////////////  STRING LIST
  Future<void> setStringList(String key, List<String> list) async {
    _prefs.setStringList(key, list);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<void> clearFromSharedPrefs(String kry) async {
    _prefs.remove(kry);
  }

  // CLEAR ALL
  Future<void> clearAll() async {
    _prefs.clear();
  }
}
