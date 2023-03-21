import 'dart:html';

import 'package:kitawi/src/basic.dart';

class PreferredSizeWidget extends Widget {
  PreferredSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Element createElement() {
    var div = Element.nav()
      ..style.height = '40px'
      ..style.maxHeight = '40px'
      ..style.minHeight = '40px'
      ..style.display = "flex"
      ..style.alignItems = "center"
      ..style.justifyContent = "space-between";

    return div;
  }
}
