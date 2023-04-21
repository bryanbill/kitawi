import 'dart:html';

import 'package:kitawi/widgets.dart';

/// Base class for all widgets.
///
/// A widget is an immutable description of part of a user interface.

abstract class Widget {
  /// The key that uniquely identifies this widget.
  final Key? key;

  const Widget({this.key});

  /// Creates an element that represents this widget in the render tree.
  Element createElement();

  /// Returns true if this widget can be updated with the oldWidget.
  bool canUpdate(Widget oldWidget) {
    return oldWidget.key == key;
  }
}
