import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// A widget that is a specific size.
/// If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent).
/// If not given a child, this widget will try to be as small as possible but still take up the allocated space given its width and height.
class Sizedbox extends Widget {
  final Dimensions? width;
  final Dimensions? height;
  final Widget? child;
  Sizedbox({this.width, this.height, this.child});

  @override
  Element createElement() {
    return Container(
      width: width,
      height: height,
      child: child,
    ).render();
  }
}