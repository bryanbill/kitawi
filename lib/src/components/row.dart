import 'dart:html';

import 'package:kitawi/src/basic.dart';

class Row extends Widget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  Row({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Element createElement() {
    final row = DivElement();
    row.style.display = 'flex';
    row.style.flexDirection = 'row';
    row.style.justifyContent = mainAxisAlignment.toString();
    row.style.alignItems = crossAxisAlignment.toString();
    
    row.style.height = '100%';
    row.style.width = '100%';
    for (final child in children) {
      row.children.add(child.render());
    }

    return row;
  }
}
