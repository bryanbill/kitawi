import 'dart:html';

import 'package:kitawi/kitawi.dart';

///
abstract class Kitawi extends Widget {
  Kitawi({Key? key}) : super(key: key);

  /// The [render] method creates the element for the widget.
  @override
  Element render() {
    return StreamBuilder<Size?>(
        initialData: windowSize.value,
        stream: windowSize.stream,
        errorWidgetBuilder: (error) =>
            ErrorWidget(message: "Resize Error", details: error),
        builder: (snap) => build()).render();
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
