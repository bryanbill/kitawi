import 'dart:html';

import 'package:kitawi/src/core/action.dart';
import 'package:kitawi/src/core/text_style.dart';
import 'package:kitawi/src/core/widget.dart';

/// The [Text] class is a widget that displays a single line of text.
class Text extends Widget {
  /// Creates a new [Text] widget with the given parameters.
  final String _text;

  /// The [style] parameter is optional and specifies the style of the text [TextStyle].
  final TextStyle? style;

  /// The [action] parameter is optional and specifies the action to perform when the text is clicked [Action].
  final Action? action;

  Text(this._text, {this.style, this.action});

  /// The [createElement] method creates the [ParagraphElement] for the widget.

  @override
  Element createElement() {
    return ParagraphElement()
      ..text = _text
      ..style.color = style?.color?.rgba 
      ..style.backgroundColor = style?.backgroundColor?.rgba
      ..style.fontFamily = style?.fontFamily
      ..style.fontSize = '${style?.fontSize}px'
      ..style.fontWeight = '${style?.fontWeight?.index}'
      ..style.fontStyle = style?.fontStyle?.value
      ..style.padding = '0'
      ..style.margin = '0'
      ..on[action?.type ?? ''].listen((event) {
        action?.callback.call(event);
      });
  }
}
