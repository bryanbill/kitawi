import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// The GestureDetector class is a widget that is used to
/// wrap around widgets with actions (clic, hover, e.t.c)
///
/// Example:
///
/// ```dart
/// GestureDetector(
///   onTap: ()=> print("Tapped"),
///   child: widgetA
/// );
///
/// ```
class GestureDetector extends Widget {
  final Widget child;

  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final Function()? onPanStart;
  final Function()? onPanUpdate;
  final Function()? onPanEnd;
  final Function()? onPanCancel;
  final Function()? onScaleStart;
  final Function()? onScaleUpdate;
  final Function()? onScaleEnd;

  GestureDetector(
      {this.onTap,
      this.onDoubleTap,
      this.onLongPress,
      this.onPanStart,
      this.onPanUpdate,
      this.onPanEnd,
      this.onPanCancel,
      this.onScaleStart,
      this.onScaleUpdate,
      this.onScaleEnd,
      Key? key,
      required this.child})
      : super(key: key);
  @override
  Element createElement() {
    var element = DivElement();
    element.id = key?.value ?? '';
    element.children.add(child.render());

    element.onClick.listen((event) {
      event.preventDefault();
      onTap?.call();
    });

    element.onDoubleClick.listen((event) {
      event.preventDefault();
      onDoubleTap?.call();
    });

    return element;
  }
}
