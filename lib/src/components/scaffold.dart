import 'dart:html';

import 'package:kitawi/src/core/widget.dart';

class Frame extends Widget {
  final Widget? body;
  final Widget? navbar;
  final Widget? sidebar;
  final Widget? footer;
  final Widget? drawer;
  final Widget? floatingActionButton;

  Frame(
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
    Frame(
      body: body,
      navbar: navbar,
      sidebar: sidebar,
      footer: footer,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    ).createElement();
  }
}
