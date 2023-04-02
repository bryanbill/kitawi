import 'dart:html';

import 'package:kitawi/kitawi.dart';

class Icon extends Widget {
  final IconData icon;
  final Color? color;
  final Dimensions? size;
  Icon(
    this.icon, {
    this.color,
    this.size,
  });
  @override
  Element createElement() {
    final span = SpanElement()
      ..classes.add(icon.type!)
      ..style.color = color?.rgba
      ..style.fontSize = size?.toString()
      ..text = icon.name;
    return span;
  }
}
