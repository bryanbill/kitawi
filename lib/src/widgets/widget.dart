import 'dart:html' as html;
import 'package:kitawi/widgets.dart';
import 'package:kitawi/src/core/key.dart';

/// A widget that can be built and rendered to HTML.
///
/// This widget is the base class for all widgets in the framework. It provides
/// a `render` method that can be used to generate the HTML element for the
/// widget. It also provides a `build` method that is called when the state of
/// the widget changes, so that the widget can rebuild itself.
abstract class Widget {
  Key? key;

  html.Element? _element;

  Widget({this.key});

  /// The [render] method creates the element for the widget.
  html.Element render() {
    _element ??= createElement();
    return _element!;
  }

  /// The [createElement] method creates the element for the widget.
  /// It is an abstract method and must be implemented by the subclasses.
  html.Element createElement();

  void build() {
    _element ??= createElement();
  }

  /// The [dispose] method is called when the widget is removed from the tree.
  /// It is an abstract method and must be implemented by the subclasses.
  void dispose() {
    _element?.remove();
    _element = null;
  }
}
