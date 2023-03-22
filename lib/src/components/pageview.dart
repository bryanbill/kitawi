import 'dart:async';
import 'dart:html';

import 'package:kitawi/src/basic.dart';

class PageView extends Widget {
  final List<Widget> children;
  final Axis scrollDirection;
  final double bounceExtent;
  final ScrollPhysics? physics;
  final PageController? controller;

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
      ..classes.add('scrollable');

    if (physics is NeverScrollablePhysics) {
      var pageStream = StreamBuilder<int>(
        stream: controller?.stream,
        initialData: controller?.initialOffset,
        builder: (snapshot) => children[snapshot.data ?? 0],
        errorWidgetBuilder: (error) => Text(error.toString()),
      );

      div.children.add(pageStream.createElement());
    } else {
      div.children.addAll(children.map((e) => e.createElement()).toList());
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
  final int? initialOffset;
  final ScrollMetrics? metrics;
  final Element? element;
  final StreamController<int> _controller = StreamController<int>.broadcast();

  PageController({this.initialOffset = 0, this.metrics, this.element});

  Stream<int> get stream => _controller.stream;

  void jumpToPage(int page) {
    _controller.add(page);
  }

  void animateToPage(int page,
      {Duration duration = const Duration(seconds: 1)}) {
    _controller.add(page);
  }

  void dispose() {
    _controller.close();
    print(_controller.isClosed);
  }
}
