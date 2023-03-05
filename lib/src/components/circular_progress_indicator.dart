import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// The [CircularProgressIndicator] widget is used to show the progress of a task.
///
/// It is a circular progress indicator that animates in a clockwise manner.
class CircularProgressIndicator extends Widget {
  /// The color of the track.
  final Color? trackColor;

  /// The color of the progress.
  final Color? progressColor;

  /// The width of the progress indicator.
  ///
  /// The default value is 3.
  final double? strokeWidth;

  /// The type of the stroke.
  ///
  /// The default value is [BorderType.solid].
  final BorderType? strokeType;

  /// The value of the progress indicator.
  final double? value;

  /// The radius of the progress indicator.
  final Dimensions? radius;

  CircularProgressIndicator(
      {Key? key,
      this.trackColor = Colors.grey200,
      this.progressColor = Colors.red300,
      this.strokeWidth = 3,
      this.value,
      this.radius,
      this.strokeType = BorderType.solid});

  @override
  Element createElement() {
    return DivElement()
      ..style.width = '$radius'
      ..style.height = '$radius'
      ..style.borderRadius = '50%'
      ..style.border =
          '${strokeWidth}px ${strokeType.toString().split('.').last} ${trackColor?.rgba}'
      ..style.borderTopColor = progressColor?.rgba
      ..animate([
        {'transform': 'rotate(0deg)'},
        {'transform': 'rotate(360deg)'},
      ], {
        'duration': 1000,
        'iterations': double.infinity,
        'direction': 'normal',
        'easing': 'linear',
      });
  }
}
