import 'package:kitawi/src/basic.dart';

/// NOTE: This is a work in progress.
///
///
/// The [Scaffold] class provides a basic layout structure for a page.
/// It consists of a [navbar], [body], [sidebar], [footer], [drawer] and
/// [floatingActionButton].
/// The [Scaffold] class is a [Widget] class.
class Scaffold extends StatelessWidget {
  final Widget body;
  final Widget? navbar;
  final Widget? sidebar;
  final Widget? footer;
  final Widget? drawer;
  final FloatingActionButton? floatingActionButton;

  Scaffold(
      {required this.body,
      this.navbar,
      this.sidebar,
      this.footer,
      this.drawer,
      this.floatingActionButton});

  @override
  Widget build() {
    return Container(
        height: Dimensions.full,
        width: Dimensions.full,
        constraints: BoxConstraints(
          minHeight: Dimensions.of(Size().height),
        ),
        decoration: Decoration(
          color: Theme().mode == ThemeMode.light ? Colors.white : Colors.grey24,
        ),
        child: Row(
          children: [
            sidebar ??
                Container(height: Dimensions.zero, width: Dimensions.zero),
            Sizedbox(
              height: Dimensions.full,
              width: Dimensions.full,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navbar ?? Container(),
                  body,
                  footer ?? Container(),
                  floatingActionButton ?? Container(),
                ],
              ),
            ),
          ],
        ));
  }
}
