import 'dart:html';

import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/core/key.dart';

/// A widget that takes up space in the parent widget.

class Spacer extends Widget {
  /// Creates a widget that takes up space in the parent widget.
  Spacer({Key? key, this.flex = 1}) : super(key: key);

  /// The flex factor to use for the child of the [Expanded] widget.
  /// The default value is 1.
  final int? flex;

  @override
  Element createElement() {
    final element = Element.div();
    element.id = key?.value ?? '';
    element.style.flex = flex.toString();
    element.style.width = '100%';
    return element;
  }
}
