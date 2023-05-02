import 'dart:html';

import 'package:kitawi/widgets.dart';

class Card extends Widget {
  final Widget child;
  Dimensions? elevation;
  BorderRadius? borderRadius;
  Color? color;
  Color? shadowColor;
  Color? focusColor;
  EdgeInsets? padding;

  Card({
    required this.child,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.padding,
  });

  @override
  Element createElement() {
    padding ??= EdgeInsets.all(5.px);

    return DivElement()
      ..classes.add('relative')
      ..classes.add('shadow-[${elevation?.toString() ?? '0'}]')
      ..classes.add('rounded-[${borderRadius?.toString() ?? '0'}]')
      ..classes.add("w-full")
      ..classes.add("h-full")
      ..classes.add("bg-[${color?.hex}]")
      ..classes.add('p-[${padding?.toString() ?? '0'}]')
      ..children.add(child.createElement());
  }
}
