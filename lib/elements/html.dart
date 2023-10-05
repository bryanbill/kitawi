import 'package:kitawi/core/element.dart';

class HtmlElement extends Element {
  HtmlElement() : super('html');

  String? lang;
  List<Element> children = [];
  Element? head;

  @override
  String render() {
    final buffer = StringBuffer();
    // add doctype
    buffer.write('<!DOCTYPE html>');
    buffer.write('<$tag');
    if (lang != null) {
      buffer.write(' lang="$lang"');
    }
    buffer.write('>');
    if (head != null) {
      buffer.write(head!.render());
    }
    for (var child in children) {
      buffer.write(child.render());
    }
    buffer.write('</$tag>');
    return buffer.toString();
  }
}

HtmlElement html({
  String? style,
  String? lang,
  List<Element>? children,
  List<String>? css,
  List<String>? js,
}) =>
    HtmlElement()
      ..lang = lang
      ..children = children ?? [];
