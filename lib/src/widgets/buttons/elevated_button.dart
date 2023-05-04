import 'dart:html';
import 'package:kitawi/widgets.dart';

/// This class represents a button with an elevation.
class ElevatedButton extends Button {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  ElevatedButton(
      {Widget? child,
      Decoration? decoration,
      this.padding,
      this.margin,
      Color? splashColor,
      this.borderRadius,
      required List<Action> actions})
      : super(
            actions: actions,
            decoration: decoration,
            child: child,
            splashColor: splashColor);

  @override
  Element createElement() {
    var element = super.createElement()
      ..style.padding = '$padding'
      ..style.margin = '$margin';
    element.style.position = 'relative';
    element.style.zIndex = '9999';

    // add elevation
    element.style.boxShadow = '0 0 10px 0 rgba(0, 0, 0, 0.2)';

    // add border radius
    element.style.borderRadius = borderRadius?.toString() ?? 'inherit';
    
    return element;
  }
}
