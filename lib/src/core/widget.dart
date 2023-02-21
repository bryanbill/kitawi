import 'dart:html' as html;
import 'dart:math';

import 'package:kitawi/src/core/key.dart';
import 'package:kitawi/src/mixins/resize.dart';

/// The [Widget] class is the base class for all the widgets.
/// It provides the basic functionality for all the widgets.
/// It takes a [Key] as an argument.
/// The [Widget] class is an abstract class and cannot be instantiated.
/// It has the following methods:
/// * [render] - renders the widget to the DOM
/// * [createElement] - creates the element for the widget
/// * [rebuild] - rebuilds the widget
/// * [dispose] - disposes the widget
/// * [resizeListener] - listens to the resize event

abstract class Widget with Resize {
  Key? key;
  html.Element? _element;

  Widget({Key? key});

  html.Element render() {
    //  generate key if not provided
    key ??= Key(Random().nextInt(1000000000).toString());
    _element ??= createElement()..id = key?.value ?? 'this is not right';
    return _element!;
  }

  /// The [createElement] method creates the element for the widget.
  /// It is an abstract method and must be implemented by the subclasses.
  html.Element createElement();

  // rebuild
  void rebuild() {
    createElement();
  }

  @override
  void dispose() {
    super.dispose();
    _element?.remove();
    _element = null;
  }
}
