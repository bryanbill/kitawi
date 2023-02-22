import 'dart:html';

import 'package:kitawi/src/basic.dart';

/// NOTE: This is a work in progress.
///
///
/// The [Scaffold] class provides a basic layout structure for a page.
/// It consists of a [navbar], [body], [sidebar], [footer], [drawer] and
/// [floatingActionButton].
/// The [Scaffold] class is a [Widget] class.
class Scaffold extends StatelessWidget {
  final Widget? body;
  final Widget? navbar;
  final Widget? sidebar;
  final Widget? footer;
  final Widget? drawer;
  final Widget? floatingActionButton;

  Scaffold(
      {this.body,
      this.navbar,
      this.sidebar,
      this.footer,
      this.drawer,
      this.floatingActionButton});

  /// The [createElement] method creates the [DivElement] for the widget.
  @override
  Element createElement() {
    // TODO?: lookup this pattern
    var wrapper = DivElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'space-between'
      ..style.alignItems = 'stretch'
      ..style.overflow = 'hidden';

    return wrapper;
  }

  @override
  Widget build() {
    return Container(
        width: Size().width,
        constraints: BoxConstraints(
          minHeight: Size().height,
        ),
        decoration: Decoration(
          color: Theme().mode == ThemeMode.light ? Colors.white : Colors.grey24,
        ));
  }
}
