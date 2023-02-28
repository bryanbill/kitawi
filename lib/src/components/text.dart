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

  /// The [TextAlign] class is used to align the text in the [Text] widget.
  /// The [TextAlign] class has the following values:
  /// - [TextAlign.left] - Aligns the text to the left.
  /// - [TextAlign.right] - Aligns the text to the right.
  /// - [TextAlign.center] - Aligns the text to the center.
  /// - [TextAlign.justify] - Aligns the text to the justify.
  /// - [TextAlign.start] - Aligns the text to the start.
  /// - [TextAlign.end] - Aligns the text to the end.
  /// 
  /// The default value is [TextAlign.left].
  final TextAlign? textAlign;

  Text(this._text, {this.style, this.textAlign = TextAlign.left});

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
      ..style.textAlign = textAlign?.value;
  }
}

class TextAlign {
  final String value;

  const TextAlign._(this.value);

  static const left = TextAlign._('left');
  static const right = TextAlign._('right');
  static const center = TextAlign._('center');
  static const justify = TextAlign._('justify');
  static const start = TextAlign._('start');
  static const end = TextAlign._('end');
}
