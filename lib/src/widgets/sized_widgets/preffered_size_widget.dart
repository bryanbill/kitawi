import 'dart:html';

import 'package:kitawi/widgets.dart';

class PreferredSizeWidget extends Widget {
  PreferredSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Element createElement() {
    var div = Element.nav()
      ..style.height = '48px'
      ..style.maxHeight = '48px'
      ..style.minHeight = '48px'
      ..style.display = "flex"
      ..style.alignItems = "center"
      ..style.justifyContent = "space-between";

    return div;
  }
}
