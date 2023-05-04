import 'dart:html';

import 'package:kitawi/src/core/action.dart';
import 'package:kitawi/src/core/color.dart';
import 'package:kitawi/src/core/edge_insets.dart';
import 'package:kitawi/src/core/foundation.dart';
import 'package:kitawi/src/widgets/buttons/button.dart';
import 'package:kitawi/src/widgets/widget.dart';

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
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  FloatingActionButton(
      {Widget? child,
      Decoration? decoration,
      this.padding,
      this.margin,
      Color? splashColor,
      this.position,
      required List<Action> actions})
      : super(
            actions: actions,
            decoration: decoration,
            child: child,
            splashColor: splashColor);

  final Alignment? position;

  @override
  Element createElement() {
    var element = super.createElement()
      ..style.padding = '$padding'
      ..style.margin = '$margin';
    element.style.position = 'fixed';
    element.style.zIndex = '9999';

    var sizeFromTheEdge = "64";

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
        element.style.right = '16px';
        break;
      case Alignment.bottomLeft:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.left = '16px';
        break;
      case Alignment.topCenter:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.left = '50%';
        element.style.transform = 'translateX(-50%)';
        break;
      case Alignment.topRight:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.right = '16px';
        break;
      case Alignment.topLeft:
        element.style.top = '${sizeFromTheEdge}px';
        element.style.left = '16px';
        break;
      default:
        element.style.bottom = '${sizeFromTheEdge}px';
        element.style.right = '16px';
        break;
    }

    return element;
  }
}
