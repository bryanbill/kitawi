import 'dart:html';

import 'package:kitawi/src/basic.dart';
import 'package:kitawi/src/core/key.dart';

abstract class StatelessWidget extends Widget {
  StatelessWidget({Key? key}) : super(key: key);

  @override
  Element render() {
    return build().render();
  }

  /// The [build] method creates the element for the widget.
  /// It is an abstract method and must be implemented by the subclasses.
  @override
  Widget build();
}
