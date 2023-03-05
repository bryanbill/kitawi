import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// This is a simple animation that creates a bouncing dot effect
/// using animate method.
class BouncingDot extends Widget {

  /// The color of the dot.
  final Color? dotColor;

  /// The size of the dot in [Dimensions].
  final Dimensions? dotSize;

  /// The duration of the animation in milliseconds.
  /// The default value is 1000.
  final int? duration;

  BouncingDot({
    Key? key,
    this.dotColor = Colors.black,
    this.dotSize,
    this.duration = 1000,
  });

  @override
  Element createElement() {
    return DivElement()
      ..style.width = '$dotSize'
      ..style.height = '$dotSize'
      ..style.borderRadius = '50%'
      ..style.backgroundColor = dotColor?.rgba
      ..animate([
        {'transform': 'translateY(0px)'},
        {'transform': 'translateY(-20px)'},
        {'transform': 'translateY(0px)'},
      ], {
        'duration': duration,
        'iterations': double.infinity,
        'direction': 'normal',
        'easing': 'cubic-bezier(0.65, 0.05, 0.36, 1)',
      });
  }
}
