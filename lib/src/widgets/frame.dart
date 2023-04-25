import 'dart:html';

import 'package:kitawi/widgets.dart';

/// NOTE: This is a work in progress.
///
///
/// The [Frame] class provides a basic layout structure for a page.

/// The [Frame] class is a [Widget] class.
class Frame extends Widget {
  final Widget body;
  final Widget? appbar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;

  Frame(
      {required this.body,
      this.appbar,
      this.drawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.backgroundColor});

  @override
  Element createElement() {
    return Container(
        height: 100.percent,
        width: Dimensions.full,
        constraints: BoxConstraints(
          minHeight: 100.vh,
          minWidth: 100.vw,
          maxHeight: 100.vh,
          maxWidth: 100.vw,
        ),
        decoration: Decoration(
          color: backgroundColor,
        ),
        child: Row(
          children: [
            drawer ??
                Container(height: Dimensions.zero, width: Dimensions.zero),
            SizedBox(
              height: Dimensions.full,
              width: Dimensions.full,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appbar ?? Container(),
                  SizedBox(
                      height: 100.percent -
                          64.px -
                          (bottomNavigationBar != null ? 64.px : 0.px),
                      width: 100.percent,
                      child: body),
                  bottomNavigationBar ?? Container(),
                  floatingActionButton ?? Container(),
                ],
              ),
            ),
          ],
        )).createElement();
  }
}
