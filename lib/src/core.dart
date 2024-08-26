import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart';

import 'components/component.dart';

/// Determines the debug mode of the library.
bool kDEBUG = false;

class App {
  final bool? debug;

  final String? target;

  final String? title;

  final List<Component>? children;

  final Function(Document)? onRender;

  /// This style will be applied to the container element [target].
  final Map<String, dynamic>? style;

  /// This class will be applied to the container element [target].
  final String? className;

  /// Creates a new instance of [App].
  ///
  /// The [debug] parameter is used to determine the debug mode of the library.
  /// The [target] parameter is used to determine the target element where the
  /// components will be rendered.
  /// The [children] parameter is used to determine the children components that
  App({
    this.debug,
    this.target = "#app",
    this.title = "Kitawi",
    this.children,
    this.onRender,
    this.style,
    this.className,
  });

  void run() {
    if (debug != null) {
      kDEBUG = debug!;
    }

    if (target != null) {
      final element = document.querySelector(target!);
      if (element == null) {
        throw Exception('Element with id $target not found');
      }

      if (style != null) {
        final styleString = style!.entries
            .map((entry) => "${entry.key}: ${entry.value};")
            .join(" ");

        element.setAttribute('style', styleString);
      }

      if (className != null) {
        element.className = className!;
      }

      if (children != null) {
        for (final child in children!) {
          element.append(child.render());
        }
      }

      if (title != null) {
        document.title = title!;
      }

      if (onRender != null) {
        onRender!(document);
      }
    }
  }
}

class Router {
  final StreamController<String> _controller =
      StreamController<String>.broadcast();

  final bool? hasInitialPage;
  Router({
    this.hasInitialPage = false,
  });

  void create() {
    window.onPopState.listen(
      (event) {
        init();
      },
    );

    if (hasInitialPage == true) return;
    init();
  }

  void init() {
    var path = window.location.hash;

    if (path.contains("?")) {
      path = path.substring(0, path.indexOf("?"));
    }

    if (path.contains("?")) {
      path = path.substring(0, path.indexOf("?"));
    }

    if (path.startsWith("#")) {
      _controller.sink.add(path.substring(1));
    }

    if (path.isEmpty) {
      _controller.sink.add('/');
    }
  }

  final Set<String> _history = {};

  void push(String path) {
    _history.add(path);
    window.location.hash = path;

    window.scrollTo(0.toJS, 0);
  }

  void pop() {
    if (_history.length > 1) {
      _history.remove(_history.last);
      final path = _history.last;
      _controller.sink.add(path);
      window.history.pushState({}.toJSBox, '', path);
    }
  }

  void listen(void Function(String) callback) {
    _controller.stream.listen(callback);
  }
}
