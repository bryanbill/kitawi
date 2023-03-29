import 'dart:html';

import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/components/widget.dart';

/// The [Expanded] class expands a child of a [Row] or [Column] so that the
/// child fills the available space.

class Expanded extends Widget {
  Expanded({Key? key, required this.child, this.flex = 1}) : super(key: key);

  /// The [child] contained by the [Expanded] widget.
  final Widget child;

  /// The flex factor to use for the child of the [Expanded] widget.
  final int? flex;

  /// The [createElement] method creates the [DivElement] for the widget.
  @override
  Element createElement() {
    final element = Element.div();
    element.id = key?.value ?? '';
    element.style.flex = flex.toString();
    element.style.width = '100%';
    element.children.add(child.render());
    return element;
  }
}
