import 'dart:html';

import 'package:kitawi/kitawi.dart';

class Icon extends Widget {
  final IconData icon;
  final Color? color;
  final double? size;

  Icon(this.icon, {this.color, this.size});
  @override
  Element createElement() {
    var image = Image(icon.base64,
        width: size,
        height: size,
        decoration: Decoration(color: color),
        fit: BoxFit.cover);

    return image.render();
  }
}
