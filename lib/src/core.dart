import 'package:web/web.dart';

import 'components/component.dart';

/// Determines the debug mode of the library.
bool DEBUG = false;

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
      DEBUG = debug!;
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
