import 'dart:html';

import 'package:kitawi/src/core/size.dart';

/// The [MediaQuery] class provides access to the screen size and other
/// information about the current device.
class MediaQuery {
  static MediaQueryData get data => MediaQueryData.fromWindow(window);

  static MediaQuery of() => MediaQuery();

  // size of the screen/window
  static Size get size => Size()
    ..x = (data as Window).innerWidth ?? 0
    ..y = (data as Window).innerHeight ?? 0;

  static final String siteName = 'Kitawi';

  static set siteName(String name) {
    document.title = name;
  }

  @override
  String toString() {
    return 'MediaQuery(data: $data)';
  }
}

class MediaQueryData {
  static MediaQueryData fromWindow(dynamic window) => MediaQueryData();
}
