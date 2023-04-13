import 'dart:html';

import 'package:kitawi/kitawi.dart';
import 'package:kitawi/src/widgets/sized_widgets/preffered_size_widget.dart';

class SideBar extends PreferredSizeWidget {
  final Widget? title;
  final Widget? body;
  final Widget? footer;
  final Dimensions? width;
  final Decoration? decoration;
  final BorderRadius? borderRadius;

  SideBar(
      {Key? key,
      this.title,
      this.body,
      this.footer,
      this.width,
      this.decoration,
      this.borderRadius})
      : super(key: key);

  @override
  Element createElement() {
    var div = DivElement()
      ..style.width = width?.toString() ?? '300px'
      ..style.maxWidth = '25%'
      ..style.height = '100%'
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.backgroundColor = decoration?.color?.rgba
      ..style.borderRadius = borderRadius?.toString() ?? '0px'
      ..style.boxShadow = decoration?.boxShadow?.toString() ?? 'none'
      ..children = [
        if (title != null) title!.createElement()..style.maxHeight = '64px',
        if (body != null) body!.createElement()..style.flex = '1',
        if (footer != null) footer!.createElement(),
      ];
    return div;
  }
}
