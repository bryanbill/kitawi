import 'dart:html';

import 'package:kitawi/widgets.dart';

/// A widget that is a specific size.
/// If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent).
/// If not given a child, this widget will try to be as small as possible but still take up the allocated space given its width and height.
class SizedBox extends Widget {
  final Dimensions? width;
  final Dimensions? height;
  final Widget? child;
  SizedBox({Key? key, this.width, this.height, this.child}) : super(key: key);

  @override
  Element createElement() {
    return DivElement()
      ..id = key.toString()
      ..style.width = width?.toString()
      ..style.height = height?.toString()
      ..append(child?.createElement() ?? DivElement());
  }
}
