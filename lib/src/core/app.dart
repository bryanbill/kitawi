import 'dart:html';

import 'package:kitawi/kitawi.dart';

/// An enum representing the environment of the application.
enum Environment {
  /// The development environment.
  dev,

  /// The production environment.
  prod,
}

/// Initializes the application by setting up the root element, the router, and the theme.
///
/// * [routes] is a list of [Route] objects that define the application's routes.
///
/// * [id] is the ID of the root element, and defaults to 'root' if not provided.
///
/// * [env] is the environment of the application, and defaults to [Environment.dev] if not provided.
///
/// * [theme] is the light theme to use, and is optional.
///
/// * [darkTheme] is the dark theme to use, and is optional.
///
/// * [themeMode] is the mode to use for the theme, and defaults to [ThemeMode.system] if not provided.
void run(
  List<Route> routes, {
  String? id,
  Environment env = Environment.dev,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeMode? themeMode = ThemeMode.system,
}) {
  // Set the height, padding, margin, and box sizing of the HTML and body elements.
  document.documentElement?.style.height = '100%';
  document.body?.style.height = '100%';
  document.body?.style.padding = '0';
  document.body?.style.margin = '0';
  document.body?.style.boxSizing = 'border-box';

  // Set up the root element.
  var root = document.getElementById(id ?? 'root')
    ?..style.height = '100%'
    ..style.padding = '0'
    ..style.margin = '0';

  // Initialize the theme.
  Theme.init(
    theme: theme ?? Theme.light(),
    darkTheme: darkTheme ?? Theme.dark(),
    themeMode: themeMode,
  );

  // Initialize the router.
  if (env == Environment.dev) {
    Router.init(root: root, routes: routes);
  } else {
    window.onLoad.listen((event) {
      Router.init(root: root, routes: routes);
    });
  }
}

/// Renders the given [widget] to the given [element], replacing its children.
///
/// If [element] is `null`, the widget will not be rendered.
void render(Widget widget, Element? element) {
  if (element != null) {
    // Clear the element's children and add the widget's rendered element.
    element.children.clear();
    element.children.add(widget.render());
  }
}
