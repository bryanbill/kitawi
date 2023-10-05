import 'package:kitawi/kitawi.dart';

class ParagraphElement extends Element {
  ParagraphElement() : super('p');
  String text = '';
  Style? style;
  List<Element> children = [];

  @override
  String render() {
    final buffer = StringBuffer();
    buffer.write('<$tag');
    if (style != null) {
      buffer.write(' style="${style!.render()}"');
    }
    buffer.write('>');
    buffer.write(text);
    for (var child in children) {
      buffer.write(child.render());
    }
    buffer.write('</$tag>');
    return buffer.toString();
  }
}

ParagraphElement p(String text, {Style? style, List<Element>? children}) =>
    ParagraphElement()
      ..style = style
      ..text = text
      ..children = children ?? [];
