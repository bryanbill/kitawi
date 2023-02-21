import 'dart:html';

import 'package:kitawi/src/core/widget.dart';

/// The [Scaffold] class provides a basic layout structure for a page.
/// It consists of a [navbar], [body], [sidebar], [footer], [drawer] and
/// [floatingActionButton].
/// The [Scaffold] class is a [Widget] class.
class Scaffold extends Widget {
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

  @override
  Element createElement() {
    return DivElement()
      ..children.add(navbar?.render() ?? DivElement())
      ..children.add(body?.render() ?? DivElement())
      ..children.add(sidebar?.render() ?? DivElement());
  }

  void build() {
    Scaffold(
      body: body,
      navbar: navbar,
      sidebar: sidebar,
      footer: footer,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    ).createElement();
  }
}
