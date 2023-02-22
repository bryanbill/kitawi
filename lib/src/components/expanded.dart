import 'dart:html';

import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/core/widget.dart';

/// The [Expanded] class expands a child of a [Row] or [Column] so that the
/// child fills the available space.

class Expanded extends Widget {
  Expanded({Key? key, this.child}) : super(key: key);

  final Widget? child;

  /// The [createElement] method creates the [DivElement] for the widget.
  @override
  Element createElement() {
    final element = Element.div();
    element.style.flex = '1';
    if (child != null) {
      element.children.add(child!.render());
    }
    return element;
  }
}
