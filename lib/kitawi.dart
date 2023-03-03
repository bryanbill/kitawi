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
  // the overrides below are compulsory
  document.documentElement?.style.height = '100%';
  document.body?.style.height = '100%';
  document.body?.style.padding = '0';
  document.body?.style.margin = '0';
  document.body?.style.boxSizing = 'border-box';

  render(
    widget,
    document.getElementById(id ?? 'root')
      ?..style.height = '100%'
      ..style.padding = '0'
      ..style.margin = '0',
  );
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
  ascii();
  Size().updateSize();
  Theme().updateMode();
  callback();

  window.addEventListener('load', (event) {
    // Your code here will execute after all resources are loaded
    window.alert('All resources finished loading!');
  });

  /// The [VoidCallback] is called when the window is resized.
  window.onResize.listen((event) {
    Size().updateSize();
    callback();
  });

  final scheme = window.matchMedia('(prefers-color-scheme: dark)');

  /// The [VoidCallback] is called when the color scheme is changed.
  scheme.addListener((event) {
    Theme().updateMode();
    callback();
  });

  print("Kitawi up and running :)");
}

void ascii() {
  print('''
        ,
/|   / o                   o
 |__/    _|_  __,
 | \\   |  |  /  |  |  |  |_|
 |  \\_/|_/|_/\\_/|_/ \\/ \\/  |_/
        ''');
}
