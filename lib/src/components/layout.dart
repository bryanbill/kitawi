import 'dart:html';

import 'package:kitawi/kitawi.dart';


abstract class Layout extends Widget {
  Layout({Key? key}) : super(key: key) {
    init();
  }

  Element? _element;

  /// The [render] method creates the element for the widget.
  @override
  Element render() {
    return build().render();
  }

  @override
  Widget build();

  @override
  Element createElement() {
    _element = build().render();
    return _element!;
  }

  void init() {}

  @override
  void dispose() {
    _element?.remove();
    _element = null;
    super.dispose();
  }
}
