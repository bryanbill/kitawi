import 'dart:html';

import 'package:kitawi/src/basic.dart';

class PageView extends Widget {
  final int itemCount;
  final Widget Function(int index) itemBuilder;
  final Axis scrollDirection;
  final double bounceExtent;

  PageView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.horizontal,
    this.bounceExtent = 0.2,
  }) : super(key: key);

  @override
  Element createElement() {
    return DivElement()
      ..style.display = 'flex'
      ..style.overflow = 'auto'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.justifyContent =
          (scrollDirection == Axis.horizontal) ? 'flex-start' : 'center'
      ..style.alignItems =
          (scrollDirection == Axis.horizontal) ? 'center' : 'flex-start'
      ..children.addAll(
        List.generate(itemCount, (index) {
          return itemBuilder(index).render();
        }),
      )
      ..classes.add('scrollable')
      ..onScroll.listen((event) {
        final element = event.target as DivElement;
        final maxScrollExtent = (scrollDirection == Axis.horizontal)
            ? element.scrollWidth
            : element.scrollHeight;
        final viewportExtent = (scrollDirection == Axis.horizontal)
            ? element.clientWidth
            : element.clientHeight;
        final currentScrollExtent = (scrollDirection == Axis.horizontal)
            ? element.scrollLeft
            : element.scrollTop;
        final minScrollExtent = 0;
        final overscrollExtent =
            (maxScrollExtent - viewportExtent) * bounceExtent;
        if (currentScrollExtent <= minScrollExtent) {
          element.scrollLeft += overscrollExtent.toInt();
          element.scrollTop += overscrollExtent.toInt();
        } else if (currentScrollExtent >= maxScrollExtent - viewportExtent) {
          element.scrollLeft -= overscrollExtent.toInt();
          element.scrollTop -= overscrollExtent.toInt();
        }
      });
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
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      scrollDirection: scrollDirection,
      bounceExtent: bounceExtent,
    );
  }
}
