import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  PreferenceString _accessToken;

  Future<Preference<String>> get accessToken async {
    _accessToken ??= PreferenceString(
      await SharedPreferences.getInstance(),
      key: 'access_token',
    );
    return _accessToken;
  }
}

abstract class Preference<T> {
  Future<bool> save(T value);

  T load();
}

class PreferenceString implements Preference<String> {
  final SharedPreferences _prefs;
  final String key;

  PreferenceString(this._prefs, {@required this.key, String initialValue}) {
    try {
      if (initialValue == null || _prefs.getString(key)?.isNotEmpty == true) {
        return;
      }
      _prefs.setString(key, initialValue);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> save(String value) {
    return _prefs.setString(key, value);
  }

  @override
  String load() {
    return _prefs.getString(key);
  }
}
