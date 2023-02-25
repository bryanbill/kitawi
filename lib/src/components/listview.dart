import 'dart:html';

import 'package:kitawi/src/basic.dart';

class Listview extends Widget {
  final List<Widget> children;
  final Axis? scrollDirection;

  Listview(
      {Key? key,
      required this.children,
      this.scrollDirection = Axis.horizontal})
      : super(key: key);

  factory Listview.builder({
    Key? key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    Axis? scrollDirection = Axis.horizontal,
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
    var element = DivElement();
    element.style.display = 'flex';
    element.style.flexDirection = scrollDirection == Axis.horizontal
        ? 'row'
        : scrollDirection == Axis.vertical
            ? 'column'
            : 'row';
    element.style.overflowX =
        scrollDirection == Axis.horizontal ? 'scroll' : 'hidden';
    element.style.overflowY =
        scrollDirection == Axis.vertical ? 'scroll' : 'hidden';
    element.style.width = scrollDirection == Axis.horizontal ? '100%' : 'auto';
    element.style.height = scrollDirection == Axis.vertical ? '100%' : 'auto';

    return element;
  }
}
