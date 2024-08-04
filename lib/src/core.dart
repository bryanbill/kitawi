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
  Stream<String> pathStream = Stream.empty();

  final StreamController<String> _controller = StreamController<String>();
  Router() {
    pathStream = _controller.stream;

    window.onPopState.listen(
      (event) {
        init();
      },
    );

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
      _controller.add(path.substring(1));
    }
  }

  final Set<String> _history = {};

  void push(String path) {
    if (_history.isNotEmpty && path == _history.last) {
      return;
    }

    _history.add(path);
    window.location.hash = path;
  }

  void pop() {
    if (_history.length > 1) {
      _history.remove(_history.last);
      final path = _history.last;
      _controller.add(path);
      window.history.pushState({}.toJSBox, '', path);
    }
  }

  void listen(void Function(String) callback) {
    pathStream.listen(callback);
  }
}

var router = Router();
