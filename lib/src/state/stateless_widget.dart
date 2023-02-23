import 'dart:html';

import 'package:kitawi/src/basic.dart';

///
abstract class StatelessWidget extends Widget {
  StatelessWidget({Key? key}) : super(key: key);

  /// The [render] method creates the element for the widget.
  @override
  Element render() {
    return build().render();
  }

  /// The [build] method creates the element for the widget.
  /// It is an abstract method and must be implemented by the subclasses.
  @override
  Widget build();

  @override
  Element createElement() {
    return build().render();
  }
}
