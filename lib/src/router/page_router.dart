import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// The [Router] class is used to navigate between routes.
///
/// The following methods are available:
/// - [init] - Initializes the router with a `builder` function to render the default route.
/// - [pushNamed] - Navigates to a named `route` using the given `builder` function to render it.
/// - [push] - Navigates to a `route` using the given `builder` function to render it.
/// - [pop] - Pops the current route and navigates to the previous route.
/// - [popUntil] - Pops all routes until the `route` is reached, and renders it.
class Router {
  static final Map<String, Widget Function()> _routes = {};
  static Element? root;

  /// Initializes the router with a [builder] function to render the default route.
  static void init(Widget Function() builder, Element? root) {
    Router.root = root;
    if (_routes.isEmpty) {
      _routes['/'] = builder;
      root?.children.add(builder().render());
    } else {
      root?.children.add(_routes[_routes.keys.last]!().render());
    }
  }

  /// Navigates to a named [route] using the given [builder] function to render it.
  /// If [replace] is `true`, replaces the current route with the new route.
  /// If [clean] is `true`, clears all routes and sets the new route as the default.
  static void pushNamed({
    required String route,
    required Widget Function() builder,
    bool replace = false,
    bool clean = false,
    dynamic arguments,
  }) {
    assert(!(clean && replace),
        'clean and replace cannot be true at the same time');

    void renderWidget(Widget Function() builder) {
      final container = root;
      container?.children.clear();
      container?.children.add(builder().render());
    }

    if (replace) {
      //find the route and replace it
      for (var key in _routes.keys) {
        if (key == route) {
          _routes[key] = builder;
          renderWidget(builder);
          return;
        }
      }
    }

    if (clean) {
      _routes.clear();
      _routes[route] = builder;
      renderWidget(builder);
      return;
    }

    _routes[route] = builder;
    renderWidget(builder);
  }

  /// Removes the current route from the stack and navigates to the previous route.
  static void pop() {
    _routes.remove(_routes.keys.last);

    var widget = _routes[_routes.keys.last];

    root?.children.clear();
    root?.children.add(widget!().render());
  }

  /// Removes all routes from the stack until the [route] is reached, and renders it.
  static void popUntil(String route) {
    for (var key in _routes.keys) {
      if (key == route) {
        root?.children.clear();
        root?.children.add(_routes[key]!().render());
        return;
      }
    }
  }

  /// Navigates to a new route using the given [builder] function.
  static void push(Widget Function() builder) {
    _routes['/${_routes.length}'] = builder;

    final container = root;

    container?.children.clear();

    container?.children.add(builder().render());
  }
}
