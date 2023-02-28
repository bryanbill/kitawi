import 'dart:html';

import 'package:kitawi/src/basic.dart';

class Listview extends Widget {
  final List<Widget> children;
  final Axis? scrollDirection;

  Listview({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

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
    var element = DivElement();

    element.style.display = 'flex';
    element.style.flexDirection =
        scrollDirection == Axis.horizontal ? 'row' : 'column';
    element.style.overflowY = 'scroll';
    element.style.width = '100%';

    // design rule: .2 is used by navbar and footer
    element.style.height = '100%';

    element.classes.add('scrollable');

    for (var child in children) {
      element.append(child.createElement());
    }

    return element;
  }
}
