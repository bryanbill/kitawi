import 'dart:html';

import 'package:kitawi/kitawi.dart';
import 'package:kitawi/src/components/sized_widgets/preffered_size_widget.dart';

/// NOTE: This is a work in progress.
///
///
/// The [Frame] class provides a basic layout structure for a page.

/// The [Frame] class is a [Widget] class.
class Frame extends Widget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  final PreferredSizeWidget? drawer;
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
        height: Dimensions.full,
        width: Dimensions.full,
        constraints: BoxConstraints(
          minHeight: Dimensions.of(Size().height),
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
                  body,
                  bottomNavigationBar ?? Container(),
                  floatingActionButton ?? Container(),
                ],
              ),
            ),
          ],
        )).render();
  }
}
