import 'dart:html';

import 'package:kitawi/widgets.dart';

class CircleAvatar extends Widget {
  final Widget? child;
  final Color? color;
  final Dimensions? size;

  CircleAvatar({this.child, this.color, this.size});
  @override
  Element createElement() {
    return DivElement()
      ..style.backgroundColor = color?.rgba ?? 'transparent'
      ..style.borderRadius = '50%'
      ..style.width = '$size'
      ..style.height = '$size'
      ..style.maxHeight = '40px'
      ..style.maxWidth = '40px'
      ..style.minHeight = '$size'
      ..style.minWidth = '$size'
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..children.add(child?.createElement() ?? DivElement());
  }
}
