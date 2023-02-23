import 'dart:html';

import 'package:kitawi/src/basic.dart';

export 'package:kitawi/src/basic.dart';
export 'package:kitawi/src/components/container.dart';

/// The run function is the entry point for the Kitawi library. It takes a
/// [Widget] as an argument and renders it to the DOM.
///
/// The [id] argument is optional. If it is not provided, the [Widget] is
/// attached to the element with the id `output`.
///
/// ```dart
/// import 'package:kitawi/kitawi.dart';
///
/// void main() {
///  run(MyApp());
/// }
/// ```
void run(Widget widget, {String? id}) {
  render(
      widget, document.getElementById(id ?? 'output')?..style.height = '100%');
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
  // The [VoidCallback] is called when the window is loaded.
  Size().updateSize();
  Theme().updateMode();
  callback();

  print("Starting Kitawi...");

  window.addEventListener('load', (event) {
    // Your code here will execute after all resources are loaded
    window.alert('All resources finished loading!');
  });

  /// The [VoidCallback] is called when the window is resized.
  window.onResize.listen((event) {
    Size().updateSize();
    callback();
  });

  /// The [VoidCallback] is called when the color scheme is changed.
  window.matchMedia('(prefers-color-scheme: dark)').addListener((event) {
    Theme().updateMode();
    callback();
  });
}
