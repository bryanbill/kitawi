import 'dart:html';

import 'package:kitawi/src/basic.dart';

class PageView extends Widget {
  final List<Widget> children;
  final Axis scrollDirection;
  final double bounceExtent;

  PageView({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.horizontal,
    this.bounceExtent = 0.2,
  }) : super(key: key);

  @override
  Element createElement() {
    return DivElement()
      ..style.display = (scrollDirection == Axis.horizontal) ? 'flex' : 'block'
      ..style.overflow = 'auto'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.justifyContent =
          (scrollDirection == Axis.horizontal) ? 'flex-start' : 'center'
      ..style.alignItems =
          (scrollDirection == Axis.horizontal) ? 'center' : 'flex-start'
      ..children = children.map((e) => e.createElement()).toList()
      ..classes.add('scrollable')
      ..onScroll.listen((event) {});
  }

  factory PageView.builder({
    Key? key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    Axis scrollDirection = Axis.horizontal,
    double bounceExtent = 0.2,
  }) {
    return PageView(
      key: key,
      children: List.generate(itemCount, (index) {
        return itemBuilder(index);
      }),
      scrollDirection: scrollDirection,
      bounceExtent: bounceExtent,
    );
  }
}
