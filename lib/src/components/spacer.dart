import 'dart:html';

import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/core/key.dart';

/// A widget that takes up space in the parent widget.

class Spacer extends Widget {
  /// Creates a widget that takes up space in the parent widget.
  Spacer({Key? key}) : super(key: key);

  @override
  Element createElement() {
    return Expanded().render();
  }
}

