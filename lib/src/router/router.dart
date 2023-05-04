import 'dart:html';

import 'package:kitawi/widgets.dart';

/// The [Router] class is used to navigate between routes.
///
/// The following methods are available:
/// - [init] - Initializes the router with a `builder` function to render the default route.
/// - [push] - Navigates to a `route` using the given `builder` function to render it.
/// - [pop] - Pops the current route and navigates to the previous route.
class Router {
  static final List<Route> _routes = [];
  static late Element? _root;
  static final List<String> _history = [];
  static late String currentPath;

  static void init({
    List<Route>? routes,
    Element? root,
  }) {
    try {
      _routes.clear();
      _routes.addAll(routes ?? []);
      _root = root;

      currentPath = window.location.hash.isNotEmpty
          ? window.location.hash.substring(1)
          : '/';

      var route = _routes.firstWhere((r) => r.path == currentPath);
      _history.add(route.path);
      render(route.builder(null), _root);

      // Set the URL to the current route
      window.history.replaceState(null, '', "#${route.path}");

      window.onPopState.listen((event) {
        currentPath = window.location.hash.isNotEmpty
            ? window.location.hash.substring(1)
            : '/';

        var route = _routes.firstWhere((r) => r.path == currentPath);
        _history.add(route.path);
        render(route.builder(null), _root);
      });
    } catch (e) {
      // if e is a StateError, then no route was found
      var message = e is StateError ? 'Path not found' : e.toString();

      // no route found
      render(ErrorWidget(message: message, details: e.toString()), root);
    }
  }

  /// This method pushes a named route to the route stacl
  ///
  /// See also:
  /// - Router.init(List, root) - Initializes named routes
  static void pushNamed(String path, {bool replace = false, dynamic args}) {
    try {
      var route = _routes.firstWhere((r) => r.path == path);
      print(route);
      _history.add(route.path);

      render(route.builder(args), _root);

      // Update the URL to the new route
      window.history.pushState(null, '', "/#$path");
    } catch (e) {
      // if e is a StateError, then no route was found
      var message = e is StateError ? 'Path not found' : e.toString();

      // no route found
      render(ErrorWidget(message: message, details: e.toString()), _root);
    }
  }

  static void push(Widget Function() builder, {bool replace = false}) {
    // generate a random path
    var path = '/${DateTime.now().millisecondsSinceEpoch}';

    _history.add(path);
    render(builder(), _root);

    // Update the URL to the new route
    window.history.pushState(null, '', "/#$path");
  }

  static void pop({dynamic args}) {
    try {
      _history.removeLast();
      window.history.back();
    } catch (e) {
      print(e);
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
  final Widget Function(dynamic args) builder;

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
