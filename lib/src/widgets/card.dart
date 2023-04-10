import 'dart:html';

import 'package:kitawi/widgets.dart';

class Card extends Widget {
  final Widget child;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? shadowColor;
  final EdgeInsets? padding;

  Card({
    required this.child,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.padding = const EdgeInsets.all(5),
  });

  @override
  Element createElement() {
    var div = DivElement()
      ..style.position = 'relative'
      ..style.padding = padding?.toString() ?? '0'
      ..style.borderRadius = borderRadius?.toString() ?? '0'
      ..style.boxShadow =
          '0 0 ${elevation ?? 0}px ${shadowColor?.rgba ?? 'transparent'}'
      ..style.backgroundColor = color?.rgba ?? 'transparent'
      ..children.add(child.render());

    if (padding != null) {
      var paddingLeft = padding?.left ?? 0;
      var paddingRight = padding?.right ?? 0;
      var paddingTop = padding?.top ?? 0;
      var paddingBottom = padding?.bottom ?? 0;
      div.style.width =
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of(paddingLeft + paddingRight))}';
      div.style.height =
          '${Dimensions.calc(from: 100.percent, inset: Dimensions.of(paddingTop + paddingBottom))}';
    } else {
      div.style.width = '100%';
      div.style.height = '100%';
    }
    return div;
  }
}
