import 'dart:html';

import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/core/widget.dart';

class Expanded extends Widget {
  Expanded({Key? key, this.child}) : super(key: key);

  final Widget? child;

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
