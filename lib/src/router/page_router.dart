import 'dart:html';

import 'package:kitawi/kitawi.dart';

class Router {
  static final Map<String, Widget Function()> _routes = {};

  static String? root = document.body?.children.first.id;

  static void init(Widget Function() builder) {
    _routes['/'] = builder;
  }

  static void pushNamed(String route, Widget Function() builder,
      {bool replace = false, bool clean = false, dynamic arguments}) {
    assert(!(clean && replace),
        'clean and replace cannot be true at the same time');

    injectBuilder(Widget Function() builder) {
      final container = document.getElementById(root!);
      container?.children.clear();
      container?.children.add(builder().render());
    }

    if (replace) {
      //find the route and replace it
      for (var key in _routes.keys) {
        if (key == route) {
          _routes[key] = builder;
          injectBuilder(builder);
          return;
        }
      }
    }

    if (clean) {
      _routes.clear();
      _routes[route] = builder;
      injectBuilder(builder);
      return;
    }

    _routes[route] = builder;
    injectBuilder(builder);
  }

  static void pop() {
    //remove the last route
    _routes.remove(_routes.keys.last);

    var widget = _routes[_routes.keys.last];

    document.getElementById(root!)?.children.clear();
    document.getElementById(root!)?.children.add(widget!().render());
  }

  static void popUntil(String route) {
    for (var key in _routes.keys) {
      if (key == route) {
        document.getElementById(root!)?.children.clear();
        document.getElementById(root!)?.children.add(_routes[key]!().render());
        return;
      }
    }
  }

  static void push(Widget Function() builder) {
    _routes['/${_routes.length}'] = builder;

    final container = document.getElementById(root!);

    container?.children.clear();

    container?.children.add(builder().render());
  }
}
