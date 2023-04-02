import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// The [Listview] class is a widget that displays a list of widgets.
class Listview extends Widget {
  /// The [children] parameter is required and specifies the list of widgets.
  /// The [children] parameter can be any widget.
  final List<Widget> children;

  /// The [scrollDirection] parameter is optional and specifies the scroll direction of the list.
  /// The [scrollDirection] parameter can be any of the following values:
  /// - [Axis.horizontal] - The list will be scrolled horizontally.
  /// - [Axis.vertical] - The list will be scrolled vertically.
  final Axis? scrollDirection;

  Listview({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  /// The [Listview.builder] constructor is used to create a list of widgets.
  /// The [itemCount] parameter is required and specifies the number of widgets.
  /// The [itemBuilder] parameter is required and specifies the widget to be displayed.
  /// The [scrollDirection] parameter is optional and specifies the scroll direction of the list.
  /// The [scrollDirection] parameter can be any of the following values:
  /// - [Axis.horizontal] - The list will be scrolled horizontally.
  /// - [Axis.vertical] - The list will be scrolled vertically.
  /// The [Listview.builder] constructor can be used as follows:
  /// ```dart
  /// Listview.builder(
  ///  itemCount: 10,
  /// itemBuilder: (index) {
  ///  return Text(
  ///   'Item $index',
  /// );
  /// },
  /// );
  /// ```
  factory Listview.builder({
    Key? key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    Axis? scrollDirection = Axis.vertical,
  }) {
    return Listview(
      key: key,
      children: List.generate(
        itemCount,
        (index) => itemBuilder(
          index,
        ),
      ),
      scrollDirection: scrollDirection,
    );
  }

  @override
  Element createElement() {
    return DivElement()
      ..style.display = scrollDirection == Axis.horizontal ? 'flex' : 'block'
      ..style.overflow = 'auto'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.justifyContent = 'flex-start'
      ..style.alignItems = 'flex-start'
      ..children.addAll(
        children.map(
          (child) => child.render(),
        ),
      )
      ..classes.add('scrollable');
  }
}
