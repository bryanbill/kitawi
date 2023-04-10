import 'dart:html';

import 'package:kitawi/widgets.dart';

/// The [Column] class is a widget that displays its children in a vertical
class Column extends Widget {
  /// The [List] of [Widget]s to display.
  final List<Widget> children;

  /// The [mainAxisAlignment] parameter is optional and specifies how the
  /// children should be aligned vertically.
  /// The default value is [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// The [crossAxisAlignment] parameter is optional and specifies how the
  /// children should be aligned horizontally.
  /// The default value is [CrossAxisAlignment.center].
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
    column.style.overflow = 'hidden';
    for (final child in children) {
      column.children.add(child.render());
    }

    return column;
  }
}
