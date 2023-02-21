import 'dart:html';

import 'package:kitawi/src/basic.dart';

export 'package:kitawi/src/basic.dart';
export 'package:kitawi/src/components/container.dart';

/// The run function is the entry point for the Kitawi library. It takes a
/// [Widget] as an argument and renders it to the DOM.
///
/// ```dart
/// import 'package:kitawi/kitawi.dart';
///
/// void main() {
///  run(MyApp());
/// }
/// ```
void run(Widget widget, {String? id}) {
  render(widget, document.getElementById(id ?? 'root'));
}

/// The render function takes a [Widget] and a [Element] as arguments and
/// renders the [Widget] to the [Element].

void render(Widget widget, Element? element) {
  if (element != null) {
    element.children.clear();
    element.children.add(widget.render());
  }
}

/// The start function is the entry point for the Kitawi library. It takes a
/// [VoidCallback] as an argument and renders it to the DOM.
///
/// ```dart
/// import 'package:kitawi/kitawi.dart';
///
/// void main() {
///  start(() {
///   run(MyApp());
/// });
/// }
/// ```
///
/// The [VoidCallback] is called when the window is loaded and when the window
/// is resized.
void start(VoidCallback callback) {
  window.onLoad.listen((event) {
    Size().updateSize();
    callback();
  });

  window.onResize.listen((event) {
    Size().updateSize();
    callback();
  });
}
