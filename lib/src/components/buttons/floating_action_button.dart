import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// The [FloatingActionButton] class is a widget that displays a floating action button.
///
/// The button is positioned at the bottom right corner of the screen by default.
/// You can change the position of the button by specifying the [position] parameter.
/// The [position] parameter can be one of the following:
/// * [Alignment.bottomCenter]
/// * [Alignment.bottomRight]
/// * [Alignment.bottomLeft]
/// * [Alignment.topCenter]
/// * [Alignment.topRight]
/// * [Alignment.topLeft]
class FloatingActionButton extends Button {
  FloatingActionButton(
      {Widget? child,
      Decoration? decoration,
      EdgeInsets? padding,
      EdgeInsets? margin,
      Dimensions? width,
      Dimensions? height,
      BorderRadius? borderRadius,
      Color? splashColor,
      this.position,
      required List<Action> actions})
      : super(
            actions: actions,
            decoration: decoration,
          
            borderRadius: borderRadius,
            child: child,
            splashColor: splashColor);

  final Alignment? position;

  @override
  Element createElement() {
    var element = super.createElement();
    element.style.position = 'fixed';
    element.style.zIndex = '9999';

    var sizeFromTheEdge = "66";

    // add elevation
    element.style.boxShadow = '0 0 10px 0 rgba(0, 0, 0, 0.2)';

    switch (position) {
      case Alignment.bottomCenter:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.left = '50%';
        element.style.transform = 'translateX(-50%)';
        break;
      case Alignment.bottomRight:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.right = '20px';
        break;
      case Alignment.bottomLeft:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.left = '20px';
        break;
      case Alignment.topCenter:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.left = '50%';
        element.style.transform = 'translateX(-50%)';
        break;
      case Alignment.topRight:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.right = '20px';
        break;
      case Alignment.topLeft:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.left = '20px';
        break;
      default:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.right = '20px';
        break;
    }

    return element;
  }
}
