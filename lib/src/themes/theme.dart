import 'dart:html';

/// The accepted theme modes for the application
///
/// * `light` - The light theme is used when the user prefers light colors.
/// * `dark` - The dark theme is used when the user prefers dark colors.
/// * `system` - The system theme is used when the user prefers either light or dark colors.
enum ThemeMode { light, dark, system }

/// The `Theme` class is used to manage the theme of the application.
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

  /// Sets the theme mode.
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
