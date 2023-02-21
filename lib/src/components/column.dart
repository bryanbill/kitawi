import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// The [Column] class is a widget that displays its children in a vertical
class Column extends Widget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  Column({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Element createElement() {
    final column = DivElement();
    column.style.display = 'flex';
    column.style.flexDirection = 'column';
    column.style.justifyContent = mainAxisAlignment.toString();
    column.style.alignItems = crossAxisAlignment.toString();
    column.style.height = '100%';
    column.style.width = '100%';
    for (final child in children) {
      column.children.add(child.render());
    }

    return column;
  }
}
