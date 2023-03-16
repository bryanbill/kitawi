import 'dart:html';
import 'package:kitawi/src/basic.dart';
export 'package:kitawi/src/basic.dart';
export 'package:kitawi/src/components/container.dart';

/// The run function is the entry point for the Kitawi library. It takes a
/// a [List] of [Route] as an argument and renders it to the DOM.
///
/// The [id] argument is optional. If it is not provided, the initial route is
/// attached to the element with the id `root`.
///
/// ```dart
/// import 'package:kitawi/kitawi.dart';
///
/// void main() {
///  run([Route(path: '/', builder: () => MyApp())]);
/// }
/// ```
void run(List<Route> routes, {String? id}) {
  // the overrides below are compulsory
  document.documentElement?.style.height = '100%';
  document.body?.style.height = '100%';
  document.body?.style.padding = '0';
  document.body?.style.margin = '0';
  document.body?.style.boxSizing = 'border-box';

  var root = document.getElementById(id ?? 'root')
    ?..style.height = '100%'
    ..style.padding = '0'
    ..style.margin = '0';
  Size().updateSize();
  Theme().updateMode();
  // Initialize the router
  Router.init(root: root, routes: routes);
}

/// The render function takes a [Widget] and a [Element] as arguments and
/// renders the [Widget] to the [Element].

void render(Widget widget, Element? element) {
  if (element != null) {
    element.children.clear();
    element.children.add(widget.render());
  }
}

final ValueStream<Size> windowSize = ValueStream(Size()..updateSize());
