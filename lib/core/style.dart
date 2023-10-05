class Color {
  final int r;
  final int g;
  final int b;

  Color(this.r, this.g, this.b);

  String toHex() {
    return "#${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}";
  }
}

class Font {
  final String? family;
  final String? size;
  final FontWeight? weight;

  Font({
    this.family,
    this.size,
    this.weight,
  });
}

enum FontWeight {
  normal,
  bold,
  bolder,
  lighter,
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900,
}

class Style {
  final Color? color;
  final Color? backgroundColor;
  final Font? font;

  Style({this.color, this.backgroundColor, this.font});

  String render() {
    final buffer = StringBuffer();
    if (color != null) {
      buffer.write("color: ${color!.toHex()};");
    }
    if (backgroundColor != null) {
      buffer.write("background-color: ${backgroundColor!.toHex()};");
    }
    if (font != null) {
      if (font!.family != null) buffer.write("font-family: ${font!.family};");
      if (font!.size != null) buffer.write("font-size: ${font!.size};");
      if (font!.weight != null) buffer.write("font-weight: ${font!.weight};");
    }
    return buffer.toString();
  }
}

extension FontSizeExt on int {
  String get px => "${this}px";
  String get em => "${this}em";
  String get rem => "${this}rem";
  String get percent => "$this%";
}
