import 'dart:html';

import 'package:kitawi/src/core/size.dart';

/// Handles all the resize events and updates the size of the widget
/// accordingly.

mixin Resize {
  /// The size of the widget
  Size size = Size();

  /// The resize event listener
  void resizeListener() {
    size.updateSize();
    window.onResize.listen((event) {
      size.updateSize();
    });
  }

  /// The dispose method
  /// Removes the resize event listener
  void dispose() {
    window.onResize.listen((event) {
      size.updateSize();
    }).cancel();
  }
}
