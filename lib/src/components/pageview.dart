import 'dart:html';

import 'package:kitawi/src/basic.dart';

class PageView extends Widget {
  final List<Widget> children;
  final Axis scrollDirection;
  final double bounceExtent;
  final ScrollPhysics? physics;
  final PageController Function(
      int initialOffset, ScrollMetrics metrics, Element element)? controller;

  PageView({
    Key? key,
    required this.children,
    this.scrollDirection = Axis.horizontal,
    this.physics = const NeverScrollablePhysics(),
    this.bounceExtent = 0.2,
    this.controller,
  }) : super(key: key);

  @override
  Element createElement() {
    var div = DivElement()
      ..style.display = (scrollDirection == Axis.horizontal) ? 'flex' : 'block'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.justifyContent =
          (scrollDirection == Axis.horizontal) ? 'flex-start' : 'center'
      ..style.alignItems =
          (scrollDirection == Axis.horizontal) ? 'center' : 'flex-start'
      ..children = children.map((e) => e.createElement()).toList()
      ..classes.add('scrollable');

    if (physics is NeverScrollablePhysics) {
      div.style.overflow = 'hidden';
    }

    

    if (physics is AlwaysScrollableScrollPhysics) {
      div.style.overflow = 'scroll';

      for (var element in div.children) {
        element.classes.add('inner');
      }
    }

    return div;
  }

  factory PageView.builder({
    Key? key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    Axis scrollDirection = Axis.horizontal,
    double bounceExtent = 0.2,
    ScrollPhysics? physics = const NeverScrollablePhysics(),
  }) {
    return PageView(
        key: key,
        children: List.generate(itemCount, (index) {
          return itemBuilder(index);
        }),
        scrollDirection: scrollDirection,
        bounceExtent: bounceExtent,
        physics: physics);
  }
}

class PageController {
  final int? initialScrollOffset;

  final ScrollMetrics? metrics;

  final Element? element;

  PageController({this.metrics, this.initialScrollOffset = 0, this.element});

  void jumpTo(double value) {
    if (element != null) {
      element!.scrollLeft = value.toInt();
    }
  }
}
