import 'dart:html';

enum ThemeMode { light, dark, system }

class Theme {
  static late ThemeMode _mode;

  static final Theme _instance = Theme._internal();

  factory Theme() {
    return _instance;
  }

  Theme._internal() {
    _mode = ThemeMode.system;
  }

  /// Returns the current theme mode.
  static ThemeMode get mode {
    if (_mode == ThemeMode.system) {
      return window.matchMedia('(prefers-color-scheme: dark)').matches
          ? ThemeMode.dark
          : ThemeMode.light;
    } else {
      return _mode;
    }
  }

  static set mode(ThemeMode value) {
    _mode = value;

    // set the prefers-color-scheme media query to the window
  }

  void updateMode() {
    // whenever the theme changes, all text and background colors should be
    // updated based on the new theme.

    _mode = ThemeMode.system;
  }

  @override
  String toString() {
    return 'Theme(mode: $_mode)';
  }
}
