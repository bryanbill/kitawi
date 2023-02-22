import 'dart:html';

enum ThemeMode { light, dark, system }

class Theme {
  late ThemeMode _mode;

  static final Theme _instance = Theme._internal();

  factory Theme() {
    return _instance;
  }

  Theme._internal() {
    _mode = ThemeMode.system;
  }

  ThemeMode get mode {
    if (_mode == ThemeMode.system) {
      return window.matchMedia('(prefers-color-scheme: dark)').matches
          ? ThemeMode.dark
          : ThemeMode.light;
    } else {
      return _mode;
    }
  }

  set mode(ThemeMode value) {
    _mode = value;
  }

  void updateMode() {
    _mode = ThemeMode.system;
  }

  @override
  String toString() {
    return 'Theme(mode: $_mode)';
  }
}