import 'package:flutter_sample_app/data/preferences/app_preferences.dart';

class AppPreferencesStub implements AppPreferences {
  final _accessToken = _PrefsValue<String>(initialValue: 'test-access-token');

  @override
  Future<Preference<String>> get accessToken async => _accessToken;
}

class _PrefsValue<T> implements Preference<T> {
  T current;

  _PrefsValue({T initialValue}) {
    current = initialValue;
  }

  @override
  T load() {
    return current;
  }

  @override
  Future<bool> save(T value) async {
    current = value;
    return true;
  }
}
