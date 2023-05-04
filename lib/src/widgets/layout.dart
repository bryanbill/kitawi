import 'dart:html';

import 'package:kitawi/widgets.dart';

/// Represents a widget with mutable state.

abstract class Layout extends Widget {
  Element? _element;

  Layout() : super() {
    init();
  }

  void init() {}

  Widget build();

  @override
  Element createElement() {
    _element = build().createElement();
    return _element!;
  }

  void dispose() {
    _element!.remove();
    _element = null;
  }

  void setState(void Function() fn) {
    fn();
    // TODO!: Fix this - canUpdate not implemented 
    if (build().canUpdate(this)) render(build(), _element);
  }

  bool get mounted => _element != null;

  Size get windowSize => Size()
    ..x = window.innerWidth!
    ..y = window.innerHeight!;
}
