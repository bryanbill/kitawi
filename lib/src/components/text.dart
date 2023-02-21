import 'dart:html';

import 'package:kitawi/src/core/action.dart';
import 'package:kitawi/src/core/text_style.dart';
import 'package:kitawi/src/core/widget.dart';

class Text extends Widget {
  final String text;
  final TextStyle? style;
  final Action? action;

  Text(this.text, {this.style, this.action});

  @override
  Element createElement() {
    return ParagraphElement()
      ..text = text
      ..style.color = style?.color?.rgba
      ..style.backgroundColor = style?.backgroundColor?.rgba
      ..style.fontFamily = style?.fontFamily
      ..style.fontSize = '${style?.fontSize}px'
      ..style.fontWeight = '${style?.fontWeight?.index}'
      ..style.fontStyle = style?.fontStyle?.value
      ..on[action?.type ?? ''].listen((event) {
        action?.onClick.call(event);
      });
  }
}
