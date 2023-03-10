import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// The [Router] class is used to navigate between routes.
///
/// The following methods are available:
/// - [init] - Initializes the router with a `builder` function to render the default route.
/// - [push] - Navigates to a `route` using the given `builder` function to render it.
/// - [pop] - Pops the current route and navigates to the previous route.
/// - [popUntil] - Pops all routes until the `route` is reached, and renders it.
class Router {
  static final List<Route> _routes = [];
  static late Element? _root;
  static final List<String> _history = [];
  static final String currentPath = window.location.hash.substring(1);

  static void init({
    List<Route>? routes,
    Element? root,
  }) {
    try {
      _routes.clear();
      _routes.addAll(routes ?? []);
      _root = root;

      print(currentPath);
      var route = _routes.firstWhere((r) => r.path == currentPath);
      _history.add(route.path);
      render(route.builder(), _root);

      // Set the URL to the current route
      window.history.replaceState(null, '', "#${route.path}");
    } catch (e) {
      // if e is a StateError, then no route was found
      var message = e is StateError ? 'Path not found' : e.toString();

      // no route found
      render(ErrorWidget(message: message, details: e.toString()), root);
    }
  }

  static void push(String path) {
    try {
      var route = _routes.firstWhere((r) => r.path == path);
      _history.add(route.path);
      render(route.builder(), _root);

      // Update the URL to the new route
      window.history.pushState(null, '', "/#$path");
    } catch (e) {
      // if e is a StateError, then no route was found
      var message = e is StateError ? 'Path not found' : e.toString();

      // no route found
      render(ErrorWidget(message: message, details: e.toString()), _root);
    }
  }

  static void pop() {
    _history.removeLast();
    var route = _routes.firstWhere((r) => r.path == _history.last);
    render(route.builder(), _root);

    // Update the URL to the previous route
    window.history.replaceState(null, '', "/#${route.path}");
  }

  static void popUntil(String path) {
    try {
      while (_history.isNotEmpty && _history.last != path) {
        _history.removeLast();
      }
      var route = _routes.firstWhere((r) => r.path == _history.last,
          orElse: () => _routes.firstWhere((r) => r.path == path));

      render(route.builder(), _root);

      // Update the URL to the final route
      window.history.replaceState(null, '', "/#${route.path}");
    } catch (e) {
      // if e is a StateError, then no route was found
      var message = e is StateError ? 'Path not found' : e.toString();

      // no route found
      render(ErrorWidget(message: message, details: e.toString()), _root);
    }
  }
}

/// The [Route] class is used to represent a route in the application.
/// It contains the following properties:
/// - [name] - The name of the route.
/// - [builder] - The builder function used to render the route.
/// - [path] - The path of the route.

class Route {
  /// The [name] property is the name of the route.
  final String? name;

  /// The [builder] property is the builder function used to render the route.
  final Widget Function() builder;

  /// The [path] property is the path of the route.
  final String path;

  /// The [Route] constructor is used to create a new [Route] object.
  ///
  /// The [name] argument is the name of the route.
  /// The [builder] function is called to render the route.
  /// The [path] is the path of the route.

  Route({
    this.name,
    required this.builder,
    this.path = '',
  });

  @override
  String toString() {
    return 'Route(name: $name, builder: $builder, path: $path)';
  }
}
