import 'dart:convert';
import 'dart:html';

class LocalStore {
  static void set(String key, Object value,
      {Object? Function(Object?)? converter}) async {
    window.localStorage[key] = jsonEncode(value, toEncodable: converter);
  }

  static String? get(String key) {
    return window.localStorage[key];
  }

  static void remove(String key) {
    window.localStorage.remove(key);
  }

  static void clear() {
    window.localStorage.clear();
  }
}
