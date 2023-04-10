import 'dart:html';

import 'package:kitawi/widgets.dart';

class Padding extends Widget {
  final Widget child;
  final EdgeInsets padding;

  Padding({Key? key, required this.child, required this.padding})
      : super(key: key);

  @override
  Element createElement() {
    final element = Element.div();
    element.style.width = 'auto';
    element.style.maxWidth = 'auto';
    element.style.height = 'auto';
    element.style.boxSizing = 'border-box !important';
    element.style.padding = padding.toString();
    element.children.add(child.render());
    return element;
  }
}
