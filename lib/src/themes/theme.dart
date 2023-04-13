import 'dart:html';

import 'package:kitawi/kitawi.dart';

enum ThemeMode { light, dark, system }

/// A class that provides utilities for applying and managing themes.
class Theme {
  /// The current [ThemeData] being used.
  static ThemeData? themeData;

  /// Initializes the theme.
  static void init({
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeMode? themeMode,
  }) {
    // If the theme mode is system, add a listener to the brightness preference of the user.
    if (themeMode == ThemeMode.system) {
      addBrightnessListener((brightness) {
        if (brightness == Brightness.light) {
          applyTheme(document.body!, theme!);
        } else {
          applyTheme(document.body!, darkTheme!);
        }
      });
    }

    // Apply the theme based on the theme mode.
    switch (themeMode) {
      case ThemeMode.light:
        applyTheme(document.body!, theme!);
        break;
      case ThemeMode.dark:
        applyTheme(document.body!, darkTheme!);
        break;
      case ThemeMode.system:
        if (brightness == Brightness.light) {
          applyTheme(document.body!, theme!);
        } else {
          applyTheme(document.body!, darkTheme!);
        }
        break;
      default:
        applyTheme(document.body!, theme!);
        break;
    }
  }

  /// Applies the provided [data] to the given [root] element.
  static void applyTheme(Element root, ThemeData data) {
    themeData = data;

    // Set the background color and text color of the root element.
    root.style.backgroundColor = data.backgroundColor?.rgba;
    root.style.color = data.textTheme?.bodyText1?.color?.rgba;

    // Set the font family, font size, font weight, font style, and text alignment of the root element.
    root.style.fontFamily = data.textTheme?.bodyText1?.fontFamily;
    root.style.fontSize = data.textTheme?.bodyText1?.fontSize?.toString();
    root.style.fontWeight = data.textTheme?.bodyText1?.fontWeight?.toString();
    root.style.fontStyle = data.textTheme?.bodyText1?.fontStyle?.toString();

    // Set the text decoration of the root element.
    root.style.textDecoration =
        data.textTheme?.bodyText1?.textDecoration?.toString();
  }

  /// Returns the current brightness preference of the user.
  static Brightness get brightness {
    return window.matchMedia('(prefers-color-scheme: dark)').matches
        ? Brightness.dark
        : Brightness.light;
  }

  /// Adds a listener to the brightness preference of the user, and calls the provided [callback] whenever it changes.
  static void addBrightnessListener(void Function(Brightness) callback) {
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change',
        (event) {
      return callback(brightness);
    });
  }

  static ThemeData light() {
    return ThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.grey900,
          fontFamily: 'Nunito',
          fontSize: 16.px,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          textDecoration: TextDecoration.none,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      backgroundColor: Colors.grey900,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontFamily: 'Nunito',
          fontSize: 16.px,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          textDecoration: TextDecoration.none,
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'Theme(data: $themeData)';
  }
}

/// An enum representing the brightness of a theme.
enum Brightness {
  /// The light brightness.
  light,

  /// The dark brightness.
  dark
}
