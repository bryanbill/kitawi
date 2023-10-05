import 'package:kitawi/kitawi.dart';

class HeadElement extends Element {
  HeadElement() : super('head');
  List<Meta>? meta = [
    Meta('viewport', 'width=device-width, initial-scale=1.0'),
  ];
  List<Link>? links;
  List<Script>? scripts;
  String? title;
  @override
  String render() {
    final buffer = StringBuffer();
    buffer.write('<$tag');
    buffer.write('>');
    if (title != null) {
      buffer.write('<title>$title</title>');
    }

    for (var child in meta ?? []) {
      buffer.write(child.render());
    }
    for (var child in links ?? []) {
      buffer.write(child.render());
    }
    // add js
    for (var jsFile in scripts ?? []) {
      buffer.write(jsFile.render());
    }

    buffer.write('</$tag>');
    return buffer.toString();
  }
}

class Meta {
  String name;
  String content;
  Meta(this.name, this.content);

  String render() {
    return '<meta name="$name" content="$content"/>';
  }
}

class Link {
  String rel;
  String href;
  String? type;

  Link(this.rel, this.href, {this.type});

  String render() {
    return '<link rel="$rel" href="$href" ${type != null ? 'type="$type"' : ''}/>';
  }
}

class Script {
  String src;
  bool async = false;
  bool defer = false;

  Script(this.src);

  String render() {
    return '<script src="$src" ${async ? 'async' : ''} ${defer ? 'defer' : ''}></script>';
  }
}

HeadElement head({
  String? style,
  List<Meta>? meta,
  List<Link>? links,
  List<Script>? scripts,
  String? title,
}) =>
    HeadElement()
      ..meta = meta
      ..links = links
      ..title = title
      ..scripts = scripts;
