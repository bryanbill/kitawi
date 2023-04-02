import 'dart:html';
import 'package:kitawi/kitawi.dart';

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

  Text(this._text, {Key? key, this.style, this.textAlign = TextAlign.left})
      : super(key: key);

  /// The [createElement] method creates the [ParagraphElement] for the widget.

  @override
  Element createElement() {
    return ParagraphElement()
      ..text = _text
      ..style.color = style?.color?.rgba ??
          Theme.themeData?.textTheme?.bodyText1?.color?.rgba
      ..style.backgroundColor = style?.backgroundColor?.rgba
      ..style.fontFamily = style?.fontFamily
      ..style.fontSize = '${style?.fontSize}'
      ..style.fontWeight = style?.fontWeight?.index.toString()
      ..style.fontStyle = style?.fontStyle?.value
      ..style.padding = '0'
      ..style.margin = '0'
      ..style.textAlign = textAlign?.value
      ..style.textDecoration = style?.textDecoration?.toString();
  }
}

/// The TextAlign property aligns the text to the specified side in it's main axis
///
/// Example:
/// ```dart
/// Text(
///  'Hello World',
/// textAlign: TextAlign.center,
/// )
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

