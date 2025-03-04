import 'package:web/web.dart';

class LocalStorage {
  static String? get(String key) {
    return window.localStorage.getItem(key);
  }

  static void set(String key, String value) {
    window.localStorage.setItem(key, value);
  }

  static void remove(String key) {
    window.localStorage.removeItem(key);
  }

  static void clear() {
    window.localStorage.clear();
  }

  static Map<String, String> getAll() {
    final data = <String, String>{};
    for (var i = 0; i < window.localStorage.length; i++) {
      final key = window.localStorage.key(i);
      if (key != null) {
        data[key] = window.localStorage[key]!;
      }
    }
    return data;
  }
}
