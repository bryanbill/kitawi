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

  // the max value of the progress indicator.
  final double? maxValue;

  /// The radius of the progress indicator.
  final Dimensions? radius;

  /// The inner widget of the progress indicator.
  final Widget? child;

  CircularProgressIndicator(
      {Key? key,
      this.trackColor = Colors.grey200,
      this.progressColor = Colors.red300,
      this.strokeWidth = 3,
      this.value,
      this.maxValue = 100,
      this.child,
      this.radius,
      this.strokeType = BorderType.solid});

  @override
  Element createElement() {
    if (value == null || maxValue == null) {
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
    } else {
      var childElement = child?.render();
      var css = """
.radial-wrap {
  width: $radius;
  height: $radius;
  background: ${trackColor?.rgba};
  border-radius: 50%;
  z-index: 0;
}

.radial-wrap .circle .mask,
.radial-wrap .circle .fill {
  width: $radius;
  height: $radius;
  position: absolute;
  border-radius: 50%;
}

.radial-wrap .circle .mask {
  clip: rect(0px, $radius, $radius, ${(int.parse(radius.toString().replaceAll(RegExp(r'[^0-9]'), ''))) / 2}px);
}

.radial-wrap .inside-circle {
  width: ${childElement?.style.width};
  height: ${childElement?.style.height};
  border-radius: 50%;
  background-color: ${childElement?.style.backgroundColor};

  position: absolute;
  text-align: center;
  z-index: 100;
}

/* color animation */

/* 3rd progress bar */
.mask .fill {
  clip: rect(0px,${(int.parse(radius.toString().replaceAll(RegExp(r'[^0-9]'), ''))) / 2}px , $radius, 0px);
  background-color: ${progressColor?.rgba};
  z-index: -1;
}

.mask.full,
.circle .fill {
  animation: fill ease-in-out 2s ${value == null ? 'infinite' : ''};
 transform: rotate(${(value != null && maxValue != null ? value! / maxValue! * 180 : 180)}deg);
}

@keyframes fill{
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(${(value != null && maxValue != null ? value! / maxValue! * 180 : 180)}deg);
  }
}

.circle{
  width:100%;
  height:100%;
  position:relative;
  z-index: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}



""";
      var style = StyleElement()..text = css;
      document.head!.children.add(style);

      var div = DivElement()
        ..classes.add('radial-wrap')
        ..children.add(DivElement()
          ..classes.add('circle')
          ..children.addAll([
            DivElement()
              ..classes.addAll(['mask', 'full'])
              ..style.zIndex = '-1'
              ..children.add(DivElement()..classes.add('fill')),
            DivElement()
              ..classes.addAll(['mask', 'half'])
              ..children.add(DivElement()..classes.add('fill')),
            DivElement()
              ..classes.add('inside-circle')
              ..children.add((childElement?..style.borderRadius = "50%") ??
                  Text('${value ?? 0}').render()),
          ]));

      return div;
    }
  }
}
