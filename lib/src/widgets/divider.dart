import 'dart:html';

import 'package:kitawi/widgets.dart';

class Divider extends Widget {
  final Color? color;
  final Dimensions? thickness;
  final Dimensions? width;

  Divider({this.width, this.color, this.thickness});
  @override
  Element createElement() {
    return HRElement()
      ..style.backgroundColor = color?.rgba ?? 'transparent'
      ..style.width = '$width'
      ..style.height = '$thickness';
  }
}
