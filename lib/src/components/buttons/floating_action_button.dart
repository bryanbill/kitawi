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
      this.position,
      required List<Action> actions})
      : super(
            actions: actions,
            decoration: decoration,
            padding: padding,
            margin: margin,
            width: width,
            height: height,
            borderRadius: borderRadius,
            child: child);

  final Alignment? position;

  @override
  Element createElement() {
    var element = super.createElement();
    element.style.position = 'fixed';

    switch (position) {
      case Alignment.bottomCenter:
        element.style.bottom = '80px';
        element.style.left = '50%';
        element.style.transform = 'translateX(-50%)';
        break;
      case Alignment.bottomRight:
        element.style.bottom = '80px';
        element.style.right = '20px';
        break;
      case Alignment.bottomLeft:
        element.style.bottom = '80px';
        element.style.left = '20px';
        break;
      case Alignment.topCenter:
        element.style.top = '80px';
        element.style.left = '50%';
        element.style.transform = 'translateX(-50%)';
        break;
      case Alignment.topRight:
        element.style.top = '80px';
        element.style.right = '20px';
        break;
      case Alignment.topLeft:
        element.style.top = '80px';
        element.style.left = '20px';
        break;
      default:
        element.style.bottom = '80px';
        element.style.right = '20px';
        break;
    }

    return element;
  }
}
