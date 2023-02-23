import 'dart:html';

import 'package:kitawi/src/basic.dart';

class Padding extends Widget {
  final Widget child;
  final EdgeInsets padding;

  Padding({Key? key, required this.child, required this.padding})
      : super(key: key);

  @override
  Element createElement() {
    final element = Element.div();
    print(padding);
    element.style.width = '100%';
    element.style.maxWidth = '100%';
    element.style.height = 'auto';
    element.style.boxSizing = 'border-box !important';
    element.style.padding = padding.toString();
    element.children.add(child.render());
    return element;
  }
}
