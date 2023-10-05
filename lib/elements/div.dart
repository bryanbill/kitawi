import 'package:kitawi/core/element.dart';
import 'package:kitawi/core/event.dart';
import 'package:kitawi/core/style.dart';

class Div extends Element {
  Div() : super('div');
  Style? style;
  String? classes;
  List<Element> children = [];
  List<Event> events = [];
  List<Map<String, String>> attributes = [];

  @override
  String render() {
    final buffer = StringBuffer();
    buffer.write('<$tag');
    if (style != null) {
      buffer.write(' style="$style"');
    }
    if (classes != null) {
      buffer.write(' class="$classes"');
    }

    for (var attribute in attributes) {
      buffer.write(' ${attribute.keys.first}="${attribute.values.first}"');
    }
    buffer.write('>');
    for (var child in children) {
      buffer.write(child.render());
    }
    buffer.write('</$tag>');
    return buffer.toString();
  }
}

Div div(
        {Style? style,
        String? classes,
        List<Element>? children,
        List<Event>? events}) =>
    Div()
      ..style = style
      ..classes = classes
      ..children = children ?? []
      ..events = events ?? [];
