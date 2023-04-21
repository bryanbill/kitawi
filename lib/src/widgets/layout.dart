import 'dart:html';

import 'package:kitawi/widgets.dart';

/// Represents a widget with mutable state.

abstract class Layout extends Widget {
  Element? _element;

  Layout({Key? key}) : super(key: key) {
    init();
  }

  void init() {}

  Widget build();

  @override
  Element createElement() {
    _element = build().createElement()..id = key.toString();
    return _element!;
  }

  void dispose() {
    _element!.remove();
    _element = null;
  }

  void setState(void Function() fn) {
    fn();
    if (build().canUpdate(this)) render(build(), _element);
  }

  bool get mounted => _element != null;
}
