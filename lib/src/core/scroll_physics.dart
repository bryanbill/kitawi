abstract class ScrollPhysics {
  const ScrollPhysics({this.parent});

  final ScrollPhysics? parent;


  void applyTo(ScrollPhysics? ancestor);

  void applyPhysicsToUserOffset(ScrollMetrics position, double offset) {}

  @override
  String toString() {
    return '$runtimeType';
  }
}

class NeverScrollablePhysics extends ScrollPhysics {
  const NeverScrollablePhysics();

  @override
  NeverScrollablePhysics applyTo(ScrollPhysics? ancestor) {
    return this;
  }

  @override
  String toString() {
    return '$runtimeType()';
  }
}

class AlwaysScrollableScrollPhysics extends ScrollPhysics {
  AlwaysScrollableScrollPhysics();

  @override
  AlwaysScrollableScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return this;
  }

  @override
  String toString() {
    return '$runtimeType()';
  }
}

class ScrollContoller {
  final int? initialScrollOffset;

  final ScrollMetrics? metrics;

  ScrollContoller({this.metrics, this.initialScrollOffset = 0});

  void jumpTo(double value) {}
}

class ScrollMetrics {
  final double minScrollExtent;
  final double maxScrollExtent;
  final double pixels;
  final double viewportDimension;
  final double axisDirection;

  ScrollMetrics({
    required this.minScrollExtent,
    required this.maxScrollExtent,
    required this.pixels,
    required this.viewportDimension,
    required this.axisDirection,
  });

  @override
  String toString() {
    return '$runtimeType(minScrollExtent: $minScrollExtent, maxScrollExtent: $maxScrollExtent, pixels: $pixels, viewportDimension: $viewportDimension, axisDirection: $axisDirection)';
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  final double threshold;

  const CustomScrollPhysics({
    required ScrollPhysics parent,
    this.threshold = 0.5,
  }) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
      parent: buildParent(ancestor),
      threshold: threshold,
    );
  }

  buildParent(ScrollPhysics? ancestor) {
    return parent!.applyTo(ancestor);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    final direction = offset.sign;
    final maxScrollExtent = position.maxScrollExtent;
    final viewportDimension = position.viewportDimension;
    final childWidth = viewportDimension * threshold;

    if (direction > 0 &&
        position.pixels >= maxScrollExtent - viewportDimension) {
      // If we're already at the end of the list, don't do anything
      return 0.0;
    }

    if (direction < 0 && position.pixels <= position.minScrollExtent) {
      // If we're already at the beginning of the list, don't do anything
      return 0.0;
    }

    final nextChildOffset = position.pixels + childWidth * direction;

    if (nextChildOffset < 0.0) {
      // If the next child would be off-screen to the left, snap to the current child
      return -position.pixels;
    } else if (nextChildOffset > maxScrollExtent) {
      // If the next child would be off-screen to the right, snap to the current child
      return maxScrollExtent - position.pixels;
    } else {
      // Scroll to the next child
      return childWidth * direction;
    }
  }
}
