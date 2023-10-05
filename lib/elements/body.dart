import 'package:kitawi/kitawi.dart';

class BodyElement extends Element {
  BodyElement() : super('body');
  Style? style;
  String? classes;
  List<Element> children = [];

  @override
  String render() {
    final buffer = StringBuffer();
    buffer.write('<$tag');
    if (style != null) {
      buffer.write(' style="${style!.render()}"');
    }
    if (classes != null) {
      buffer.write(' class="$classes"');
    }
    buffer.write('>');
    for (var child in children) {
      buffer.write(child.render());
    }
    buffer.write('</$tag>');
    return buffer.toString();
  }
}

BodyElement body({String? classes, Style? style, List<Element>? children}) =>
    BodyElement()
      ..style = style
      ..classes = classes
      ..children = children ?? [];
