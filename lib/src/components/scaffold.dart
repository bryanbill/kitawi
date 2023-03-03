import 'package:kitawi/src/basic.dart';

/// NOTE: This is a work in progress.
///
///
/// The [Scaffold] class provides a basic layout structure for a page.
/// It consists of a [navbar], [body], [sidebar], [footer], [drawer] and
/// [floatingActionButton].
/// The [Scaffold] class is a [Widget] class.
class Scaffold extends Kitawi {
  final Widget body;
  final Widget? navbar;
  final Widget? sidebar;
  final Widget? footer;
  final Widget? drawer;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;

  Scaffold(
      {required this.body,
      this.navbar,
      this.sidebar,
      this.footer,
      this.drawer,
      this.floatingActionButton,
      this.backgroundColor});

  @override
  Widget build() {
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
            sidebar ??
                Container(height: Dimensions.zero, width: Dimensions.zero),
            SizedBox(
              height: Dimensions.full,
              width: Dimensions.full,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  navbar ?? Container(),
                  navbar != null
                      ? Container(
                          margin: EdgeInsets.only(top: 64 + 32),
                          width: Dimensions.full,
                          height: Dimensions.calc(
                              from: Dimensions.full, inset: 96.px),
                          child: body)
                      : body,
                  footer ?? Container(),
                  floatingActionButton ?? Container(),
                ],
              ),
            ),
          ],
        ));
  }
}
