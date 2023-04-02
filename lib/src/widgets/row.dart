import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// The [Row] class is a widget that displays its children in a horizontal
/// array.
class Row extends Widget {
  final List<Widget> children;

  /// The [mainAxisAlignment] parameter is optional and specifies how the
  /// children should be aligned horizontally.

  final MainAxisAlignment mainAxisAlignment;

  /// The [crossAxisAlignment] parameter is optional and specifies how the
  /// children should be aligned vertically.

  final CrossAxisAlignment crossAxisAlignment;

  Row({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  /// The [createElement] method creates the [DivElement] for the widget.

  @override
  Element createElement() {
    final row = DivElement();
    row.style.display = 'flex';
    row.style.flexDirection = 'row';
    row.style.justifyContent = mainAxisAlignment.toString();
    row.style.alignItems = crossAxisAlignment.toString();
    row.style.width = '100%';
    row.style.height = '100%';
    row.style.overflow = 'hidden';
    for (final child in children) {
      row.children.add(child.render());
    }

    return row;
  }
}
