import 'dart:html';

import 'package:kitawi/kitawi.dart';

class Center extends Widget {
  final Widget child;

  Center({required this.child});
  @override
  Element createElement() {
    return DivElement()
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.height = '100%'
      ..style.width = '100%'
      ..children.add(child.render());
  }
}
