import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:kitawi/kitawi.dart';

class Stack {
  final String path;
  final Element element;

  Stack({required this.path, required this.element});
}

List<Stack> stacks = [];

/// Global navigator instance.
late Navigator navigator;

class Navigator {
  /// The routes that will be used by the navigator.
  ///
  /// The key is the path of the route. The initial route should be `/` unless Route explicitly
  /// specifies a different path.
  ///
  final Map<String, Route> routes;

  Navigator({required this.routes});

  HTMLElement? target;

  String get currentPath => stacks.isNotEmpty ? stacks.last.path : '/';

  void clear({
    String? path,
    bool all = false,
  }) {
    if (all) {
      for (var stack in stacks) {
        stack.element.remove();
      }
      stacks.clear();
    } else {
      for (var stack in stacks) {
        if (path != null && stack.path == path) {
          continue;
        }

        stack.element.remove();
      }
    }
  }

  void init(String target) {
    this.target = document.querySelector(target) as HTMLElement?;
    if (this.target == null) {
      throw Exception('Element with id $target not found');
    }

    navigator = this;

    window.onPopState.listen((event) {
      if (window.getProperty("ENV" as JSAny).dartify() == "dev") {
        final path = window.location.hash.substring(1);
        push(path);
        return;
      }

      final path = window.location.pathname;
      push(path);
    });

    if (window.getProperty("ENV" as JSAny).dartify() == "dev") {
      final hash = window.location.hash;
      push(
        hash.isEmpty ? '/' : hash.substring(1),
      );
      return;
    }

    final path = window.location.pathname;
    push(path);
  }

  Route? _match(String path) {
    for (final key in routes.keys) {
      if (key == path) {
        return routes[key];
      }

      final route = routes[key];
      final routePaths = key.split('/');
      final pathParts = path.split('/');

      if (routePaths.length != pathParts.length) {
        continue;
      }

      var params = <String, String>{};
      var match = true;
      for (var i = 0; i < routePaths.length; i++) {
        if (routePaths[i] != pathParts[i] && !routePaths[i].startsWith(':')) {
          match = false;
          break;
        }

        if (routePaths[i].startsWith(':')) {
          params[routePaths[i].substring(1)] = pathParts[i];
        }
      }

      if (match) {
        route?.params = params;
        return route;
      }
    }
    return null;
  }

  bool canGoBack() {
    return stacks.length > 1;
  }

  /// If [replace] is true, the current route will be replaced with the new route.
  /// and new navigation stack will be created.
  void push(
    String path, {
    bool replace = false,
  }) {
    final route = _match(path);

    if (route != null) {
      clear(path: replace ? null : path, all: replace);

      route.beforeRender?.call();

      // find in stack if it exists
      if (!replace && stacks.any((stack) => stack.path == path)) {
        final stack = stacks.firstWhere((stack) => stack.path == path);
        target!.append(stack.element);
      } else {
        final el = route.component(route.params).render();
        target!.append(el);

        stacks.add(Stack(path: path, element: el));
      }

      if (window.getProperty("ENV" as JSAny).dartify() == "dev") {
        window.history.pushState(null, '', "#$path");
        return;
      }
      window.history.pushState(null, '', path);
    }
  }

  /// If [preserveState] is true, the state of the component will be preserved.
  /// If [state] is provided, the data will be passed to the component.
  /// Values can be retrieved using `context.state` property.
  void pop({
    bool? preserveState,
    Map<String, dynamic>? state,
  }) {
    assert(stacks.isNotEmpty, "Stack is empty");
    if (stacks.isNotEmpty) {
      stacks.removeLast();

      if (stacks.isEmpty) {
        return;
      }

      final stack = stacks.last;
      clear();

      if (preserveState == true) {
        final el = stack.element;
        target!.append(el);
        return;
      }

      final route = routes[stack.path];
      if (route != null) {
        final el = route.component(route.params).render();
        target!.append(el);
      }
    }

    throw "Stack is empty";
  }

  void reload() {
    final path = stacks.last.path;
    push(path, replace: true);
  }
}
