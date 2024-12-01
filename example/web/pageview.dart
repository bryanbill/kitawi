import 'package:kitawi/kitawi.dart';

class PageViewApp extends Template {
  @override
  Component build(context) {
    return PageView(pages: [
      Page(
        path: "/",
        builder: (p0) => Span(
          text: "Home",
        ),
      ),
      Page(
        path: "/page",
        builder: (param) => PageView(
          pages: [
            Page(
              path: "/page/res",
              builder: (params) => Span(
                text: params.toString(),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
